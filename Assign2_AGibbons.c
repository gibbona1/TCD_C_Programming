#include <stdio.h>
#include <math.h>
int main()
{
	double i=0, x=0, sum=0, std=0;
	int count=0;
	while(scanf("%lf", &i)==1)
	{
		count=count+1;
		sum=sum+i;
		x=(i*i)+x;
	}
	x=(x)-(sum)*(sum/count);
	std=sqrt(x/(count-1));
	printf("n %d \n", count);
	printf("Average %lf \n", sum/count);
	printf("Standard Deviation %lf\n", std);
}
