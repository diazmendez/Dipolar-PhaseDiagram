reset

set key right top Left box 1
set pointsize 1.6

p '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($10/32) t 'k_y={/Symbol p}/2' w lp lt 1 pt 4 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($9/32) t 'k_y=7{/Symbol p}/16' w lp lt 1 pt 9
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($8/32) t 'k_y=3{/Symbol p}/8' w lp lt 1 pt 6

set xlabel "H"
set ylabel "S(k_x=0,k_y)"
#set label "T=1.2" at 2.75,0.93



set term post enhanced mono "Times-Roman" 20
set out "kycont.32.T1.2.eps"
rep

