
run:
	sh run-sim.sh

gen:
	sh gen-vis.sh

all: run gen

yo:
	yosys -p "read_verilog -sv build/tmp_sky130_fd_sc_hd_cells_fixed.v spm.gl.v ; write_json build/design.json;" > build/yosys.log

clean:
	rm -rf out build

jq:
	cp ../../all.jq  ~/.jq


ports: jq
	jq ports ./build/design.json

netnames: jq
	jq netnames ./build/design.json

cells: jq
	jq cells ./build/design.json

