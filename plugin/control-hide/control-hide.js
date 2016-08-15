(function () {
  Reveal.configure({
    keyboard: {
      67: function () {
        Reveal.configure({ controls: !Reveal.getConfig().controls });
      }
    }
  })
})();
