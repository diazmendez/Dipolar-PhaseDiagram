reset

# despues se edita en el Gimp...


set key right top Left box 1
p '../../../ZeroTen/RunT0/test16/data.dat' u 1:2 t 'T=0 config.' w l lt 1
rep '../../corrida16/Run.T1.200000/aveenergy.dat' t 'T=1.2 sim.' w lp pt 6 lt 2


set ylabel "energy"
set xlabel "H"

set xrange [.3:1.3]

set arrow from .78,-2.52 to .78,-2.34 nohead
set label "h2" at .45,-2.5
set label "h3-2" at .95,-2.5


set label "L=16" at .4,-2.36



set term post enhanced mono "Times-Roman" 20
set out "e.16.T0.T1.2.eps"
rep

