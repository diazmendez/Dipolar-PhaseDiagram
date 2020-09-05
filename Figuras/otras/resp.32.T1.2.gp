reset

set key right top Left box 1

p '../../corrida32_CIM/Run.T1.200000/aveenergy.dat' u 1:((($3-($2*$2))/(1.2*1.2))/0.00085) title "C(H)" w lp pt 6 pointsize 1.5  
rep '../../corrida32_CIM/Run.T1.200000/avemagnet.dat' u 1:((($3-($2*$2))/(1.2))/0.00125) title "{/Symbol c}(H)" w lp pt 8 pointsize 1.5  

set ylabel "response functions"
set xlabel "H"
set label "T=1.2" at .25,.95



set term post enhanced mono "Times-Roman" 20
set out "resp.32.T1.2.eps"
rep

