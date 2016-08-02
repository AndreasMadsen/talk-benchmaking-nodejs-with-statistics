/**
 * A plugin which enables rendering of math equations inside
 * of reveal.js slides. Essentially a thin wrapper for MathJax.
 *
 * @author Hakim El Hattab
 */
var RevealMath = window.RevealMath || (function(){

	var options = Reveal.getConfig().math || {};
	options.katexScript     = options.katexScript     || 'plugin/math-katex/katex/katex.min.js';
	options.katexStylesheet = options.katexStylesheet || 'plugin/math-katex/katex/katex.min.css';

	var loads = 0;
	loadScript(options.katexScript, maybeLoaded);
	loadStyle(options.katexStylesheet, maybeLoaded);
	addStyleHack();

	function maybeLoaded() {
		loads += 1;
		loaded();
	}

	function loaded() {
		var elements = document.querySelectorAll('math-latex');
		elements.forEach(processElement);
		Reveal.layout();
	}

	function processElement(element) {
		window.katex.render(element.getAttribute('latex'), element, {
			displayMode: element.hasAttribute('display-mode')
		});
	}

	function loadScript(url, callback) {
		var head = document.querySelector('head');
		var script = document.createElement('script');
		script.type = 'text/javascript';
		script.src = url;
		script.onload = callback;
		head.appendChild(script);
	}

	function loadStyle(url, callback) {
		var head = document.querySelector( 'head' );
		var link = document.createElement('link');
		link.rel = 'stylesheet';
		link.href = url;
		link.onload = callback;
		head.appendChild(link);
	}

	function addStyleHack() {
		var head = document.querySelector( 'head' );
		var stylesheet = document.createElement( 'style' );
		stylesheet.innerHTML = [
			'.reveal math-latex.display { display: block }',

			'.reveal math-latex.inline:not(first) {',
			'    margin-left: 0.35em;',
			'}'
		]
		.join( '\n' );
		head.appendChild(stylesheet);
	}
})();
