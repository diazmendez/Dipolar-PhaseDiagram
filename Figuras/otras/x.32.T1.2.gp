reset

#set key right top Left box 1
p '../../corrida32_CIM/Run.T1.200000/avemagnet.dat' u 1:((($3-($2*$2))/1.2)) not w lp pt 6 pointsize 1.5  


set ylabel "{/Symbol c}" font "Times-Roman,30"
set xlabel "H" font "Times-Roman,30"
set label "T=1.2" at 5,.0012 font "Times-Roman,30"

set label "b)" at .5,.0008 font "Times-Roman,30"

set term post enhanced mono "Times-Roman" 24
set out "x.32.T1.2.eps"
rep

