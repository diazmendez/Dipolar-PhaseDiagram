reset


set key left top below Left box 1
set key .032,3.6
p '../../../ZeroTen/RunT0/fromh2.v2.dat' u ($1**-1):5 t 'to ferro' w lp pt 10 ps 2 lt 1
#rep '../../../ZeroTen/RunT0/fromh2.v2.dat' u ($1**-1):4 t 'to h24 like' w p pt 8 ps 2 
rep '../../../ZeroTen/RunT0/fromh2.v2.dat' u ($1**-1):3 t 'to h23 like' w p pt 6 ps 2
rep '../../../ZeroTen/RunT0/fromh2.v2.dat' u ($1**-1):2 t 'to h2223 like' w p pt 4 ps 2 
rep '../../../ZeroTen/RunT0/fromh2.v2.dat' u ($1**-1):6 t 'H_a' w l lt 1 lw 4 
rep 2.3 t 'to bubbles (schematic)' lt 2 lw 4

#set xtics ("1/16" 0.0625,20,24,"1/28" .035714286,"1/32" .03125, "1/36" .027777778,  "1/40" .025, "1/44" .022727273, "1/48" .020833333, "1/56" .017857143, "1/60"  .016666667, "1/64" .015625, "1/72" .013888889, "1/80" .0125,"1/100" .01)
set xtics ("1/16" 0.0625,20,24,"1/28" .035714286,"1/32" .03125, "1/36" .027777778,  "1/40" .025, "1/44" .022727273, "1/48" .020833333, "1/56" .017857143, ""  .016666667, "1/64" .015625, "" .013888889, "1/80" .0125,"1/100" .01)
set grid noytics xtics

set yrange[0:5.6]
set xrange[0.0095:.036]

#set arrow from .9,-3.5 to 1,-2.5
set label "ferromagnetic zone" at .0125,5 font "Times-Roman,30"
set label "bubbles zone" at .0125,3.5 font "Times-Roman,30"
set label "anharmonic stripes zone" at .0125,2 font "Times-Roman,30"
set label "perfect stripes zone" at .016,.3 font "Times-Roman,30"

set ylabel "zero T critical fields" font "Times-Roman,30"
set xlabel "inverse linear size" font "Times-Roman,30"

#set label "L=32" at 2,0


set term post enhanced mono "Times-Roman" 20
set out "hvsl-1.T0.har.eps"
rep

