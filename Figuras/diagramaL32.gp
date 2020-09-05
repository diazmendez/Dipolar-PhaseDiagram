reset

set xlabel "T"
set ylabel "H"

p '../corrida32_CIM/diagrama.dat' notitle w lp pt 4 pointsize 2 lt 1 
rep '../corrida32_CIM/diagrama.dat' u 1:3 notitle w lp pt 6 pointsize 2 lt 1
rep '../corrida32_CIM/diagrama.dat' u 1:4 notitle w lp pt 8 pointsize 2 lt 2

set yrange [:5.7]
set xrange [:1.7]

#rep '../corrida32_CIM/diagrama.closed.dat' not w filledcurves 2

set label "perfect stripes" at .6,.5
set label "anharmonic stripes" at .7,2.2
set label "bubbles" at .7,4
set label "ferromagnetic" at .7,5.3

set term post enhanced mono  "Times-Roman" 24
set out "./diagramaL32.har_z1.eps"
rep

