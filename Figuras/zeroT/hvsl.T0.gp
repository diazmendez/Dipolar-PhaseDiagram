reset


set key left top below Left box 1
set key 91,4
p '../../../ZeroTen/RunT0/fromh2.dat' u 1:5 t 'to ferro' w lp pt 10 ps 2 lt 1
rep '../../../ZeroTen/RunT0/fromh2.dat' u 1:4 t 'to h24 like' w p pt 8 ps 2 
rep '../../../ZeroTen/RunT0/fromh2.dat' u 1:3 t 'to h23 like' w lp pt 6 ps 2 lt 1
rep '../../../ZeroTen/RunT0/fromh2.dat' u 1:2 t 'to h2223 like' w lp pt 4 ps 2 lt 1

set xtics (16,20,24,28,32,36,40,44,48,56,60,64,72,80,100)
set grid noytics xtics

set yrange[0:]
set xrange[13:103]

#set arrow from .9,-3.5 to 1,-2.5
set label "ferro" at 18,4.5
set label "bubbles zone" at 30,3.5
set label "symetric stripes zone" at 46,.2

set ylabel "zero T critical fields"
set xlabel "linear size"

#set label "L=32" at 2,0



set term post enhanced mono "Times-Roman" 20
set out "hvsl.T0.eps"
rep

