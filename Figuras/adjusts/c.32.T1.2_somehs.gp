reset

f(x)=a*exp(-x/chi)*cos(ko*x-psi)+c+b*x**(-p)
f1(x)=a1*exp(-x/chi1)*cos(ko1*x-psi1)+c1+b1*x**(-p1)

#fit f(x) '../../corrida32_CIM/Run.T1.200000/fotos/cophH3.420000.dat' u 1:3 via a,chi,ko,psi,c,b,p; rep f(x)

p '../../corrida32_CIM/Run.T1.200000/fotos/cophH2.400000.dat' u 1:3 w p pt 5 ps 2 t 'H=2.4' 

a               = 0.148123         
chi             = 13.7418          
ko              = 1.17631          
psi             = 0.0410277        
c               = 0.329071         
b               = 0.336508        
p               = 0.50622        

rep f(x) not lt 1



rep '../../corrida32_CIM/Run.T1.200000/fotos/cophH3.420000.dat' u 1:3 w p pt 6 ps 2 t 'H=3.42' 


a1               = 0.152282         
chi1             = 3.69801          
ko1              = 1.0384           
psi1             = 0.451795         
c1               = 0.36325          
b1               = 0.238781         
p1               = 1.98428          

rep f1(x) not lt 1


set key right top Left box 1

#p '../../corrida32_CIM/Run.T1.200000/aveenergy.dat' u 1:((($3-($2*$2))/1.2)) t 'L=32' w lp pt 6 pointsize 1.5  
#rep '../../corrida24/Run.T1.200000/aveenergy.dat' u 1:((($3-($2*$2))/1.2)) t 'L=24' w lp pt 9 pointsize 1.5
#rep '../../corrida24/Run.T1.200000/aveenergyfcd.dat' u 1:((($3-($2*$2))/1.2)) t 'L=24' w lp pt 9 pointsize 1.5


set ylabel "{C_y}" font "Times-Roman,30"
set xlabel "r" font "Times-Roman,30"

#set label "T=1.2" at 3.4,.003


set xrange [.9:]
set yrange [:.7]

#set label "a)" at 4.5,.65 font "Times-Roman,30"

set term post enhanced mono "Times-Roman" 24
set out "c.32.T1.2_somehs.eps"
rep

