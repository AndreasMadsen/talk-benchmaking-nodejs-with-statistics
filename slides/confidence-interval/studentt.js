(function () {
  const section = document.currentScript.parentNode;

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

  const margin = {top: 10, right: 30, bottom: 30, left: 30};
  const width = 600 - margin.left - margin.right;
  const height = 220 - margin.top - margin.bottom;
  const bins = 200;

  // Sampled from `rgamma(100, 100, 1/(0.1/100))`
  const observations = [
    0.099,0.0911,0.1077,0.1155,0.101,0.1062,0.1142,0.1083,0.1096,0.1006,
    0.0944,0.1016,0.1095,0.1096,0.0999,0.0992,0.0896,0.0978,0.0877,0.1039,
    0.0962,0.09,0.1195,0.1148,0.0925,0.1072,0.1012,0.0907,0.0869,0.1096,
    0.1103,0.0959,0.1114,0.0883,0.0911,0.1109,0.1073,0.0923,0.0872,0.0929,
    0.1073,0.0893,0.1102,0.1264,0.0998,0.0932,0.0943,0.1023,0.1037,0.1062,
    0.0928,0.0986,0.094,0.1,0.1058,0.1038,0.0922,0.1051,0.0953,0.1091,
    0.0914,0.0989,0.0996,0.1006,0.103,0.1179,0.0982,0.1009,0.1085,0.0932,
    0.1174,0.1025,0.0917,0.1079,0.1003,0.0925,0.1131,0.0952,0.0957,0.1034,
    0.0947,0.095,0.1147,0.111,0.1139,0.1042,0.1026,0.101,0.1105,0.1029,
    0.0837,0.0882,0.0957,0.0976,0.114,0.0865,0.1024,0.1013,0.0903,0.0928
  ];
  const mean = 0.1;
  const sd = Math.sqrt(100 * (0.1/100) * (0.1/100));

  Reveal.addEventListener('fragmentshown', function(event) {
    if (event.fragment.parentNode.id !== 'ci-studentt-logic') return;
    if (state) state.set(getFragmentIndex());
  });

  Reveal.addEventListener('fragmenthidden', function(event) {
    if (event.fragment.parentNode.id !== 'ci-studentt-logic') return;
    if (state) state.set(getFragmentIndex());
  });

  Reveal.addEventListener('slidechanged', function(event) {
    if (event.previousSlide === section) {
      if (state) state.pause();
    } else if (event.currentSlide === section) {
      if (state) state.resume();
    }
  });

  head.ready(["d3.min.js", "bundle.js"], function () {
    const distributions = window.require('distributions');

    state = new State();
    state.normal.drawDistribution(distributions.Normal(mean, sd));
    state.set(getFragmentIndex());
    if (Reveal.getCurrentSlide() !== section) state.pause();
  });

  function State() {
    this.observationsDrawn = 0;
    this.animatorTimer = null;

    const xdomain = [Math.max(0, mean - 3 * sd), mean + 3 * sd];
    const ydomain = [0, StudenttCustom(100, mean, sd / 10).pdf(mean) * 1.2];

    const distributions = window.require('distributions');
    const svg = d3.select("#ci-d3-studentt").append("svg")
      .attr("class", "d3")
      .attr("width", width + margin.left + margin.right)
      .attr("height", 2 * (height + margin.top + margin.bottom));

    const normalContainer = svg.append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
    const studenttContainer = svg.append("g")
      .attr("transform", "translate(" + margin.left + "," + (height + margin.bottom + 2 * margin.top) + ")");

    this.normal = new Plot(normalContainer, xdomain, ydomain);
    this.studentt = new Plot(studenttContainer, xdomain, ydomain);
  }

  State.prototype.pause = function () {
    clearInterval(this.animatorTimer);
  };

  State.prototype.resume = function () {
    this.set(getFragmentIndex());
  };

  State.prototype.drawObservations = function (count) {
    const summary = window.require('summary');
    this.observationsDrawn = count;

    const obs = [];
    this.normal.clearObservations();
    for (var i = 0; i < count; i++) {
      obs.push(observations[i]);
      this.normal.drawObservation(observations[i]);
    }

    return summary(obs);
  };

  State.prototype.animator = function () {
    const distributions = window.require('distributions');

    if (this.observationsDrawn === observations.length) {
      return clearInterval(this.animatorTimer);
    }

    const stat = this.drawObservations(this.observationsDrawn + 1);
    const se = stat.sd() / Math.sqrt(stat.size());

    console.log(stat.size());

    this.studentt.clearDistributions();
    this.studentt.clearObservations();
    this.studentt.drawObservation(stat.mean());
    this.studentt.drawDistribution(distributions.Normal(stat.mean(), se));
    this.studentt.drawDistribution(StudenttCustom(stat.size() - 1, stat.mean(), se));
  };

  State.prototype.set = function (stateIndex) {
    const distributions = window.require('distributions');

    clearInterval(this.animatorTimer);

    if (stateIndex === 0) {
      const stat = this.drawObservations(5);
      const se = stat.sd() / Math.sqrt(stat.size());
      this.studentt.clearDistributions();
      this.studentt.clearObservations();
      this.studentt.drawObservation(stat.mean());
      this.studentt.drawDistribution(distributions.Normal(stat.mean(), se));
    } else if (stateIndex === 1) {
      const stat = this.drawObservations(5);
      const se = stat.sd() / Math.sqrt(stat.size());
      this.studentt.clearDistributions();
      this.studentt.clearObservations();
      this.studentt.drawObservation(stat.mean());
      this.studentt.drawDistribution(distributions.Normal(stat.mean(), se), true);
      this.studentt.drawDistribution(StudenttCustom(stat.size() - 1, stat.mean(), se));
    } else if (stateIndex === 2) {
      this.animatorTimer = setInterval(this.animator.bind(this), 50);
    }
  };

  function Plot(container, xdomain, ydomain) {
    this.container = container;

    this.x = d3.scaleLinear()
      .range([0, width])
      .domain(xdomain);

    this.y = d3.scaleLinear()
      .range([height, 0])
      .domain(ydomain);

    this.container.append("g")
      .attr("class", "axis")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(this.x));

    this.container.append("g")
      .attr("class", "axis")
      .call(d3.axisLeft(this.y));

    this.obs = this.container.append("g")
      .attr("class", "observations");

    this.dist = this.container.append("g")
      .attr("class", "distributions");

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
      .attr("height", height);
  };

  Plot.prototype.clearDistributions = function () {
    this.dist.selectAll('path')
      .remove();
  };

  Plot.prototype.drawDistribution = function (distribution, opacity) {
    const self = this;

    const curve = [];
    for (var xpx = 0; xpx <= width; xpx++) {
      var x = this.x.invert(xpx);
      curve.push({
        x: x,
        y: distribution.pdf(x)
      });
    }

    const line = d3.line()
        .x(function(d) { return self.x(d.x); })
        .y(function(d) { return self.y(d.y); });

    this.dist.append("path")
      .attr("class", "line" + (opacity ? ' opacity' : ''))
      .attr("d", line(curve));
  };

  function StudenttCustom(n, mean, sd) {
    if (!(this instanceof StudenttCustom)) return new StudenttCustom(n, mean, sd);

    this.base = window.require('distributions').Studentt(n);
    this._mean = mean;
    this._sd = sd;
  }
  StudenttCustom.prototype.mean = function () {
    return this._mean;
  };
  StudenttCustom.prototype.median = function () {
    return this._mean;
  };
  StudenttCustom.prototype.variance = function () {
    return this._sd * this._sd;
  };
  StudenttCustom.prototype.inv = function (q) {
    return this.base.inv(q) * this._sd + this._mean;
  };
  StudenttCustom.prototype.pdf = function (x) {
    // https://en.wikipedia.org/wiki/Student%27s_t-distribution#Non-standardized_Student.27s_t-distribution
    return this.base.pdf((x - this._mean) / this._sd) / this._sd;
  };
  StudenttCustom.prototype.cdf = function (x) {
    return this.base.cdf((x - this._mean) / this._sd);
  };
})();
