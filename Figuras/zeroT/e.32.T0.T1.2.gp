reset

# despues se edita en el Gimp...


set key right top Left box 1
p '../../../ZeroTen/RunT0/test32/data.dat' u 1:2 t 'T=0 stripes' w l lt 1
rep '../../corrida32_CIM/Run.T1.200000/aveenergy.dat' t 'T=1.2' w lp pt 6 lt 2

set yrange[:-1.8]

set ylabel "energy"
set xlabel "H"

#set label "L=32" at 3,-2.45
set label "b)" at .5,-5.7


set term post enhanced mono "Times-Roman" 30
set out "e.32.T0.T1.2.a.eps"
rep
set term x11

#*****************

reset
set term x11
set out "e.32.T0.T1.2.b.eps"

# despues se edita en el Gimp...


#set key right top Left box 1
p '../../../ZeroTen/RunT0/test32/data.dat' u 1:2 not w l lt 1
rep '../../corrida32_CIM/Run.T1.200000/aveenergy.dat' not w lp pt 6 lt 2



set xrange [.5:1.6]

set term post enhanced mono "Times-Roman" 20
set out "e.32.T0.T1.2.b.eps"
rep

#*****************

reset
set term x11
set out "e.32.T0.T1.2.c.eps"


set key right top Left box 1
p '../../../ZeroTen/RunT0/test32/data.dat' u 1:2 t 'T=0 config.' w l lt 1
rep '../../corrida32_CIM/Run.T1.200000/aveenergy.dat' t 'T=1.2 sim.' w lp pt 6 lt 2


set xrange [.5:1.6]

set label "h2" at .52,-2.55
set arrow from .6,-2.56 to .6,-2.38 nohead
set label "h2322" at .8,-2.55
set arrow from 1.38,-2.56 to 1.38,-2.38 nohead
set label "h3-2" at 1.45,-2.55

set ylabel "energy"
set xlabel "H"

set label "a)" at .7,-2.52

set term post enhanced mono "Times-Roman" 30
set out "e.32.T0.T1.2.c.eps"
rep

