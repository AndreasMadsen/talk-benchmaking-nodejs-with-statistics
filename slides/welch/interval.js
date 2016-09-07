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

  //  rgamma(100, 100, 1/(0.095/100))
  const obsA = [
    0.0955,0.1078,0.0918,0.1085,0.0989,0.0932,0.0914,0.0918,0.0954,0.0847,
    0.1179,0.0997,0.0812,0.0992,0.0996,0.0941,0.0894,0.0849,0.0902,0.0931,
    0.085,0.082,0.0881,0.1004,0.1189,0.0977,0.0984,0.102,0.1053,0.0934,
    0.1031,0.0912,0.0949,0.0934,0.0897,0.0901,0.1021,0.0958,0.1094,0.091,
    0.1131,0.0806,0.0914,0.091,0.078,0.1094,0.0957,0.0864,0.1197,0.1007,
    0.1023,0.0886,0.0945,0.1027,0.1031,0.0876,0.0865,0.0946,0.1046,0.0902,
    0.079,0.0976,0.0972,0.0852,0.0929,0.084,0.0843,0.0945,0.0731,0.0952,
    0.1019,0.089,0.1051,0.1068,0.1081,0.0984,0.0888,0.1007,0.1139,0.1039,
    0.1145,0.086,0.0842,0.0949,0.098,0.1009,0.0895,0.0925,0.1005,0.0846,
    0.1055,0.0812,0.1026,0.0823,0.0934,0.0962,0.0954,0.0777,0.0999,0.0918
  ];

  // rgamma(100, 100, 1/(0.105/100))
  const obsB = [
    0.0961,0.1056,0.1064,0.1084,0.1024,0.1014,0.0897,0.1132,0.1071,0.0992,
    0.1053,0.0998,0.0893,0.0905,0.1095,0.1183,0.1011,0.102,0.0967,0.1115,
    0.1098,0.0986,0.1081,0.1137,0.0931,0.1102,0.1012,0.1126,0.103,0.1054,
    0.1122,0.1156,0.1065,0.0964,0.0894,0.1011,0.1149,0.1089,0.1043,0.1145,
    0.1039,0.1152,0.1098,0.112,0.1154,0.1113,0.0862,0.0876,0.1089,0.0991,
    0.1208,0.0981,0.1185,0.0861,0.0974,0.1089,0.1015,0.1174,0.1054,0.0983,
    0.0987,0.0995,0.1024,0.1245,0.0942,0.1018,0.1045,0.0916,0.1162,0.1069,
    0.1075,0.1162,0.1183,0.1029,0.1304,0.0979,0.1284,0.0918,0.1066,0.1117,
    0.0883,0.0875,0.1157,0.0937,0.1131,0.1074,0.0998,0.1217,0.123,0.1104,
    0.0869,0.1199,0.0965,0.1061,0.0901,0.1284,0.1029,0.0995,0.0998,0.0905
  ];

  const margin = {top: 10, right: 30, bottom: 30, left: 30};
  const width = 700 - margin.left - margin.right;
  const height = 220 - margin.top - margin.bottom;
  const bins = 200;

  Reveal.addEventListener('fragmentshown', function(event) {
    if (event.fragment.parentNode.id !== 'welch-interval-logic') return;
    if (state) state.set(getFragmentIndex());
  });

  Reveal.addEventListener('fragmenthidden', function(event) {
    if (event.fragment.parentNode.id !== 'welch-interval-logic') return;
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
    state = new State();
    state.observations(100);
    state.set(getFragmentIndex());
    if (Reveal.getCurrentSlide() !== section) state.pause();
  });

  function State() {
    const sd = Math.sqrt(100 * (0.1/100) * (0.1/100));
    const xdomain = [
      0.095 - 3 * sd,
      0.105 + 3 * sd
    ];
    const ydomain = [
      0, StudenttCustom(100, 0.1, sd / 10).pdf(0.1) * 1.2
    ];

    const svg = d3.select("#welch-d3-interval").append("svg")
      .attr("class", "d3")
      .attr("width", width + margin.left + margin.right)
      .attr("height", 2 * (height + margin.top + margin.bottom));

    const observationsContainer = svg.append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
    const meanContainer = svg.append("g")
      .attr("transform", "translate(" + margin.left + "," + (height + margin.bottom + 2 * margin.top) + ")");

    this.obs = new Plot(observationsContainer, xdomain, ydomain);
    this.mean = new Plot(meanContainer, xdomain, ydomain);

    this.animatorTimer = null;
    this.observationsDrawn = 0;
  }

  State.prototype.pause = function () {
    clearInterval(this.animatorTimer);
  };

  State.prototype.resume = function () {
    this.set(getFragmentIndex());
  };

  State.prototype.observations = function (count) {
    const summary = window.require('summary');
    const ttest = window.require('ttest');

    this.observationsDrawn = count;

    this.obs.clearObservations()
    for (let i = 0; i < count; i++) {
      this.obs.drawObservation(obsA[i], 'sourceA');
      this.obs.drawObservation(obsB[i], 'sourceB');
    }

    const statA = summary(obsA.slice(0, count));
    const statB = summary(obsB.slice(0, count));

    this.mean.clearObservations();
    this.mean.clearDistributions();
    this.mean.drawObservation(statA.mean(), 'sourceA');
    this.mean.drawObservation(statB.mean(), 'sourceB');

    this.mean.drawDistribution(
      StudenttCustom(statA.size() - 1, statA.mean(), statA.sd() / Math.sqrt(statA.size())),
      'sourceA');
    this.mean.drawDistribution(
      StudenttCustom(statB.size() - 1, statB.mean(), statB.sd() / Math.sqrt(statB.size())),
      'sourceB'
    );

    const t = ttest(statA, statB);
    if (t.valid()) {
      document.getElementById('welch-significant-status').innerHTML = 'Not signficant';
    } else {
      document.getElementById('welch-significant-status').innerHTML = 'Signficant';
    }

  };

  State.prototype.animator = function (goal) {
    if (this.observationsDrawn === goal) {
      clearInterval(this.animatorTimer);
    }

    const sign = Math.sign(goal - this.observationsDrawn);

    state.observations(this.observationsDrawn + sign);
  };

  State.prototype.set = function (stateIndex) {
    clearInterval(this.animatorTimer);

    if (stateIndex === 0) {
      this.animatorTimer = setInterval(this.animator.bind(this, 100), 20);
    } else if (stateIndex === 1) {
      this.animatorTimer = setInterval(this.animator.bind(this, 19), 20);
    } else if (stateIndex === 2) {
      this.animatorTimer = setInterval(this.animator.bind(this, 9), 20);
    }
  }

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
      .call(d3.axisLeft(this.y).tickValues([]));

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

  Plot.prototype.drawObservation = function (obs, classname) {
    const index = this.binIndex(obs);
    if (index === null) return; // out of axis domain

    this.obs.append('rect')
      .attr("class", "bin" + (classname ? ' ' + classname : ''))
      .attr("x", this.binIndex(obs) * width / bins)
      .attr("width", width / bins)
      .attr("height", height);
  };

  Plot.prototype.clearDistributions = function () {
    this.dist.selectAll('path')
      .remove();
  };

  Plot.prototype._pdf = function (distribution, start, end) {
    const xstart = this.x(
      Math.max(this.x.domain()[0], distribution.inv(start))
    );
    const xend = this.x(
      Math.min(this.x.domain()[1], distribution.inv(end))
    );

    const curve = [];
    for (var xpx = xstart; xpx <= xend; xpx++) {
      var x = this.x.invert(xpx);
      curve.push({
        x: x,
        y: distribution.pdf(x)
      });
    }

    return curve;
  };

  Plot.prototype.drawDistribution = function (distribution, classname) {
    const self = this;

    const area = d3.area()
        .x(function(d) { return self.x(d.x); })
        .y0(height)
        .y1(function(d) { return self.y(d.y); });

    const line = d3.line()
        .x(function(d) { return self.x(d.x); })
        .y(function(d) { return self.y(d.y); });

    this.dist.append("path")
      .attr("class", "area" + (classname ? ' ' + classname : ''))
      .attr("d", area(this._pdf(distribution, 0.025, 0.975)));

    this.dist.append("path")
      .attr("class", "line" + (classname ? ' ' + classname : ''))
      .attr("d", line(this._pdf(distribution, 0, 1)));
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
