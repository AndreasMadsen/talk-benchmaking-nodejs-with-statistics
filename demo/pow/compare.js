function benchmarkMath() {
  var sum = 0;
  for (var i = 0; i < 1000000; i++) {
    sum += Math.pow(i, 2);
  }
  return sum;
}

function benchmarkMult() {
  var sum = 0;
  for (var i = 0; i < 1000000; i++) {
    sum += i * i;
  }
  return sum;
}

for (var i = 0; i < 1e2; i++) {
  var tick = process.hrtime();
  assert(benchmarkMath() > 0);
  var tock = process.hrtime(tick);
  var math = 1000000 / hr2s(tock);

  var tick = process.hrtime();
  assert(benchmarkMult() > 0);
  var tock = process.hrtime(tick);
  var mult = 1000000 / hr2s(tock);

  if (math > mult) {
    console.log(`${math} > ${mult}`);
  } else {
    console.log(`${math} < ${mult}`);    
  }
}

function assert(status) {
  if (!status) throw "assert";
}

function hr2s(hr) {
  return hr[0] + hr[1] * 1e-9;
}
