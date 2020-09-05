reset

set key right top Left box 1
set pointsize 1.6

p '../../../ZeroTen/test32/sfky.L32.h2322.dat' t 'h2322' w lp lt 1 pt 4 
rep '../../../ZeroTen/test32/sfky.L32.h32.dat' t 'h32' w lp lt 2 pt 6 

set xlabel "k_y"
set ylabel "k_x=0 structure factor"
#set label "T=1.2" at 2.75,0.93

set label "b)" at .5,.2


set term post enhanced mono "Times-Roman" 30
set out "sfky.32.T0.h2322.h32.eps"
rep
