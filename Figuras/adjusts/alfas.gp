reset

p [][] '../../corrida32_CIM/Run.T1.200000/fotos/adjust_params_H_chi_p_ko.manip.dat' u 1:3 w lp pt 4 ps 2 not

#set key right top Left box 1


set ylabel "best fit of {/Symbol a}" font "Times-Roman,30"
set xlabel "H" font "Times-Roman,30"

#set label "b)" at 2,1.4 font "Times-Roman,30"

#set label "b)" at 1,2.75

set term post enhanced mono "Times-Roman" 24
set out "alfas.eps"
rep

