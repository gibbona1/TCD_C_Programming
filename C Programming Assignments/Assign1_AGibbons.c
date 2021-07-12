#include <stdio.h>

int main()
{
    int i=10; //i here is the variable for bottles
    for(i;i>8;)
    {
        printf("%d green bottles standing on a wall\n", i);
        printf("%d green bottles standing on a wall\n", i);
        printf("If one green bottle should accidentally fall\n");
        i=i-1;
        printf("There’d be %d green bottles standing on a wall.\n\n", i);
    }
}

