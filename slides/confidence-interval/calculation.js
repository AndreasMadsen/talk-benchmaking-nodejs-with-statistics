(function () {
  const mean = 0.02;
  const sd = Math.sqrt(0.000002);

  const margin = {top: 20, right: 30, bottom: 30, left: 30};
  const width = 470 - margin.left - margin.right;
  const height = 436 - margin.top - margin.bottom;

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

  head.ready(["d3.min.js", "bundle.js"], function () {
    const distributions = window.require('distributions');
    const summary = window.require('summary');

    const stat = summary(observations.slice(0, 30));
    const normal = StudenttCustom(stat.size(), stat.mean(), stat.sd() / Math.sqrt(stat.size()));

    const svg = d3.select("#ci-d3-calculation").append("svg")
      .attr("class", "d3")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom);

    const container = svg.append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    const plot = new Plot(container, normal);

    plot.area(0.025, 0.975);
    plot.line(0, 1);
    plot.bar(0.1, 'goal', 1);
    plot.bar(stat.mean(), 'estimate');
  });

  function Plot(container, normal) {
    this.container = container;
    this.normal = normal;

    this.x = d3.scaleLinear()
      .range([0, width])
      .domain([
        Math.max(0, normal.mean() - 3 * Math.sqrt(normal.variance())),
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

  Plot.prototype.bar = function (x, name, fragment) {
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

    if (fragment !== undefined) {
      rect
        .attr("data-fragment-index", fragment)
        .classed("fragment", true);
      text
        .attr("data-fragment-index", fragment)
        .classed("fragment", true);
    }
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
