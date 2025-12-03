# ihp-inverter
Just me trying to build an inverter using the IHP 130nm open source PDK

I'm using the [UNIC-CASS Analog Design Flow Guide](https://unic-cass.github.io/training/analog-flow.html) but with the HV mosfets instead of the LV mosfets, to get an inverter that works at 3 Volts.

The [inverter schematic](inverter.pdf), [testbench schematic](tb_inverter.pdf) and [layout](layout.png) are exported to examine the design without the tools.

| Step | Status |
| --- | --- |
| Draw inverter in Xschem | ✅ |
| Build a testbench in Xschem | ✅ |
| Schematic design works | ✅ |
| Draw inverter in KLayout | ✅ |
| Layout passes DRC checks | ✅ |
| Extract SPICE from Layout | ✅ |
| Extracted design matches Schematic in Testbench | ✅ |

## Tools

This project uses the [IIC-OSIC-TOOLS Docker Container](https://github.com/iic-jku/IIC-OSIC-TOOLS) (Release 2025.11) and the files / repository assumes to be extracted in the base design folder (`/foss/designs/ihp-inverter`).

To get the parasitic extraction from magic, a tcl script is provided and can be executed with
```bash
cd klayout
cat magic_pex.tcl | magic -rcfile /foss/pdks/ihp-sg13g2/libs.tech/magic/ihp-sg13g2.magicrc -noconsole -dnull
```
in the command line.