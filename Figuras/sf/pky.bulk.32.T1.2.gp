reset

set key right top Left box 1
set pointsize 1.6

#p '../corrida32_CIM/Run.T1.200000/aveparam.dat' t '{/Symbol h}' w lp lt 2 pt  5

p '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($3/32) t 'k_y={/Symbol p}/16' w lp 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($4/32) t 'k_y={/Symbol p}/8' w lp 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($5/32) t 'k_y=3{/Symbol p}/16' w lp 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($6/32) t 'k_y={/Symbol p}/4' w lp 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($7/32) t 'k_y=5{/Symbol p}/16' w lp 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($11/32) t 'k_y=9{/Symbol p}/16' w lp 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($12/32) t 'k_y=5{/Symbol p}/8' w lp 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($13/32) t 'k_y=11{/Symbol p}/16' w lp 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($14/32) t 'k_y=3{/Symbol p}/4' w lp 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($15/32) t 'k_y=13{/Symbol p}/16' w lp 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($16/32) t 'k_y=7{/Symbol p}/8' w lp 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($16/32) t 'k_y=15{/Symbol p}/16' w lp 
rep '../../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($16/32) t 'k_y={/Symbol p}' w lp 


  

#rep '../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($9/32) t 'k_y=7{/Symbol p}/16' w lp lt 1 pt 8
#rep '../corrida32_CIM/Run.T1.200000/fotos/ky_Hpod.dat' u 1:($8/32) t 'k_y=3{/Symbol p}/8' w lp lt 1 pt 10

set yrange [0:.3]

set xlabel "H"
set ylabel "normalized  k_y  contribution"
#set label "T=1.2" at 2.75,0.93



set term post enhanced mono "Times-Roman" 20
set out "pky.bulk.32.T1.2.eps"
rep

