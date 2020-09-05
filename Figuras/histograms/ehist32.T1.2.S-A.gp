reset

#set xrange [.77:1]

set key right top Left box 1

p '../../corrida32_transiciones_CIM/Run.S-A/ehist32.T1.2.H0.840' title "H=0.840" w l 
rep '../../corrida32_transiciones_CIM/Run.S-A/ehist32.T1.2.H0.846' u 1:($2) title "H=0.846" w l lt 1 lw 5  

set xlabel "{E}"
set ylabel "P(E)"

set label "b)" at .8,.34

set term pos enhanced mono "Times-Roman" 30
set out "ehist32.T1.2.S-A.eps"
rep


#******************************** con Bezier *******************
reset
set term x11
set out "ehist32.T1.2.S-A.Bezier.eps"
set xrange [-2.46:-2.3]

#set key right top Left box 1

#p '../../corrida32_transiciones_CIM/Run.S-A/ehist32.T1.2.H0.840' title "H=0.840" smooth bezier w l lt 1 lw 5
#rep '../../corrida32_transiciones_CIM/Run.S-A/ehist32.T1.2.H0.846' u 1:($2+.13) title "H=0.846" smooth bezier w l lt 1 lw 5  
p '../../corrida32_transiciones_CIM/Run.S-A/ehist32.T1.2.H0.858' not s bezier w l lt 1 lw 5
rep '../../corrida32_transiciones_CIM/Run.S-A/ehist32.T1.2.H0.852' u 1:($2+.15) not s bezier w l lt 1 lw 5  
rep '../../corrida32_transiciones_CIM/Run.S-A/ehist32.T1.2.H0.846' u 1:($2+2*.15) not s bezier w l lt 1 lw 5  
rep '../../corrida32_transiciones_CIM/Run.S-A/ehist32.T1.2.H0.840' u 1:($2+3*.15) not s bezier w l lt 1 lw 5  
rep 0 not lt 1, .15 not lt 1, 2*.15 not lt 1, 3*.15 not lt 1

set xlabel "E"
set ylabel "P(E)"
set label "b)" at -2.45,0.56

set label 'H=0.858' at -2.34,.12
set label 'H=0.852' at -2.34,.27
set label 'H=0.846' at -2.34,.42
set label 'H=0.840' at -2.34,.57

set yrange [:.6]
unset ytics

set term pos enhanced mono "Times-Roman" 30
#set out "ehist32.T1.2.S-A.Bezier.eps"
rep

