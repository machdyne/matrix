matrix:
	mkdir -p output
	yosys -q -p "synth_ice40 -top matrix_hello -json output/matrix.json" \
		rtl/matrix_hello.v rtl/matrix.v
	nextpnr-ice40 -q --hx4k --package bg121 --pcf boards/krote.pcf \
		--asc output/matrix.txt --json output/matrix.json \
		--pcf-allow-unconstrained
	icebox_explain output/matrix.txt > output/matrix.ex
	icetime -d hx4k -c 50 -mtr output/matrix.rpt output/matrix.txt
	icepack output/matrix.txt output/matrix.bin

clean:
	rm -f output/*

.PHONY: matrix clean
