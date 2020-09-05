reset

set xrange [0:4.2]


set key right top Left box 1
#p '../corrida32_CIM/Run.T0.600000/aveparam.dat'  title "T=0.6" w lp
p '../corrida32_CIM/Run.T0.800000/aveparam.dat'  title "T=0.8" w lp pt 4 pointsize 1.5
rep '../corrida32_CIM/Run.T1.000000/aveparamfcd.dat'  title "T=1.0" w lp pt 6 pointsize 1.5
rep '../corrida32_CIM/Run.T1.200000/aveparam.dat'  title "T=1.2" w lp pt 8 pointsize 1.5
rep '../corrida32_CIM/Run.T1.400000/aveparam.dat'  title "T=1.4" w lp pt 10 pointsize 1.5

set xlabel "H"
set ylabel "{/Symbol h}"

set label "a)" at .5,.4 font "Times-Roman,34"

set term post enhanced mono "Times-Roman" 30
set out "p.32.eps"
rep

