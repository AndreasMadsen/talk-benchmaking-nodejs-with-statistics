(function () {
  const mean = 0.02;
  const sd = Math.sqrt(0.000002);

  const margin = {top: 20, right: 30, bottom: 30, left: 30};
  const width = 480 - margin.left - margin.right;
  const height = 476 - margin.top - margin.bottom;

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

  head.ready(["d3.min.js", "bundle.js"], function () {
    const summary = window.require('summary');
    const ttest = window.require('ttest');

    const statA = summary(obsA.slice(0, 18));
    const statB = summary(obsB.slice(0, 18));

    const t = ttest(statA, statB);
    const normal = StudenttCustom(t.freedom(), t._mean, t._se);

    const svg = d3.select("#welch-d3-code").append("svg")
      .attr("class", "d3")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom);

    const container = svg.append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    const plot = new Plot(container, normal);

    plot.area(0.025, 0.975);
    plot.line(0, 1);
    plot.bar(0, 'no difference');
    plot.bar(t._mean, 'estimated difference');
  });

  function Plot(container, normal) {
    this.container = container;
    this.normal = normal;

    this.x = d3.scaleLinear()
      .range([0, width])
      .domain([
        normal.mean() - 3 * Math.sqrt(normal.variance()),
        normal.mean() + 3 * Math.sqrt(normal.variance())
      ]);

    this.y = d3.scaleLinear()
      .range([height, 0])
      .domain([
        0,
        normal.pdf(normal.mean())
      ]);

    this.container.append("g")
      .attr("class", "axis")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(this.x));

    this.container.append("g")
      .attr("class", "axis")
      .call(d3.axisLeft(this.y));
  }

  Plot.prototype.bar = function (x, name) {
    const rect = this.container.append('rect')
      .attr('x', this.x(x))
      .attr('class', 'bar')
      .attr('width', 1)
      .attr('height', this.y(0));

    const text = this.container.append('text')
      .attr('x', this.x(x))
      .attr('y', -5)
      .attr('class', 'description')
      .text(name);
  };

  Plot.prototype._pdf = function (start, end) {
    const xstart = this.x(
      Math.max(this.x.domain()[0], this.normal.inv(start))
    );
    const xend = this.x(
      Math.min(this.x.domain()[1], this.normal.inv(end))
    );

    const curve = [];
    for (var xpx = xstart; xpx <= xend; xpx++) {
      var x = this.x.invert(xpx);
      curve.push({
        x: x,
        y: this.normal.pdf(x)
      });
    }

    return curve;
  };

  Plot.prototype.area = function (start, end) {
    const self = this;
    const data = this._pdf(start, end);

    const area = d3.area()
        .x(function(d) { return self.x(d.x); })
        .y0(height)
        .y1(function(d) { return self.y(d.y); });

    this.container.append("path")
      .attr("class", "area")
      .attr("d", area(data));

    const xstart = this.x(data[0].x);
    const xend = this.x(data[data.length - 1].x);
    const xmid = (xstart + xend) / 2;

    this.container.append("text")
      .attr("class", "area")
      .attr("x", xmid)
      .attr("y", this.y(50))
      .text(((end - start) * 100).toFixed(0) + ' %');
  };

  Plot.prototype.line = function (start, end) {
    const self = this;
    const data = this._pdf(start, end);

    const line = d3.line()
        .x(function(d) { return self.x(d.x); })
        .y(function(d) { return self.y(d.y); });

    this.container.append("path")
      .attr("class", "line")
      .attr("d", line(data));
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
