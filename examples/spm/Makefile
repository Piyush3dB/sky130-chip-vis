
PDK=sky130_fd_sc_hd
SCLIB=${PDK_ROOT}/sky130A/libs.ref/${PDK}/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

info:
	@echo $(SCLIB)
	cp ${SCLIB} . 


synth:
	yosys -c ${PWD}/synth.tcl -l ${PWD}/yosys.log

run:
	sh run-sim.sh

gen:
	sh gen-vis.sh

all: run gen

yo:
	yosys -p "read_verilog -sv build/tmp_sky130_fd_sc_hd_cells_fixed.v spm.gl.v ; write_json build/design.json;" > build/yosys.log
	yosys -p "read_verilog -sv build/tmp_sky130_fd_sc_hd_cells_fixed.v spm.gl.v ; show -format dot -prefix ./spm_graph;" > build/graph.dot

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

vcdsigs:
	python3 ../../list-signals.py ./build/spm.vcd
	ls -al ./build/vcd_signals.json

extra:
	sed -i 's|\\||g' ./build/vcd_signals.json
	sed -i 's|spm_tb.uut.||g' ./build/vcd_signals.json