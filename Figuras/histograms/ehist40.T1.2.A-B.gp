reset

p '../../corrida40t6/Run.T1.2/hists/ehistH2.33.dat' not w l lt 1 lw 6
rep '../../corrida40t6/Run.T1.2/hists/ehistH2.39.dat' u 1:($2+(.02)) not w l lt 1 lw 6
rep '../../corrida40t6/Run.T1.2/hists/ehistH2.45.dat' u 1:($2+(2*.02)) not w l lt 1 lw 6
rep '../../corrida40t6/Run.T1.2/hists/ehistH2.51.dat' u 1:($2+(3*.02)) not w l lt 1 lw 6
rep 0 not, .02 not, 2*.02 not, 3*.02 not

unset ytics
set xlabel "E"
set ylabel "P(E)"

set label 'H=2.33' at -2.57,.095
set label 'H=2.39' at .57,.07
set label 'H=2.45' at .57,.045
set label 'H=2.51' at .57,.02
 
set label "c)" at .02,.085

set term pos enhanced mono "Times-Roman" 30
set out "ehist40.T1.2.A-B.eps.bad"
rep

#*************************** con Bezier **********************************
reset
set term x11
set out "ehist40.T1.2.A-B.Bezier.eps"
set xrange [-2.78:-2.5]

p '../../corrida40t6/Run.T1.2/hists/ehistH2.51.dat' not s bezier w l lt 1 lw 5
rep '../../corrida40t6/Run.T1.2/hists/ehistH2.45.dat' u 1:($2+(.02)) not s bezier w l lt 1 lw 5
rep '../../corrida40t6/Run.T1.2/hists/ehistH2.39.dat' u 1:($2+(2*.02)) not s bezier w l lt 1 lw 5
rep '../../corrida40t6/Run.T1.2/hists/ehistH2.33.dat' u 1:($2+(3*.02)) not s bezier w l lt 1 lw 5
rep 0 not lt 1, .02 not lt 1, 2*.02 not lt 1, 3*.02 not lt 1



unset ytics

set xlabel "E"
set ylabel "P(E)"

set yrange [:.08]

set label 'H=2.51' at -2.56,.017
set label 'H=2.45' at -2.56,.037
set label 'H=2.39' at -2.56,.057
set label 'H=2.33' at -2.56,.077

set label "f)" at -2.77,.074

set term pos enhanced mono "Times-Roman" 30
rep

