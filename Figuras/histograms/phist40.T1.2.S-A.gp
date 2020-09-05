reset
set term x11
set out "phist40.T1.2.S-A.Bezier.eps"
set xrange [.75:1.06]


#p '../../corrida40t6/Run.T1.2/hists/ch.phisH0.955.dat' s bezier not w l lt 1 lw 5
p '../../corrida40t6/Run.T1.2/hists/ch.phisH0.896.dat' u 1:($2+0*.08) s bezier not w l lt 1 lw 5
rep '../../corrida40t6TRANSC/Run.trS_A/hists/ch.phisH0.8358.dat' u 1:($2+1*.08) s bezier not w l lt 1 lw 5
rep '../../finding_peaks_40/Run.H0.8/hist/ppp1hisH0.8000.res.dat' u 1:($2+2*.08) s bezier not w l lt 1 lw 5
rep '../../corrida40t6/Run.T1.2/hists/phisH0.776.dat' u 1:($2+3*.08) s bezier not w l lt 1 lw 5
rep 0 not lt 1, .08 not lt 1, 2*.08 not lt 1, 3*.08 not lt 1


set xlabel "{/Symbol h}"
set ylabel "P({/Symbol h})"
set label "a)" at .77,.28


set label 'H=0.896' at 1,.04
set label 'H=0.836' at 1,.04+.08
set label 'H=0.803' at 1,.04+2*.08
set label 'H=0.776' at 1,.04+3*.08

unset ytics

set term pos enhanced mono "Times-Roman" 30
rep

