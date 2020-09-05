//****************************************************************
// HD_stab.c: hace la simulacion de estabilidad de fases de cualquier
//	      tamanho. Esta hecho para investigar que pasa a grandes deltas.
//	      de ahi "HD"
//
// R. D'iaz-M'endez.
// La Habana, feb. 2005.
//*****************************************************************

//********************************************************
// Esto es un clon del prog para encontrar el diagrama de fases 
// con campo magnetico
// La Habana, mar. 2006
//********************************************************

//*******************************************************
// Esta version busca una transicion con H a T constante
//*******************************************************

//*******************************************************
//    isingLR_field_Tcte_hist.c
//
// Esta version es completa, entrega datos para histogramas,
// fotos y correlaciones (ver la funcion make_files)
// La Habana, mar. 2006
//*******************************************************

//*******************************************************
// Esta version cambia el protocolo, se sale de una configuracion
// conocida a Hmin y se incrementa el campo hasta Hmax
//*******************************************************

//******************************************
// en esta introducimos la rutina de continuacion de un programa no terminado
// oct. 2006
//********************************************

//*********************************************
// en esta hacemos algunas variaciones del protocolo, como eliminar el calculo
// de las correlaciones y fotografiar muchas veces en cada campo.
// tambien se hacen variaciones al generador de aleatorios para arquitecturas
// de 32 y 64 bits.
// jul. 2007
//*********************************************



#include <stdio.h>
#include <stdlib.h>
#include <math.h>



#define pi 3.14159
#define Z 4  
#define N (l*l)  
#define kappa (double) 5/l  
#define nmax 10

//*******************************************
//******* Generador de aleatorios
#define FNORM   (2.3283064365e-10)
#define RANDOM  ((ira[ip++] = ira[ip1++] + ira[ip2++]) ^ ira[ip3++])
#define FRANDOM (FNORM * RANDOM)
#define pm1 ((FRANDOM > 0.5) ? 1 : -1)         

unsigned myrand, ira[256];
unsigned char ip, ip1, ip2, ip3;

unsigned rand4init(void)
{
    unsigned long long y;
    
    y = (myrand*16807LL);
    myrand = (y&0x7fffffff) + (y>>31);
    if (myrand&0x8000000)
	myrand = (myrand&0x7fffffff) + 1;
    return myrand;
}                    

void Init_Random(void)
{
    int i;
    
    ip = 128;
    ip1 = ip - 24;
    ip2 = ip - 55;
    ip3 = ip - 61;
    
    for (i=ip3; i<ip; i++)
	ira[i] = rand4init();
}                    

float gauss_ran(void)
{
    static int iset=0;
    static float gset;
    float fac, rsq, v1, v2;
    
    if (iset == 0) {
	do {
	    v1 = 2.0 * FRANDOM - 1.0;
	    v2 = 2.0 * FRANDOM - 1.0;
	    rsq = v1 * v1 + v2 * v2;
	} while (rsq >= 1.0 || rsq == 0.0);
	fac = sqrt(-2.0 * log(rsq) / rsq);
	gset = v1 * fac;
	iset = 1;
	return v2 * fac;
    } else {
	iset = 0;
	return gset;
    }
}
//*******************************************
//*******************************************
 

//********** Funciones
void set_memory();
void set_nearest_neighbours();
double energy_value_i();
double energy_value_d();
double energy_value_f();
void get_potential();
double set_sm();
void set_conf();
double d_energy_value(int);
void montecarlo_step();
void make_files();



//************ Arreglos y variables
int *spin, *neighbours, *distances;
double *potential;
int l, m;
double sm;
double delta, beta, T, H, energy;
char *via;
int npoints, relax, med, ph, med2, h, run; 
double Hmax, Hmin, dH;                          
char dir[20],efile[30],mfile[30],pfile[30],rfile[30],sfile[30],phfile[40];


