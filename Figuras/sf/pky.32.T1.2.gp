reset

set key right top Left box 1
set pointsize 1.6

p '../corrida32_CIM/Run.T1.200000/aveparam.dat' t '{/Symbol h}' w lp lt 2 pt 5 
rep '../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($10/32) t 'k_y={/Symbol p}/2' w lp lt 1 pt 6 
rep '../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($9/32) t 'k_y=7{/Symbol p}/16' w lp lt 1 pt 8
rep '../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($8/32) t 'k_y=3{/Symbol p}/8' w lp lt 1 pt 10

set xlabel "H"
set ylabel "normalized  k_y  contribution"
#set label "T=1.2" at 2.75,0.93



set term post enhanced mono "Times-Roman" 20
set out "pky.32.T1.2.eps"
rep

