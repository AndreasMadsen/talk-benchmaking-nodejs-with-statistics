(function () {
  const section = document.currentScript.parentNode;

  var frame = null;
  var state = null;

  function getFragmentIndex() {
    const activeFragments = section
      .querySelectorAll('.fragment.current-visible.visible');
    if (activeFragments.length > 0) {
      const latest = activeFragments[activeFragments.length - 1];
      return (+latest.dataset.fragmentIndex) + 1;
    }
    return 0;
  }

  const thisSlide = document.currentScript.parentNode;
  const margin = {top: 10, right: 30, bottom: 30, left: 30};
  const width = 700 - margin.left - margin.right;
  const height = 440 - 2 * margin.top - 2 * margin.bottom;
  const bins = 200;
  const gamma = new GammaSampler(2, 1e-2);

  Reveal.addEventListener('fragmentshown', function(event) {
    if (event.fragment.parentNode.id !== 'clt-visualization-logic') return;
    if (state) state.set(getFragmentIndex());
  });

  Reveal.addEventListener('fragmenthidden', function(event) {
    if (event.fragment.parentNode.id !== 'clt-visualization-logic') return;
    if (state) state.set(getFragmentIndex());
  });

  Reveal.addEventListener('slidechanged', function(event) {
    if (event.previousSlide === thisSlide) {
      if (state) state.pause();
    } else if (event.currentSlide === thisSlide) {
      if (state) state.resume();
    }
  });

  head.ready("d3.min.js", function() {
    frame = new Frame(d3.select("#clt-d3-visualization"));
    state = new State(frame);
    state.set(getFragmentIndex());
  });

  function State() {
    this.nextSamples = [];
    this.nextMean = null;

    this.stateIndex = 0;
    this.animatorTimer = null;

    this.sample();
  }

  State.prototype.sample = function () {
    this.nextSamples = [];
    this.nextMean = 0;
    for (var i = 0; i < 100; i++) {
      var value = gamma.sample();
      this.nextMean += value;
      this.nextSamples.push(value);
    }
    this.nextMean = this.nextMean / 100;
  };

  State.prototype.animator = function () {
    frame.source.drawObservation(this.nextSamples.pop());

    if (this.nextSamples.length === 0) {
      frame.mean.drawObservation(this.nextMean);
      frame.source.clearObservations();
      this.sample();
    }
  };

  State.prototype.pause = function () {
    clearInterval(this.animatorTimer);
  };

  State.prototype.resume = function () {
    this.set(this.stateIndex);
  };

  State.prototype.set = function (stateIndex) {
    this.stateIndex = stateIndex;
    clearInterval(this.animatorTimer);

    if (stateIndex === 0) {
      frame.source.clearObservations();
      frame.mean.clearObservations();
      frame.mean.clearNormalDistribution();
      this.sample();
    } else if (stateIndex === 1) {
      this.animatorTimer = setInterval(this.animator.bind(this), 80);
      frame.mean.clearNormalDistribution();
    } else if (stateIndex === 2) {
      this.animatorTimer = setInterval(this.animator.bind(this), 5);
      frame.mean.clearNormalDistribution();
    } else if (stateIndex === 3) {
      this.animatorTimer = setInterval(this.animator.bind(this), 5);
      frame.mean.clearNormalDistribution();
      frame.mean.drawNormalDistribution(gamma.mean(), gamma.variance() / 100);
    }
  };

  function Frame(container) {
    const d3 = window.d3;
    frameBuild = true;

    this.svg = d3.select("#clt-d3-visualization").append("svg")
      .attr("class", "d3")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + 2 * margin.top + 2 * margin.bottom);

    this.source = new Plot(
      this.svg
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")"),
      gamma.domain(),
      "iterations",
      height / 2
    );

    this.mean = new Plot(
      this.svg
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + (2 * margin.top + margin.bottom + height / 2) + ")"),
      gamma.domain(),
      "observations",
      height / 2
    );
  }

  function Plot(container, domain, label, height) {
    this.container = container;
    this.height = height;

    this.x = d3.scaleLinear()
      .range([0, width])
      .domain(domain);

    this.y = d3.scaleLinear()
      .range([height, 0])
      .domain([0, 1]);

    this.container.append("g")
      .attr("class", "axis")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(this.x));

    this.container.append("g")
      .attr("class", "axis")
      .call(d3.axisLeft(this.y).tickValues([]));

    this.container.append("text")
      .attr("class", "label")
      .attr("text-anchor", "end")
      .attr("y", 6)
      .attr("dy", ".75em")
      .attr("transform", "rotate(-90)")
      .text(label);

    this.obs = this.container.append("g")
      .attr("class", "observations");

    this.bins = [];
    for (var i = 0; i <= bins; i++) {
      this.bins.push(this.x.invert(i * (width / bins)));
    }
  }

  Plot.prototype.binIndex = function (obs) {
    // who said binary search
    for (var i = 0; i < this.bins.length; i++) {
      if (obs <= this.bins[i + 1]) return i;
    }
    return null;
  };

  Plot.prototype.clearObservations = function () {
    this.obs.selectAll('rect')
      .remove();
  };

  Plot.prototype.drawObservation = function (obs) {
    const index = this.binIndex(obs);
    if (index === null) return; // out of axis domain

    this.obs.append('rect')
      .attr("class", "bin")
      .attr("x", this.binIndex(obs) * width / bins)
      .attr("width", width / bins)
      .attr("height", this.height);
  };

  Plot.prototype.clearNormalDistribution = function () {
    this.container.selectAll('path.distribution')
      .remove();
  };

  Plot.prototype.drawNormalDistribution = function (mean, variance) {
    const self = this;
    const drawer = d3.line()
      .x(function(d) { return self.x(d.x); })
      .y(function(d) { return self.y(d.y); });

    const normalCurve = [];
    for (var xpx = 0; xpx <= width; xpx++) {
      var x = this.x.invert(xpx);
      normalCurve.push({
        'x': x,
        'y': Math.exp(- (x - mean) * (x - mean) / (2 * variance))
      });
    }

    this.container.append("path")
      .attr("class", "distribution")
      .attr("d", drawer(normalCurve));
  };

  function GammaSampler(shape, scale) {
    // Only works for discrete shape. Scale is the expection of the underlying
    // exponential distribution.
    this.shape = shape;
    this.scale = scale;
  }

  GammaSampler.prototype.exponential = function () {
    return -this.scale * Math.log(Math.random());
  };

  GammaSampler.prototype.sample = function () {
    var sum = 0;
    for (var i = 0; i < this.shape; i++) {
      sum += this.exponential();
    }
    return sum;
  };

  GammaSampler.prototype.variance = function () {
    return this.shape * this.scale * this.scale;
  };

  GammaSampler.prototype.mean = function () {
    return this.shape * this.scale;
  };

  GammaSampler.prototype.domain = function () {
    const mean = this.mean();
    const sd = Math.sqrt(this.variance());
    return [Math.max(0, mean - 3 * sd), mean + 3 * sd];
  };
})();