//************ Funcion main
int main(int argc, char *argv[])
{
    int n, i, j, rr;
    int oave, step, step2, stepph, cnt_H, cnt, cnt_Htmp, cnttmp;
    float Htmp;
    FILE *opfen, *opfpa, *opfma, *opfco, *opfph, *opfre, *opfST;
    
    
    if (argc != 15)
    {
	printf("usage: %s <size> <source> <delta> <T> <conf> <Hmin> <Hmax> <points> <relax> <med(histog)> <ph(fotos))> <med2(state)> <seed> <run>\n", argv[0]);
	exit (1);
    }
    
    l = (int)atoi(argv[1]);
    via = (char *)argv[2];
    delta = (double)atof(argv[3]);
    T = (double)atof(argv[4]);
    h = (int)atoi(argv[5]); 
    Hmin = (double)atof(argv[6]);
    Hmax = (double)atof(argv[7]);
    npoints = (int)atoi(argv[8]);
    relax = (int)atoi(argv[9]);
    med = (int)atoi(argv[10]);
    ph = (int)atoi(argv[11]);
    med2 = (int)atoi(argv[12]);
    myrand = (unsigned)atoi(argv[13]);   
    run = (int)atoi(argv[14]);
    
    Init_Random(); 
    set_memory();
    set_nearest_neighbours();  
    get_potential();
    


    dH=(Hmax-Hmin)/npoints;

    sprintf(dir,"Run.T%f",T);
    sprintf(efile,"%s/energy.dat",dir);
    sprintf(pfile,"%s/param.dat",dir);
    sprintf(mfile,"%s/magnet.dat",dir);
    sprintf(rfile,"%s/README.dat",dir);
    sprintf(sfile,"%s/STATE.dat",dir);


    if (run==0) make_files();  //******* RUN

    oave=relax/10; // se mide durante un orden menos que relax     
    step=(int)(oave/(med+1));
    step2=(int)(npoints/(med2+1));
    stepph=(int)(med/(ph+1));
    if (T==0) T=0.0000000000001;
    beta=1/T;  // T no puede ser cero
    
    if (run==0) set_conf(); // escoge la configuracion    ***** RUN 
    else                    // continua con la configuracion en la que se paro
    {
	opfST=fopen(sfile,"r");
	fscanf(opfST,"%f",&Htmp);
	fscanf(opfST,"%i",&cnt_Htmp);
	fscanf(opfST,"%i",&cnttmp);
	for (j=0; j<N; j++) // anti-prints the configuration. 
	{   
	    if (div(j,l).rem==0 && j!=0) fscanf(opfST, "\n");
	    fscanf(opfST, "%i", spin+j);
	}
	fclose(opfST);
	opfre = fopen(rfile, "a");
	fprintf(opfre,"\n-> corrida recomenzada en H=%f\n",Htmp);
	fclose(opfre);	
    }
    
    sm=set_sm();
    m=0; for (i=0;i<N;i++) m+=spin[i];
    energy=energy_value_i()+energy_value_d()+energy_value_f();
    if (run==0) cnt_H=1; else cnt_H=cnt_Htmp+1;  // ********* RUN
    if (run==0) cnt=0; else cnt=cnttmp+1;        // ********* RUN
    printf("state:");
    for(H=((run==0)?Hmin:Htmp+dH); H<Hmax; H+=dH, cnt_H++) // ******** RUN 
    {

	energy=energy_value_i()+energy_value_d()+energy_value_f();
   	//beta=1/T;
	for (i=0;i<relax;i++) montecarlo_step(); // Recuerda que hay que comprobar el relax!
	opfen = fopen(efile, "a");
	opfpa = fopen(pfile, "a");
	opfma = fopen(mfile, "a");
	fprintf(opfen, "%f\t", H);
	fprintf(opfpa, "%f\t", H);
	fprintf(opfma, "%f\t", H);
	
	sprintf(phfile,"%s/fotos/phH%f.dat",dir,H); // dando nombre a los archivos de fotos
	
	if (div(cnt_H,step2).rem!=0)
	{
	    for (i=0;i<med;i++)
	    {
		for (j=0;j<step;j++) montecarlo_step();
		sm=set_sm();
		fprintf(opfen, "%f\t", energy/N);
		fprintf(opfpa, "%f\t", sm);
		fprintf(opfma, "%f\t", (double) m/N);   
		fflush(NULL);
	
		if(div(i,stepph).rem==0)     // guardando foto del sistema
		{
		    opfph = fopen(phfile, "a");
		    for (j=0; j<N; j++) // prints the configuration. 
		    {   
			if (div(j,l).rem==0 && j!=0) fprintf(opfph, "\n");
			fprintf(opfph, "%i\t", spin[j]);
		    }        
		    fprintf(opfph, "\n\n");    
		    fclose(opfph);  
		}

	    }	
	    fprintf(opfen, "\n");
	    fprintf(opfpa, "\n");
	    fprintf(opfma, "\n"); 
	}  
	else // igual, pero se reescribe STATE.dat                  **** RUN
	{  

	    for (i=0;i<med;i++)
	    {
		for (j=0;j<step;j++) montecarlo_step();
		sm=set_sm();
		fprintf(opfen, "%f\t", energy/N);
		fprintf(opfpa, "%f\t", sm);
		fprintf(opfma, "%f\t", (double) m/N); 
		fflush(NULL);

		if(div(i,stepph).rem==0)     // guardando foto del sistema
		{
		    opfph = fopen(phfile, "a");
		    for (j=0; j<N; j++) // prints the configuration. 
		    {   
			if (div(j,l).rem==0 && j!=0) fprintf(opfph, "\n");
			fprintf(opfph, "%i\t", spin[j]);
		    }        
		    fprintf(opfph, "\n\n");    
		    fclose(opfph);  
		}

	    }	
	    fprintf(opfen, "\n");
	    fprintf(opfpa, "\n");
	    fprintf(opfma, "\n");
	    
	    // fotografiando la configuracion para photos y STATE // **** RUN
	    opfST = fopen(sfile, "w");
	    fprintf(opfST, "%f\n%i\n%i\n",H,cnt_H,cnt);
	    for (j=0; j<N; j++) // prints the configuration. 
	    {   
		if (div(j,l).rem==0 && j!=0) fprintf(opfST, "\n");
		fprintf(opfST, "%i\t", spin[j]);
	    }        
	    fprintf(opfST, "\n\n");    
	    fclose(opfST);
            
	    cnt++;printf("%i,",cnt);
	}

	fclose(opfen);
  	fclose(opfpa);
  	fclose(opfma);
    }
    printf("\n");   
    opfre = fopen(rfile, "a");
    fprintf(opfre,"\n...terminó.\n");
    fclose(opfre);
    return(0);
}

