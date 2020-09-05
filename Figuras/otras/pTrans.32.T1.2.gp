reset

set key right top Left box 1
p '../../corrida32_CIM/Run.T1.200000/aveparam.dat' notitle w lp pt 6 pointsize 1.5  
rep '../../corrida32_transiciones_CIM/Run.S-A/aveparam.dat' title "S-A" w p pt 9 pointsize 1.5
rep '../../corrida32_transiciones_CIM/Run.A-A/aveparam.dat' title "A-A" w p pt 11 pointsize 1.5
rep '../../corrida32_transiciones_CIM/Run.A-B/aveparam.dat' title "A-B" w p pt 13 pointsize 1.5


set ylabel "{/Symbol h}"
set xlabel "H"
set label "T=1.2" at .5,.3



set term post enhanced mono "Times-Roman" 20
set out "pTrans.32.T1.2.eps"
rep

