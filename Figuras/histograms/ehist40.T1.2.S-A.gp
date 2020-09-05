reset
set term x11
set out "ehist40.T1.2.S-A.Bezier.eps"
set xrange [-2.46:-2.32]


#p '../../corrida40t6/Run.T1.2/hists/ehisH0.955.dat' s bezier not w l lt 1 lw 5
p '../../corrida40t6/Run.T1.2/hists/ehisH0.896.dat' u 1:($2+0*.18) s bezier not w l lt 1 lw 5
rep '../../corrida40t6TRANSC/Run.trS_A/hists/ehisH0.8358.dat' u 1:($2+1*.18) s bezier not w l lt 1 lw 5
rep '../../finding_peaks_40/Run.H0.8/hist/eee1hisH0.8000.res.dat' u 1:(($2*10)+2*.18) s bezier not w l lt 1 lw 5
rep '../../corrida40t6/Run.T1.2/hists/ehisH0.776.dat' u 1:($2+3*.18) s bezier not w l lt 1 lw 5
rep 0 not lt 1, .18 not lt 1, 2*.18 not lt 1, 3*.18 not lt 1


set xlabel "E"
set ylabel "P(E)"
set label "b)" at -2.45,.12+3*.18


set label 'H=0.896' at -2.36,.13
set label 'H=0.836' at -2.36,.13+.18
set label 'H=0.803' at -2.36,.13+2*.18
set label 'H=0.776' at -2.36,.13+3*.18

unset ytics

set term pos enhanced mono "Times-Roman" 30
rep

