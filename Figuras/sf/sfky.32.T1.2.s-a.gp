reset

set key right top Left box 1
set pointsize 1.6

p '../../corrida32_CIM/Run.T1.200000/fotos/sfky0.84' u 1:($2/32) t 'H=0.84' w lp lt 1 pt 4 
rep '../../corrida32_CIM/Run.T1.200000/fotos/sfky0.90' u 1:($2/32) t 'H=0.9' w lp lt 1 pt 6 

set xlabel "k_y" font "Times-Roman,30"
set ylabel "k_x=0 structure factor" font "Times-Roman,30"
#set label "T=1.2" at 2.75,0.93

set label "d)" at .5,.6 font "Times-Roman,30"

set term post enhanced mono "Times-Roman" 27
set out "sfky.32.T1.2.s-a.eps"
rep

