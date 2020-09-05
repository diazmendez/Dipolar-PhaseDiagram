reset

set key right bottom Left box 1
#p '../corrida32_CIM/Run.T1.200000/aveparam.dat'  title "SB parameter"  w lp pt 4 pointsize 1.5
#rep '../corrida32_CIM/Run.T1.200000/avemagnet.dat'  title "magnetization" w lp pt 12 pointsize 1.5
p '../corrida32_CIM/Run.T1.200000/aveparam.dat'  not  w lp pt 4 pointsize 1.5
rep '../corrida32_CIM/Run.T1.200000/avemagnet.dat'  not w lp pt 12 pointsize 1.5

set xlabel "H" font "Times-Roman,30"
set ylabel "{/Symbol h}" font "Times-Roman,30"
set y2label "m" font "Times-Roman,30"

set arrow from 1,.75 to .2,.75
set arrow from 4.7,.75 to 5.5,.75

set label "T=1.2" at 2.75,0.93

set label "a)" at .6,.5 font "Times-Roman,30"

set term post enhanced mono "Times-Roman" 24
set out "pm.32.T1.2.eps"
rep

