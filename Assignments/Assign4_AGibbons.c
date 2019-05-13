#include <stdio.h>
#include <math.h>
int i=3;
void print_prime_factors(int n)
{
    if(i==1)
    printf("\n");
    if(n%2==0) 
       // this allows all factors of 2 to be taken out immediately
       {
            printf("2 ");
            n/=2;
            print_prime_factors(n);
            return;
        }
    if(i<=sqrt(n))
    {
        if(n%i == 0)
        {
            printf("%d ", i);
            n/=i;
            print_prime_factors(n);
            return;
        }
        else
        {
            i+=2;
            //Because the 2's have been taken out above, 
            //this makes for a much more efficient program 
            //as all even numbers are skipped
            print_prime_factors(n);
            return;
        }
    }
    if(n>2)
    printf("%d ", n);
}

int main()
{
    int n;
    while(scanf("%d", &n)==1)
    {
        printf("%d:\t", n);
        print_prime_factors(n);
        printf("\n");
        i=3;
    }
}
