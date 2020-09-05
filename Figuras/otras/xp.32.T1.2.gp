reset

#set key right top Left box 1
p '../../corrida32_CIM/Run.T1.200000/aveparam.dat' u 1:((($3-($2*$2))/1.2)) not w lp pt 6 pointsize 1.5  


set ylabel "{/Symbol c}_{/Symbol h}" font "Times-Roman,30"
set xlabel "H" font "Times-Roman,30"
set label "T=1.2" at 5,.018 font "Times-Roman,30"

set label "c)" at .5,.012 font "Times-Roman,30"

set term post enhanced mono "Times-Roman" 24
set out "xp.32.T1.2.eps"
rep

