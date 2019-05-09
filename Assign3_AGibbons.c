#include <stdio.h>
void convert( int m, char a[11] )
{
    int i=0;
  	while(m>0)
    {
        a[i]= '0'+m%10;
        m=m/10;
        i++;
    }
}
void print ( char a[11] )
{
	int i;
	for(i=9;i>=0;i--)
	{
    	printf("%c", a[i]);
	}
	printf("\n");
}
void main()
{
	int m, i;
	while(scanf("%d", &m)==1)
	{
    	char a[11]={'\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0'};
    	printf("%d\n", m);
    	convert(m, a);
   		printf("%s\n", a);
   		print(a);
   		printf("\n");
    }
}
