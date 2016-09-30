(function () {
  const section = document.currentScript.parentNode;

  const animation = new Animation(
    section.querySelector('pre.output')
  );

  Reveal.addEventListener('slidechanged', function(event) {
    if (event.previousSlide === section) {
      animation.stop();
    } else if (event.currentSlide === section) {
      animation.start();
    }
  });

  function currentSlideCheck() {
    if (Reveal.getCurrentSlide() === section) {
      animation.start();
    }
  }

  function Animation(code) {
    this._line = 0;
    this._timer = null;
    this._element = code;
  }

  Animation.prototype._setLine = function (line) {
    this._line = line;
    const newPosition = line * 12 + 5; // line-height is 12px
    const oldPosition = this._element.scrollTop;
    this._element.scrollTop = newPosition;

    // returns true if setLine had an effect
    return newPosition !== oldPosition;
  };

  Animation.prototype._animate = function () {
    if (!this._setLine(this._line + 1)) {
      // no effect stop animation
      this.stop();
    }
  };

  Animation.prototype.start = function () {
    this._setLine(0);
    this._timer = setInterval(this._animate.bind(this), 25);
  };

  Animation.prototype.stop = function () {
    clearInterval(this._timer);
  };

  if (Reveal.isReady()) {
    currentSlideCheck();
  } else {
    Reveal.addEventListener('ready', currentSlideCheck);
  }
})();
