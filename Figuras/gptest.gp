p 'corrida32_CIM/Run.T1.200000/fotos/cophH5.160000.dat' u 1:3  w p pt 4 pointsize 3
reset; p 'corrida32_CIM/Run.T1.200000/fotos/cophH5.160000.dat' u 1:3  w p pt 4 pointsize 3
set yrange [.94:1]
fe(x)=aa*exp(-cc*x)+bb
f(x)=a*x**(-c)+b
a=1;b=1;c=1;aa=1;bb=1;cc=1;
fit  [.1:] fe(x) 'corrida32_CIM/Run.T1.200000/fotos/cophH5.160000.dat' u 1:3 via aa,bb,cc
fit [0.1:] f(x) 'corrida32_CIM/Run.T1.200000/fotos/cophH5.160000.dat' u 1:3 via a,b,c