//********** Da memoria a los arreglos
void set_memory()
{
    spin=(int *)malloc(N*sizeof(int));
    neighbours=(int *)malloc(N*Z*sizeof(int)); 
    potential=(double *)malloc(((N*N)-N)*sizeof(double)/2);
}


//*********** Genera el arreglo de los vecinos cercanos
void set_nearest_neighbours()
{
    int i;
    for (i = 0; i < N; i++) // I know this is not the best method but I don't care
    {                       // becouse 1-This do not slow the program and 2-This 
	// is mine.
	// rigth               
	if (div(i+1, l).rem == 0) neighbours[(Z * i)] = i - (l -1);  
	else neighbours[(Z * i)] = i + 1;
	// left
	if (div(i, l).rem == 0) neighbours[(Z * i) + 1] = i + (l -1);  
	else neighbours[(Z * i) + 1] = i -1;
	// up
	if (i < l)  neighbours[(Z * i) + 2] = i + ((l -1) * l);  
	else neighbours[(Z * i) + 2] = i - l;
	// down
	if ((i + l) >= N) neighbours[(Z * i) + 3] = i -((l - 1) * l);  
	else neighbours[(Z * i) + 3] = i + l;
    }
}


//************ Lee el potencial del fichero tipo "potL"
void get_potential()
{	
    int i, j, n;
    FILE *opf;
    char str[15];
    
    opf=fopen(via,"r");
    
    for (i=0; i<(N-1); i++)
	for (j=(i+1); j<N; j++)
	{
	    n=(N*(N-1)/2)-((N-i-1)*(N-i)/2)+(j-i-1);
	    fscanf(opf,"%s\n",str);
	    potential[n]=(double)atof(str);
	}
    
    fclose(opf);
}


//******** Fija el arreglo de espines (sp) -global- en cualquier configuracion (h0, h1, h2,...)	
void set_conf() //necesita una variable que sera el valor de h y del tamanho lineal (l) -global-. 
{
    int i, j;
 
    //for (i=0;i<l*l;i++) spin[i]=pm1;

    //for (i=0;i<l*l;i++) spin[i]=1;

    
    for (i=0;i<l*l;i++) spin[i]=1;
    
    if (h!=0)
    {
	for (i=0;i<l;i+=2*h)
	    for (j=0;(j<h*l)&&((i*l+j)<(l*l));j++) spin[i*l+j]=-1;
	
    }
    else
    {
	for (i=0;i<l;i++) 					
	    for(j=((div(i,2).rem==0) ? 0 : 1);j<l;j+=2) spin[(i*l)+j]=-1;
    }
    
}


