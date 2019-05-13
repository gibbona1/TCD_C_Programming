#include <stdio.h>
int P_num = 64, F_num = 99;/*Global variables which can be changed 
to calculate any power of 2 or Fibonacci, respectively*/
void setup (char a[101], char b[101], char c[101])
{
    a[0]='0', b[0]='1', c[0]='0';
    int i=1;
    for(i;i<=101;++i)
    {
    	a[i]='0', b[i]='0', c[i]='0';  //all other entries are 0 (for now)
    }
}
void add(char a[101], char b[101], char c[101])
{
    int i=0, x=0, y=0, w=0;//initialising to 0 ensures no "garbage values"
    while((a[i]>='0'&&a[i]<='9')||(b[i]>='0'&&b[i]<='9'))
    {
        x = a[i] - '0';//this promotes a char to an int
        y= b[i] - '0';
        if(w!=0)
        {
            x +=w;//if previous x+y>=10, then carry = 1
            w=0;
        }
        if(x+y>=10)
        {
            x-=10;//this allows for the "carry" to move rightwards
            w=1;
        }
        c[i] = x + y + '0';//converts int back to char
        ++i;
    }
}
void power_of_2(char b[101], char c[101])
{
    if(P_num !=0)
    {
        P_num--;
        add (b, b, c);
        power_of_2(c, b);//recursion was more efficient here
    }
}
void fibonacci (char a[101],char b[101], char c[101])
{
    int i=0;
    char*temp[101];//this pointer allows arrays to be swapped
    i++;
    for(i;i<=F_num;i++)
    {
        add (a, b, c);
        *temp=c;
        c=a;
        a=b;
        b=*temp;
    }
}
void printe (char c[101])
{
    int i=101, j=0;
    while(c[i]=='0')
    {
        c[i]='\0';//this deletes the unneccesary zeros, 
        //hence shortening the length of the string if necessary
        //in this case, by approximately 80 elements.
        --i;
    }
    printf("%c.", c[i]);
    i--;
    for(i;i>=0;--i)
    {
        if(j<=9)
            printf("%c", c[i]);
        ++j;//truncating here,i.e. cutting off at 10 d.p. & rounding down
    }
    printf(" e+%d\n", j);
}
int main()
{
    char a[101], b[101], c[101];
    setup(a, b, c); 
	printf("2^%d:\t",P_num); 
	power_of_2(b, c); printe(b);
    setup(a, b, c); 
	printf("F_%d:\t",F_num); 
	fibonacci(a, b, c); 
	printe(a);
}
