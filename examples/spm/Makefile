
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


json2jqpath: jq
	jq json2jqpath ./build/design.json

json2xpath: jq
	jq json2xpath ./build/design.json


ports: jq
	jq ports ./build/design.json

netnames: jq
	jq netnames ./build/design.json > netnames.json

cells: jq
	jq cells ./build/design.json

netnames_bits: jq
	jq netnames_bits ./build/design.json > netnames.json
