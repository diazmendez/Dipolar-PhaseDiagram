reset

# despues se edita en el Gimp...


set key right bottom Left box 1
p '../corrida32_CIM/Run.T1.200000/aveparam.dat'  not  w lp pt 4 pointsize 1.5

set ylabel "{/Symbol h}"
set xlabel "H"
#set label "T=1.2" at 2.75,0.93



set term post enhanced mono "Times-Roman" 20
set out "p.32.T1.2.eps"
rep

