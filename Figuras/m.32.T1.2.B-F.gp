reset

set key right bottom Left box 1
set xrange [4.5:6]

p '../corrida32_CIM/Run.T1.200000/avemagnet.dat'  notitle  w lp pt 8 pointsize 2

set xlabel "H"
set ylabel "magnetization"
#set label "T=1.2" at 2.75,0.93



set term post enhanced mono "Times-Roman" 20
set out "m.32.T1.2.B-F.eps"
rep

