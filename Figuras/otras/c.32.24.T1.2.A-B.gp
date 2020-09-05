reset

set key right top Left box 1
p '../../corrida32_CIM/Run.T1.200000/aveenergy.dat' u 1:((($3-($2*$2))/1.2)) t 'L=32' w lp pt 6 pointsize 1.5  
rep '../../corrida24/Run.T1.200000/aveenergy.dat' u 1:((($3-($2*$2))/1.2)) t 'L=24' w lp pt 9 pointsize 1.5
#rep '../../corrida24/Run.T1.200000/aveenergyfcd.dat' u 1:((($3-($2*$2))/1.2)) t 'L=24' w lp pt 9 pointsize 1.5


set ylabel "{C}"
set xlabel "H"
set label "T=1.2" at 3.4,.003
set xrange [1.5:4]

set label "a)" at 1.6,.0032

set term post enhanced mono "Times-Roman" 30
set out "c.32.24.T1.2.A-B.eps"
rep

