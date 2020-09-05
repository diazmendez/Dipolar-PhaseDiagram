reset

set key right top Left box 1
set xrange [.3:1.1]
set yrange [0:.0003]
p '../corrida16/Run.T1.200000/tavemagnet.dat' u 1:(($3-$2**2)/1.2/3) t 'L=16 ({/Symbol c}/3)' w lp pt 6 lt 2 pointsize 1.5
rep '../corrida24/Run.T1.200000/avemagnet.dat' u 1:(($3-$2**2)/1.2) t 'L=24' w lp pt 7 lt 1 pointsize 1.5
rep '../corrida32_CIM/Run.T1.200000/avemagnet.dat' u 1:(($3-$2**2)/1.2) t 'L=32' w lp pt 9 lt 1 pointsize 1.5

set label "T=1.2" at .4,.0001
set xlabel "H"
set ylabel "{/Symbol c}"

set label "a)" at .4,.000175

set term post enhanced mono "Times-Roman" 30
set out "x.32.24.16.T1.2.S-A.eps"
rep

