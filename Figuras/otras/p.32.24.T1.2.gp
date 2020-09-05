reset

set key right top Left box 1
p '../../corrida32_CIM/Run.T1.200000/aveparam.dat' t 'L=32' w lp pt 6 pointsize 1.5  
rep '../../corrida24/Run.T1.200000/aveparam.dat' t 'L=24' w lp pt 9 pointsize 1.5


set ylabel "{/Symbol h}"
set xlabel "H"
set label "T=1.2" at 3.5,.7
set xrange [:4]


set term post enhanced mono "Times-Roman" 20
set out "p.32.24.T1.2.eps"
rep

