reset

# despues se edita en el Gimp...


set key right top Left box 1
p '../../../ZeroTen/RunT0/test24/data.dat' u 1:2 t 'T=0 config.' w l lt 1
rep '../../corrida24/Run.T1.200000/aveenergy.dat' t 'T=1.2 sim.' w lp pt 6 lt 2


set ylabel "energy"
set xlabel "H"

set xrange [.35:2.75]

set arrow from .6,-3 to .6,-2.3 nohead
set arrow from 1.74,-3 to 1.74,-2.3 nohead
set label "h2" at .4,-2.95
set label "h2-3" at 1.2,-2.95
set label "h4-2" at 2,-2.95



set label "L=24" at 1,-2.35



set term post enhanced mono "Times-Roman" 20
set out "e.24.T0.T1.2.eps"
rep

