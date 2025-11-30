v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 450 -340 480 -340 {lab=A}
N 450 -280 450 -220 {lab=A}
N 450 -220 480 -220 {lab=A}
N 410 -280 450 -280 {lab=A}
N 450 -340 450 -280 {lab=A}
N 520 -280 520 -250 {lab=Y}
N 520 -280 620 -280 {lab=Y}
N 520 -310 520 -280 {lab=Y}
N 520 -400 520 -370 {lab=VDD}
N 520 -340 530 -340 {lab=VDD}
N 530 -400 530 -340 {lab=VDD}
N 520 -400 530 -400 {lab=VDD}
N 520 -430 520 -400 {lab=VDD}
N 520 -160 520 -130 {lab=VSS}
N 520 -220 530 -220 {lab=VSS}
N 530 -220 530 -160 {lab=VSS}
N 520 -160 530 -160 {lab=VSS}
N 520 -190 520 -160 {lab=VSS}
C {sg13g2_pr/sg13_hv_nmos.sym} 500 -220 0 0 {name=M1
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 500 -340 0 0 {name=M2
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {ipin.sym} 410 -280 0 0 {name=p1 lab=A}
C {opin.sym} 620 -280 0 0 {name=p2 lab=Y}
C {iopin.sym} 520 -430 3 0 {name=p3 lab=VDD}
C {iopin.sym} 520 -130 1 0 {name=p4 lab=VSS}
C {title.sym} 170 0 0 0 {name=l1 author="Pascal Gesell"}
