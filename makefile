tb: tb.v TEST.v
	iverilog -o tb tb.v TEST.v
	vvp -n tb -lxt2
clean:
	rm -rf tb tb.lxt
