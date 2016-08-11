const dist = require('distributions');

function interval(arr) {
  const n = arr.length;
  const μ = sum(arr) / n;
  const σ = Math.sqrt(sum(
    arr.map(x => Math.pow(x - μ, 2))
  ) / (n - 1));

  const se = σ / Math.sqrt(n);
  const t = dist.Studentt(n - 1);

  return [
    μ + t.inv(0.025) * se,
    μ + t.inv(0.975) * se
  ];
}

module.exports = interval;

function sum(list) {
  let s = 0;
  for (const x of list) s += x;
  return s;
}
