reset

set xrange [0:.7]

#set key right top Left box 1

#p '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.340' title "H=2.340" w l lt 1
#rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.394' title "H=2.394" w l lt 1 lw 3
#rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.430' title "H=2.430" w l lt 3 lw 3
#rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.520' title "H=2.520" w l lt 1 lw 6

#p '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.340' title "H=2.340" w l lt 1 lw 6
#rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.394' u 1:($2+(.025)) title "H=2.394" w l lt 1 lw 6
#rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.430' u 1:($2+(2*.025)) title "H=2.430" w l lt 1 lw 6
#rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.520' u 1:($2+(3*.025)) title "H=2.520" w l lt 1 lw 6
#rep 0 not, .025 not, 2*.025 not, 3*.025 not

p '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.340' not w l lt 1 lw 6
rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.394' u 1:($2+(.025)) not w l lt 1 lw 6
rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.430' u 1:($2+(2*.025)) not w l lt 1 lw 6
rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.520' u 1:($2+(3*.025)) not w l lt 1 lw 6
rep 0 not, .025 not, 2*.025 not, 3*.025 not

unset ytics

set xlabel "{/Symbol h}"
set ylabel "P({/Symbol h})"

set label 'H=2.520' at .57,.095
set label 'H=2.430' at .57,.07
set label 'H=2.394' at .57,.045
set label 'H=2.340' at .57,.02
 
set label "c)" at .02,.085

set term pos enhanced mono "Times-Roman" 30
set out "phist32.T1.2.A-B.eps"
rep

#*************************** con Bezier **********************************
reset
set term x11
set out "phist32.T1.2.A-B.Bezier.eps"
set xrange [0:.7]

#set key right top Left box 1

#p '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.340' title "H=2.340" smooth bezier w l lt 1
#rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.394' title "H=2.394" smooth bezier w l lt 1 lw 3
#rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.430' title "H=2.430" smooth bezier w l lt 3 lw 3
#rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.520' title "H=2.520" smooth bezier w l lt 1 lw 6

p '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.340' not smooth bezier w l lt 1 lw 5
rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.394' u 1:($2+(.025)) not smooth bezier w l lt 1 lw 5
rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.430' u 1:($2+(2*.025)) not smooth bezier w l lt 1 lw 5
rep '../../corrida32_transiciones_CIM/Run.A-B/phist32.T1.2.H2.520' u 1:($2+(3*.025)) not smooth bezier w l lt 1 lw 5
rep 0 not lt 1, .025 not lt 1, 2*.025 not lt 1, 3*.025 not lt 1


unset ytics

set xlabel "{/Symbol h}"
set ylabel "P({/Symbol h})"

set label 'H=2.520' at .57,.095
set label 'H=2.430' at .57,.07
set label 'H=2.394' at .57,.045
set label 'H=2.340' at .57,.02

set label "a)" at .02,.085

set term pos enhanced mono "Times-Roman" 30
#set out "phist32.T1.2.A-B.Bezier.eps"
rep

