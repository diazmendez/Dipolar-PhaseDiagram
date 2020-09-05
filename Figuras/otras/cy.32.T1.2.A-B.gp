reset

set key right top Left box 1
p '../../corrida32_CIM/Run.T1.200000/fotos/cophH2.340000.dat' u 1:3 t 'H=2.34' w lp lt 2 pt 6 pointsize 1.5  
rep '../../corrida32_CIM/Run.T1.200000/fotos/cophH2.520000.dat' u 1:3 t 'H=2.52' w lp lt 3 pt 8 pointsize 1.5  


set yrange [-.5:1]

set ylabel "C_y"
set xlabel "r"
#set label "T=1.2" at 5,.0012

set label "d)" at 2,.8

set term post enhanced mono "Times-Roman" 30
set out "cy.32.T1.2.A-B.eps"
rep

