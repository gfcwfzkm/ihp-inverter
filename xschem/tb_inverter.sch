v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 970 -490 1770 -90 {flags=graph
y1=-0.0082
y2=3.1
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-1e-09
x2=1.9e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color="4 7 8"
node="vin
vout_sim
vout_kl"
rawfile=$netlist_dir/tb_inverter.raw
sim_type=tran}
N 80 -380 80 -170 {lab=vdd}
N 160 -250 160 -170 {lab=vin}
N 320 -190 320 -70 {lab=GND}
N 160 -110 160 -70 {lab=GND}
N 80 -110 80 -70 {lab=GND}
N 370 -250 430 -250 {lab=vout_sim}
N 320 -380 320 -310 {lab=vdd}
N 80 -380 320 -380 {lab=vdd}
N 160 -250 270 -250 {lab=vin}
N 760 -240 820 -240 {lab=vout_kl}
N 710 -380 710 -300 {lab=vdd}
N 320 -380 710 -380 {lab=vdd}
N 710 -180 710 -60 {lab=GND}
N 610 -240 660 -240 {lab=vin}
C {title.sym} 160 0 0 0 {name=l1 author="gfcwfzkm (Pazzy)"}
C {vsource.sym} 160 -140 0 0 {name=VIN value="PULSE(0 3 0 1n 1n 4n 10n)" savecurrent=false}
C {vsource.sym} 80 -140 0 0 {name=VDD value=3 savecurrent=false}
C {lab_pin.sym} 80 -380 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {inverter.sym} 110 -200 0 0 {name=x1}
C {code_shown.sym} 350 -610 0 0 {name=LIB only_toplevel="false" value=".lib cornerMOShv.lib mos_tt
"}
C {gnd.sym} 80 -70 0 0 {name=l2 lab=GND}
C {gnd.sym} 160 -70 0 0 {name=l3 lab=GND}
C {gnd.sym} 320 -70 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 160 -250 0 0 {name=p2 sig_type=std_logic lab=vin}
C {lab_pin.sym} 430 -250 0 1 {name=p3 sig_type=std_logic lab=vout_sim}
C {launcher.sym} 610 -460 0 0 {name=h4
descr=SimulateNGSPICE
tclcommand="
# Setup the default simulation commands if not already set up
# for example by already launched simulations.
set_sim_defaults
puts $sim(spice,1,cmd) 

# Change the Xyce command. In the spice category there are currently
# 5 commands (0, 1, 2, 3, 4). Command 3 is the Xyce batch
# you can get the number by querying $sim(spice,n)
set sim(spice,1,cmd) \{ngspice  \\"$N\\" -a\}

# change the simulator to be used (Xyce)
set sim(spice,default) 0

# Create FET and BIP .save file
mkdir -p $netlist_dir
write_data [save_params] $netlist_dir/[file rootname [file tail [xschem get current_name]]].save

# run netlist and simulation
xschem netlist
simulate
"}
C {devices/launcher.sym} 380 -460 0 0 {name=h3
descr="Load waves" 
tclcommand="
xschem raw_read $netlist_dir/[file rootname [file tail [xschem get current_name]]].raw
xschem setprop rect 2 0 fullxzoom
"
}
C {simulator_commands_shown.sym} 50 -590 0 0 {name=SimulatorNGSPICE
simulator=ngspice
only_toplevel=false 
value="
.include tb_inverter.save
.param temp=27
.control
save all
op
tran 10p 20n
write tb_inverter.raw
.endc
"}
C {inverter_ext.sym} 500 -190 0 0 {name=x2}
C {lab_pin.sym} 820 -240 0 1 {name=p4 sig_type=std_logic lab=vout_kl}
C {gnd.sym} 710 -60 0 0 {name=l5 lab=GND}
C {lab_pin.sym} 610 -240 0 0 {name=p5 sig_type=std_logic lab=vin}
C {code_shown.sym} 360 -540 0 0 {name=LIB1 only_toplevel=false value=".inc /foss/designs/ihp-inverter/klayout/inverter_ext.spice"}
