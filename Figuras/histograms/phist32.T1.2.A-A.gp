reset

set xrange [.65:.87]
unset ytics

#set key right top Left box 1

p '../../corrida32_transiciones_CIM/Run.A-A/phist32.T1.2.H1.332' not w l lt 1 lw 7
rep '../../corrida32_transiciones_CIM/Run.A-A/phist32.T1.2.H1.344' u 1:($2+.07) not w l lt 1 lw 7
rep '../../corrida32_transiciones_CIM/Run.A-A/phist32.T1.2.H1.356' u 1:($2+(2*.07)) not w l lt 1 lw 7
rep 0 not, .07 not, 2*.07 not

set xlabel "{/Symbol h}"
set ylabel "P({/Symbol h})"

set label 'H=1.332' at .83,.05
set label 'H=1.344' at .83,.12 
set label 'H=1.356' at .83,.2

set label "a)" at .67,.22

set term pos enhanced mono "Times-Roman" 30
set out "phist32.T1.2.A-A.eps"
rep

#********************** con Bezier **********************
reset
set term x11
set out "phist32.T1.2.A-A.Bezier.eps"

set xrange [.65:.87]
unset ytics

#set key right top Left box 1

p '../../corrida32_transiciones_CIM/Run.A-A/phist32.T1.2.H1.332' not smooth bezier w l lt 1 lw 7
rep '../../corrida32_transiciones_CIM/Run.A-A/phist32.T1.2.H1.344' u 1:($2+.07) not smooth bezier w l lt 1 lw 7
rep '../../corrida32_transiciones_CIM/Run.A-A/phist32.T1.2.H1.356' u 1:($2+(2*.07)) not  smooth bezier w l lt 1 lw 7
rep '../../corrida32_transiciones_CIM/Run.A-A/phist32.T1.2.H1.368' u 1:($2+(3*.07)) not  smooth bezier w l lt 1 lw 7
rep 0 not, .07 not, 2*.07 not, 3*.07 not

set xlabel "{/Symbol h}"
set ylabel "P({/Symbol h})"

set label 'H=1.332' at .83,.05
set label 'H=1.344' at .83,.12
set label 'H=1.356' at .83,.2


set term pos enhanced mono "Times-Roman" 20
#set out "phist32.T1.2.A-A.Bezier.eps"
rep

