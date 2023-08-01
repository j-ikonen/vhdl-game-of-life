TOP=cellstate_tb
WAVE=sim/wave.ghw
WAVESAVE=sim/cellstate_save.gtkw
STD=08
# STD = 87|93|93c|99|02|08|19

all: import elab run

import:
	ghdl -i --workdir=work --std=$(STD) hdl/*.vhd test/*.vhd

elab:
	ghdl -m --workdir=work --std=$(STD) $(TOP)

run:
	ghdl -r --workdir=work $(TOP) --wave=$(WAVE)

wave: import elab run
ifeq (,$(wildcard ./sim/$(WAVESAVE)))
	gtkwave --dump=$(WAVE) --save=$(WAVESAVE)
else
	gtkwave $(WAVE)
endif
