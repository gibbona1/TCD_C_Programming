#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <math.h>
#define PI 3.14159265358979323846
double randval ()
{
	static int first = 1;
	if ( first )
	{
		struct timeval tv;
		gettimeofday ( & tv, NULL );
		srand48 ( tv.tv_usec );
		first = 0;
	}
	return drand48 ();
}
int main(int argc, char *argv[])
{
    double d=atof(argv[1]), l=atof(argv[2]), n=atof(argv[3]);
    double k, estPi, angle, y, i, denom;//k/n~2l/πd
    for(i=0;i<n;i++)
    {
        angle=randval() *(90);
        y=randval() *(d/2);
        double x=(l)*sin(angle);
        if(y<=x)
        {
            k++;
        }
    }
    // want k roughly 320
    estPi=(2*l*n);
    denom=(k*d);
    estPi=estPi/denom;
    printf("%4.0lf throws, pi is %lf\n", n, estPi);
}
