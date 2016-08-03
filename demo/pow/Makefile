all: math mult

math:
	d8 --trace-hydrogen --trace-phase=Z --trace-deopt --code-comments --hydrogen-track-positions --redirect-code-traces --redirect-code-traces-to=code.asm --print-opt-code --trace_hydrogen_file=hydrogen.cfg math.js
	mv hydrogen.cfg math.cfg
	mv code.asm math.asm

mult:
	d8 --trace-hydrogen --trace-phase=Z --trace-deopt --code-comments --hydrogen-track-positions --redirect-code-traces --redirect-code-traces-to=code.asm --print-opt-code --trace_hydrogen_file=hydrogen.cfg mult.js
	mv hydrogen.cfg mult.cfg
	mv code.asm mult.asm

clean:
	rm *.cfg
	rm *.asm