//************ Calcula la magnetizacion inhomogenea general para fases de franjas,		
double set_sm() //necesita el arreglo de espines (sp) y el tamanho lineal (l) -ambos globales-.
{
    int i, j;
    double sum,s=0; 
    for (i=0;i<l;i++)
    {
	sum=0;
	for (j=0;j<l;j++) sum+=spin[i*l+j];
	s+=fabs(sum);  
	sum=0;
	for (j=0;j<l;j++) sum+=spin[i+j*l];
	s-=fabs(sum);
    }	
    return(s/N);
}


//*************** Da la energia de Ising ie. corto alcance.
double energy_value_i()
{
    int i, j, kdown=0, krigth=0;
    double energy_=0; 
    
    for (j=0; j<l; j++)
    {
	for (i=0; i<l; i++)
	{
	    // The interactions at this poits are betwen:
	    // kdown+i             and         neighbours[(Z*(kdown+i))+3]
	    // krigth+(i*l)        and         neighbours[Z*(krigth+(i*l))]
	    
	    // Calculation of the hamiltonian:
	    energy_+=-delta*spin[kdown+i]*spin[neighbours[(Z*(kdown+i))+3]];
	    energy_+=-delta*spin[krigth+(i*l)]*spin[neighbours[Z*(krigth+(i*l))]];     
	}
	kdown=neighbours[(Z*kdown)+3]; 
	krigth=neighbours[Z*krigth];
    }
    return(energy_);
}


//************ Da la energia dipolar, ie. largo alcance.
double energy_value_d()
{
    int i, j, n;
    double E=0,Vii=0;  
    double sec0, sec1, sec15, sec2, sec3;
    double k1, k2;
    int n1, n2;
    
    for (i=0; i<(N-1); i++)
	for (j=(i+1); j<N; j++)
	{
	    n=(N*(N-1)/2)-((N-i-1)*(N-i)/2)+(j-i-1);
	    E+=potential[n]*spin[i]*spin[j];
	}
    
    for (n1=-nmax; n1<nmax+1; n1++)
    {
	k1=2*pi*n1/l;
	for (n2=-nmax; n2<nmax+1; n2++)
	{ 
	    k2=2*pi*n2/l;
	    sec0=sqrt((k1*k1)+(k2*k2))/(2*kappa);
	    sec1=exp(-((k1*k1)+(k2*k2))/(4*kappa*kappa));
	    sec15=exp(((k1*k1)+(k2*k2))/(4*kappa*kappa));   
	    sec2=sec1; // cos = 1
	    sec3=1-(sec15*sqrt(pi)*sec0*erfc(sec0));
	    Vii+=sec2*sec3;
	}         
    }
    Vii=(2*kappa*sqrt(pi)/(l*l)) * Vii;
    return ((2*E)+(N*Vii)-(2*kappa*kappa*kappa*N/(3*sqrt(pi))));
}


//*********** Da la energia producto de la interaccion con el campo 	
double energy_value_f()
{
    double en=0;
    int i;
    for (i=0;i<N;i++) en+=H*spin[i];  // Lo modifique para campo constante
    return(en);
}


//*************** Rutina del paso Montecarlo.
void montecarlo_step()
{
    int k, n;
    double d_energy;
    
    for (k=0; k<N; k++)
    {
	n=(int)(FRANDOM*N);  
	d_energy=d_energy_value(n); 
	if (d_energy<=0) 
	{
	    energy+=d_energy;
	    m+=-2*spin[n];
	    spin[n]=-spin[n];
	} 
	else 
	    if (exp(-beta*d_energy)>=FRANDOM) // This Exp can be tabulated.
	    {
		energy+=d_energy;
		m+=-2*spin[n];
		spin[n]=-spin[n];
	    }
    }
}



