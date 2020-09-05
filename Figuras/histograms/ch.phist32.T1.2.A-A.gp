reset

set xrange [.65:.87]
unset ytics

#set key right top Left box 1

p '../../corrida32_transiciones_CIM/Run.A-A/ch.phist32.T1.2.H1.332' not w l lt 1 lw 7
rep '../../corrida32_transiciones_CIM/Run.A-A/ch.phist32.T1.2.H1.344' u 1:($2+.07) not w l lt 1 lw 7
rep '../../corrida32_transiciones_CIM/Run.A-A/ch.phist32.T1.2.H1.356' u 1:($2+(2*.07)) not w l lt 1 lw 7
rep 0 not, .07 not, 2*.07 not

set xlabel "{/Symbol h}"
set ylabel "P({/Symbol h})"

set label 'H=1.332' at .83,.05
set label 'H=1.344' at .83,.12 
set label 'H=1.356' at .83,.2

set label "a)" at .67,.22

set term pos enhanced mono "Times-Roman" 30
set out "ch.phist32.T1.2.A-A.eps"
rep

#********************** con Bezier **********************
reset
set term x11
set out "ch.phist32.T1.2.A-A.Bezier.eps"


set xrange [.65:.87]
set yrange [:.4]
unset ytics

#set key right top Left box 1

p '../../corrida32_transiciones_CIM/Run.A-A/ch.phist32.T1.2.H1.368' not smooth bezier w l lt 1 lw 5
rep '../../corrida32_transiciones_CIM/Run.A-A/ch.phist32.T1.2.H1.356' u 1:($2+.1) not smooth bezier w l lt 1 lw 5
rep '../../corrida32_transiciones_CIM/Run.A-A/ch.phist32.T1.2.H1.344' u 1:($2+(2*.1)) not  smooth bezier w l lt 1 lw 5
rep '../../corrida32_transiciones_CIM/Run.A-A/ch.phist32.T1.2.H1.332' u 1:($2+(3*.1)) not  smooth bezier w l lt 1 lw 5
rep 0 not lt 1, .1 not lt 1, 2*.1 not lt 1, 3*.1 not lt 1

set xlabel "{/Symbol h}"
set ylabel "P({/Symbol h})"

set label 'H=1.368' at .83,.08
set label 'H=1.356' at .83,.18
set label 'H=1.344' at .83,.28
set label 'H=1.332' at .83,.38

set label "c)" at .67,.37

set term pos enhanced mono "Times-Roman" 30
rep

