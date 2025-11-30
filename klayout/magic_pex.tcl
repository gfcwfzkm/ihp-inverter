# gds readonly true
gds read inverter.gds
load inverter
flatten inverter_ext
cellname rename inverter inverter_ext
load inverter_ext
select top cell
# We have to re-index our ports, so the order for the subcircuit ports is correctly for our simulation
port VDD index 0
port A index 1
port Y index 2
port VSS index 3
extract do local
extract all
ext2sim labels on
ext2sim
extresist tolerance 10
extresist
ext2spice lvs
ext2spice cthresh 0
ext2spice extresist on
ext2spice
# quit -noprompt
