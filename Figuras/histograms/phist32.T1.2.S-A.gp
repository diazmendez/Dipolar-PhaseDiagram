reset

set xrange [.77:1]

set key right top Left box 1

p '../../corrida32_transiciones_CIM/Run.S-A/phist32.T1.2.H0.840' title "H=0.840" w l 
rep '../../corrida32_transiciones_CIM/Run.S-A/phist32.T1.2.H0.846' u 1:($2) title "H=0.846" w l lt 1 lw 5  

set xlabel "{/Symbol h}"
set ylabel "P({/Symbol h})"

set label "b)" at .8,.34

set term pos enhanced mono "Times-Roman" 30
set out "phist32.T1.2.S-A.eps"
rep


#******************************** con Bezier *******************
reset
set term x11
set out "phist32.T1.2.S-A.Bezier.eps"
set xrange [.77:1]

#set key right top Left box 1

#p '../../corrida32_transiciones_CIM/Run.S-A/phist32.T1.2.H0.840' title "H=0.840" smooth bezier w l lt 1 lw 5
#rep '../../corrida32_transiciones_CIM/Run.S-A/phist32.T1.2.H0.846' u 1:($2+.13) title "H=0.846" smooth bezier w l lt 1 lw 5  
p '../../corrida32_transiciones_CIM/Run.S-A/phist32.T1.2.H0.858' not smooth bezier w l lt 1 lw 5
rep '../../corrida32_transiciones_CIM/Run.S-A/phist32.T1.2.H0.852' u 1:($2+.25) not smooth bezier w l lt 1 lw 5  
rep '../../corrida32_transiciones_CIM/Run.S-A/phist32.T1.2.H0.846' u 1:($2+2*.25) not smooth bezier w l lt 1 lw 5  
rep '../../corrida32_transiciones_CIM/Run.S-A/phist32.T1.2.H0.840' u 1:($2+3*.25) not smooth bezier w l lt 1 lw 5  
rep 0 not lt 1, .25 not lt 1, 2*.25 not lt 1, 3*.25 not lt 1 

set xlabel "{/Symbol h}"
set ylabel "P({/Symbol h})"
set label "a)" at .78,.9

set label 'H=0.858' at .93,.2
set label 'H=0.852' at .93,.45
set label 'H=0.846' at .93,.7
set label 'H=0.840' at .93,.95

set yrange [:1]
unset ytics

set term pos enhanced mono "Times-Roman" 30
#set out "phist32.T1.2.S-A.Bezier.eps"
rep

