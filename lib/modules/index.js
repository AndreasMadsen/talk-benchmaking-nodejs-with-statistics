
const modules = {
  'distributions': require('distributions'),
  'mathfn': require('mathfn'),
  'summary': require('summary')
};

window.require = function (name) {
  if (modules.hasOwnProperty(name)) {
    return modules[name];
  }

  throw new Error('module not bundled');
};
