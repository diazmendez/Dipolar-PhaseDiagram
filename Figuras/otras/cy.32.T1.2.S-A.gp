reset

set key right top Left box 1
p '../../corrida32_CIM/Run.T1.200000/fotos/cophH0.840000.dat' u 1:3 t 'H=0.84' w p pt 6 pointsize 1.5  
rep cos(x*3.141592/2) t 'Cos({/Symbol p}/2 r)' lt 1
rep '../../corrida32_CIM/Run.T1.200000/fotos/cophH0.900000.dat' u 1:3 t 'H=0.9' w lp lt 2 pt 8 pointsize 1.5  


set yrange [-1.3:1.7]

set ylabel "C_y" font "Times-Roman,30"
set xlabel "r" font "Times-Roman,30"
#set label "T=1.2" at 5,.0012

set label "c)" at 2,1.2 font "Times-Roman,30"

set term post enhanced mono "Times-Roman" 25
set out "cy.32.T1.2.S-A.eps"
rep

