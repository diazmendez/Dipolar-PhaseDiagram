reset

set xrange [.77:1]

set key right top Left box 1

p '../../tcorridaNew32t6/Run.S-A/p0.828h' title "H=0.828" w l
rep '../../tcorridaNew32t6/Run.S-A/p0.876h' title "H=0.846" w l lt 1 lw 5  

set xlabel "{/Symbol h}"
set ylabel "P({/Symbol h})"

set label "b)" at .8,.34

set term pos enhanced mono "Times-Roman" 30
set out "newphist32.T1.2.S-A.eps"
rep


#******************************** con Bezier *******************
reset
set term x11
set out "newphist32.T1.2.S-A.Bezier.eps"
set xrange [.77:1]

set key right top Left box 1
p '../../tcorridaNew32t6/Run.S-A/p0.828h' title "H=0.828" s bezier w l
rep '../../tcorridaNew32t6/Run.S-A/p0.876h' title "H=0.846" s bezier w l lt 1 lw 5  

#p '../../corrida32_transiciones_CIM/Run.S-A/phist32.T1.2.H0.840' title "H=0.840" smooth bezier w l
#rep '../../corrida32_transiciones_CIM/Run.S-A/phist32.T1.2.H0.846' title "H=0.846" smooth bezier w l lt 1 lw 5  

set xlabel "{/Symbol h}"
set ylabel "P({/Symbol h})"
set label "b)" at .8,.24

set yrange [:.3]

set term pos enhanced mono "Times-Roman" 30
#set out "newphist32.T1.2.S-A.Bezier.eps"
rep

