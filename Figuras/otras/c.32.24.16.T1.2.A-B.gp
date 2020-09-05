reset

set key right top Left box 1
p '../../corrida32_CIM/Run.T1.200000/aveenergy.dat' u 1:((($3-($2*$2))/1.2)) t 'L=32' w lp pt 6 lt 1 pointsize 1.5  
rep '../../corrida24/Run.T1.200000/aveenergy.dat' u 1:((($3-($2*$2))/1.2)) t 'L=24' w lp pt 9 lt 1 pointsize 1.5
#rep '../../corrida24/Run.T1.200000/aveenergyfcd.dat' u 1:((($3-($2*$2))/1.2)) t 'L=24' w lp pt 9 pointsize 1.5
rep '../../corrida16/Run.T1.200000/taveenergy.dat' u 1:((($3-($2*$2))/1.2)) t 'L=16' w lp pt 10 lt 1 pointsize 1.5


set ylabel "{C}"
set xlabel "H"
set label "T=1.2" at 1.6,.0035
set xrange [1.5:4]


set term post enhanced mono "Times-Roman" 20
set out "c.32.24.16.T1.2.A-B.eps"
rep

