(function () {
  const section = document.currentScript.parentNode;
  const article = document.getElementById('mavg-d3-visualization');

  const margin = {top: 10, right: 30, bottom: 30, left: 30};
  const width = 850 - margin.left - margin.right;
  const height = 300 - margin.top - margin.bottom;

  let state = null;

  head.ready(["d3.min.js", "bundle.js"], function () {
    state = new State();

    if (Reveal.getCurrentSlide() === section) {
      state.start();
    }
  });

  Reveal.addEventListener('slidechanged', function(event) {
    if (state && event.previousSlide === section) {
      state.stop();
    } else if (state && event.currentSlide === section) {
      state.start();
    }
  });

  function State() {
    // create chart and normal distribution sampler
    this.chart = new MovingAverage(0.5, 0.1);
    this.sampler = normalDistributionSampler(1);
    this.timer = null;

    // initialize observations
    for (let i = 0; i < 170; i++) {
      this.sample();
    }
  }

  State.prototype.sample = function () {
    const outlier = Math.random() < 0.1;
    const mean = outlier ? 0.8 : 0.5;
    this.chart.push((this.sampler.next().value / 10) + mean);
  };

  State.prototype.start = function () {
    this.timer = setInterval(this.sample.bind(this), 60);
  };

  State.prototype.stop = function () {
    clearInterval(this.timer);
  };

  function* normalDistributionSampler(truncate) {
    while (true) {
      const u1 = Math.random();
      const u2 = Math.random();
      const factor = Math.sqrt(-2*Math.log(u1));
      const theta = 2 * Math.PI * u2;

      const value1 = factor * Math.cos(theta);
      const value2 = factor * Math.sin(theta);

      if (Math.max(Math.abs(value1), Math.abs(value2)) < truncate) {
        yield value1;
        yield value2;
      }
    }
  }

  function MovingAverage(trueAverage, forget) {
    this.svg = d3.select("#mavg-d3-visualization").append("svg")
      .attr("class", "d3")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom);

    this.chart = this.svg.append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    this.x = d3.scaleLinear()
      .range([0, width])
      .domain([-150, 10]);
    this.xaxis = d3.axisBottom(this.x);

    this.y = d3.scaleLinear()
      .range([height, 0])
      .domain([0, 1]);
    this.yaxis = d3.axisLeft(this.y);

    this.chart.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(this.xaxis);

    this.chart.append("g")
      .attr("class", "y axis")
      .call(this.yaxis);

    this.averageContent = this.chart.append("g").append('path');
    this.intervalContent = this.chart.append("g").append('path');
    this.forcastContent = this.chart.append("g").append('path');
    this.circleContent = this.chart.append("g");

    this._lineDrawer = d3.line()
			.x((d) => this.x(d.time))
			.y((d) => this.y(d.average));

    this._areaDrawer = d3.area()
			.x((d) => this.x(d.time))
      .y1((d) => this.y(d.average + d.interval))
			.y0((d) => this.y(d.average - d.interval));

    this.cumerror = 0;
    this.forget = forget;
    this.average = trueAverage;
    this.timeindex = 0;
    this.observations = [];
  }

  MovingAverage.prototype.push = function (obs) {
    let outlier = false;
    let interval = 0;

    if (this.timeindex >= 10) {
      const dist = window.require('distributions');
      const n = this.timeindex;
      const variance = this.cumerror / (n - 1);
      const se = Math.sqrt(variance * (1 + 1/n));

      const t = dist.Studentt(n - 1);
      const t_alpha = t.inv(1 - 0.01 / 2);
      interval = t_alpha * se;

      if (obs <= this.average - interval || obs >= this.average + interval) {
        outlier = true;
      }
    }

    this.average = this.forget * obs + (1 - this.forget) * this.average;
    this.cumerror += Math.pow(this.average - obs, 2);

    this.observations.push({
      value: obs,
      average: this.average,
      time: ++this.timeindex,
      outlier: outlier,
      interval: interval
    });

    this._updateCircle();
    this._updateAverage();
    this._updateForcast();
    this._updateAxis();

    if (this.observations.length > 151) {
      this.observations.shift();
    }
  };

  MovingAverage.prototype._updateCircle = function () {
    var t = d3.transition().duration(750);

    // JOIN new data with old elements.
    const points = this.circleContent.selectAll("circle")
      .data(this.observations.slice(0), function(d) { return d.time; });

    // EXIT old elements not present in new data.
    points.exit()
      .remove();

    // UPDATE old elements present in new data.
    points
      .attr("cy", (d) => this.y(d.value))
      .attr("cx", (d) => this.x(d.time));

    // ENTER new elements present in new data.
    points.enter()
      .append("circle")
        .attr("r", 3.5)
        .classed('outlier', (d) => d.outlier)
        .attr("cy", (d) => this.y(d.value))
        .attr("cx", (d) => this.x(d.time));
  }

  MovingAverage.prototype._updateAverage = function () {
    this.averageContent
      .datum(this.observations.slice(0))
      .attr('class', 'average')
      .attr("d", this._lineDrawer);

    this.intervalContent
      .datum(this.observations.slice(0))
      .attr('class', 'interval')
      .attr("d", this._areaDrawer);
  }

  MovingAverage.prototype._updateForcast = function () {
    const dist = window.require('distributions');

    const n = this.timeindex;
    if (n < 2) return;

    const variance = this.cumerror / (n - 1);
    const se = Math.sqrt(variance * (1 + 1/n));

    const t = dist.Studentt(n - 1);
    const t_alpha = t.inv(1 - 0.01 / 2);

    const interval = [
      {
        time: this.timeindex,
        average: this.average,
        interval: t_alpha * se,
      },
      {
        time: this.timeindex + 10,
        average: this.average,
        interval: t_alpha * se
      }
    ];

    this.forcastContent
      .datum(interval)
      .attr('class', 'forcast')
      .attr("d", this._areaDrawer);
  };

  MovingAverage.prototype._updateAxis = function () {
    this.x
      .domain([this.timeindex - 150, this.timeindex + 10]);

    this.chart.select("g.x.axis")
      .call(this.xaxis);
  }

})();
