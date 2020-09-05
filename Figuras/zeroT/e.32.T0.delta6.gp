reset

# despues se edita en el Gimp...


set key right top Left box 1  
#set boxwidth 0.5 relativeset boxwidth 0.5 relative

p '../../../ZeroTen/test32delta6/data.dat' u 1:22 t 'ferro' w l linewidth 2
rep '../../../ZeroTen/test32delta6/data.dat' u 1:20 t 'h82' w l linewidth 2
rep '../../../ZeroTen/test32delta6/data.dat' u 1:19 t 'h83' w l linewidth 2
rep '../../../ZeroTen/test32delta6/data.dat' u 1:39 t 'h38' w l linewidth 2
rep '../../../ZeroTen/test32delta6/data.dat' u 1:7 t 'h53' w l linewidth 2
rep '../../../ZeroTen/test32delta6/data.dat' u 1:2 t 'h4' w l linewidth 2


rep '../../../ZeroTen/RunT0/test32delta6/data.dat' u 1:2 t 'minimum' w l lt 1 lw 6

#set arrow from .7,-3.5 to .5,-2.5
#set label "H_{a}" at .7,-3.7 font "Times-Roman,30"


set ylabel "anharmonic configurations energy" font "Times-Roman,30"
set xlabel "H" font "Times-Roman,30"


#set label "L=32" at 2,0 font "Times-Roman,30"
#set label "a)" at .5,-5.5 font "Times-Roman,30"




set term post enhanced mono "Times-Roman" 24
set out "e.32.T0.delta6.eps"
#set boxwidth 0.5 relative
rep

