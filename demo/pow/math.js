function benchmark() {
  var sum = 0;
  for (var i = 0; i < 1000000; i++) {
    sum += Math.pow(i, 2);
  }
  return sum;
}

for (var i = 0; i < 1e2; i++) {
  assert(benchmark() > 0);
}

function assert(status) {
  if (!status) throw "assert";
}
