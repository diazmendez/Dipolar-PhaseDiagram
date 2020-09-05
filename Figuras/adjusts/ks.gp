reset

p '../../corrida32_CIM/Run.T1.200000/fotos/adjust_params_H_chi_p_ko.manip.dat' u 1:(abs($4)) w lp pt 4 ps 2 not

#set key right top Left box 1


set ylabel "best fit of k" font "Times-Roman,30"
set xlabel "H" font "Times-Roman,30"

set xrange [:6]

rep 3.1415/2 not w l lt 2
rep 7*3.1415/16 not w l lt 2
rep 3*3.1415/8 not w l lt 2


set y2tics ("{/Symbol p} /2" 1.5707, "7{/Symbol p}/16" 7*3.1415/16, "3{/Symbol p}/8" 3*3.1415/8)

set term post enhanced mono "Times-Roman" 24
set out "ks.eps"
rep
