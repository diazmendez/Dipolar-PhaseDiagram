reset

set key right top Left box 1
set pointsize 1.6

p '../../corrida32_CIM/Run.T1.200000/fotos/sfky1.26' u 1:($2/32) t 'H=1.26' w lp lt 1 pt 4 
rep '../../corrida32_CIM/Run.T1.200000/fotos/sfky1.32' u 1:($2/32) t 'H=1.32' w lp lt 4 pt 6 
rep '../../corrida32_CIM/Run.T1.200000/fotos/sfky1.38' u 1:($2/32) t 'H=1.38' w lp lt 3 pt 8 

set xlabel "k_y"
set ylabel "k_x=0 structure factor"
#set label "T=1.2" at 2.75,0.93

set label "b)" at .5,.5

set term post enhanced mono "Times-Roman" 30
set out "sfky.32.T1.2.a-a.eps"
rep