//************ Da la diferencia de energia total al flippear un el espin sp, la usa montecarlo_step().
double d_energy_value(int sp)
{
    double Ed, Ei, Eh;
    double cnt;
    int i; 
    
    // Dipolar contribution:
    cnt=0;
    for (i=0;i<sp;i++) 
	cnt+=potential[(N*(N-1)/2)-((N-i-1)*(N-i)/2)+(sp-i-1)]*spin[i];
    for (i=sp+1;i<N;i++)
	cnt+=potential[(N*(N-1)/2)-((N-sp-1)*(N-sp)/2)+(i-sp-1)]*spin[i];
    Ed=-4*cnt*spin[sp];
    
    // Ising contribution:
    cnt=spin[neighbours[Z*sp]]+
	spin[neighbours[(Z*sp)+1]]+
	spin[neighbours[(Z*sp)+2]]+
	spin[neighbours[(Z*sp)+3]];
    Ei=2*delta*cnt*spin[sp];
    
    // Field contribution:
    Eh=-2*H*spin[sp];         // Corregido para h constante 
    
    return(Ed+Ei+Eh);  
}

//*******************************************
void make_files()
{
 FILE *opf;
 char order[30];


 sprintf(order,"mkdir %s",dir);
 system(order);
 sprintf(order,"mkdir %s/fotos",dir);
 system(order);
 
 
 opf = fopen(efile, "w");
 fclose(opf);
 opf = fopen(pfile, "w");
 fclose(opf);
 opf = fopen(mfile, "w");
 fclose(opf);
 opf = fopen(rfile, "w");
 fprintf(opf,"***********************************************************************************************\n");
 fprintf(opf,"El funcionamiento de este programita es el siguiente:\n");
 fprintf(opf,"El sistema LxL comienza en una configuracion de franjas de grosor h (h=0 es el AA), se   aplica\n"); 
 fprintf(opf,"un campo HMIN que sube hasta HMAX\n");
 fprintf(opf,"por NPOINTS valores equiespaciados. En cada uno  de ellos se relaja RELAX veces y luego durante\n");
 fprintf(opf,"RELAX/10 mcs se miden equiespaciadaamente");
 fprintf(opf,"MED valores  de  energía, parámetro  de  orden  (pi/2 simetry breaking)  y\n");
 fprintf(opf,"magnetización y se tiran ph fotos tambien equiespaciadas\n");
 fprintf(opf,"\n");
 fprintf(opf,"Para MED2 (<NPOINTS) valores equiespaciados de H se guarda una foto y las variables del sistema\n");
 fprintf(opf,"como resguardo para poder recomenzar.\n");
 fprintf(opf,"\n");
 fprintf(opf,"Asi se generan en el subdirectorio creado Run.T??? los ficheros:\n");
 fprintf(opf,"\n");
 fprintf(opf,"energy.dat: que tiene MED+1 columnas y NPOINTS filas, cada fila  comienza  con  un valor de H y\n");
 fprintf(opf,"seguidamente los MED valores de energía obtenidos para ese campo.\n");
 fprintf(opf,"\n");
 fprintf(opf,"param.dat: la misma estructura que energy.dat pero con los valores del parámetro de orden.\n");
 fprintf(opf,"\n");
 fprintf(opf,"magnet.dat: la misma estructura que energy.dat pero con los valores de la magnetización.\n");
 fprintf(opf,"\n");
 fprintf(opf,"phH???.dat: (en el sub-subdirectorio fotos) que tiene ph fotos del sistema (matrices LxL de \\pm1) ");
 fprintf(opf,"separadas por líneas vacías\n");
 fprintf(opf,"una de otra, correspondiendo a la evolucion temporal para el campo h=??? \n");
 fprintf(opf,"\n");
 fprintf(opf,"\n");
 fprintf(opf,"Los parámetros de entrada de esta corrida son:\n");
 fprintf(opf,"\n");
 fprintf(opf,"      L = %i\n", l);
 fprintf(opf,"  delta = %f\n", delta);
 fprintf(opf,"      T = %f\n", T);
 fprintf(opf,"      h = %i\n", h);
 fprintf(opf,"   HMIN = %f\n", Hmin);
 fprintf(opf,"   HMAX = %f\n", Hmax);
 fprintf(opf,"NPOINTS = %i\n", npoints);
 fprintf(opf,"  RELAX = %i\n", relax);
 fprintf(opf,"    MED = %i\n", med);
 fprintf(opf,"     ph = %i\n", ph);
 fprintf(opf,"   MED2 = %i\t (aqui puede salir una más)\n", med2);
 fprintf(opf,"   seed = %l\n", myrand);
 fprintf(opf,"\n");
 fprintf(opf,"y otros:\n");
 fprintf(opf,"\n");
 fprintf(opf,"     dh = %f\n", dH);
 fprintf(opf,"\n");
 fclose(opf);
}
