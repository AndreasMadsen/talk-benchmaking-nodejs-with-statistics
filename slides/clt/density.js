(function () {
  const mean = 0.02;
  const sd = Math.sqrt(0.000002);

  const margin = {top: 10, right: 30, bottom: 30, left: 30};
  const width = 700 - margin.left - margin.right;
  const height = 220 - margin.top - margin.bottom;

  head.ready(["d3.min.js", "bundle.js"], function () {
    const distributions = window.require('distributions');
    const normal = distributions.Normal(mean, sd);

    const svg = d3.select("#clt-d3-density").append("svg")
      .attr("class", "d3")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom);

    const container = svg.append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    const plot = new Plot(container, normal);

    plot.area(0, 0.05);
    plot.area(0.2, 0.6);
    plot.area(0.99, 1);
    plot.line(0, 1);
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
      .attr("class", "text")
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

})();
