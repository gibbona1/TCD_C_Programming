#include <stdio.h>
#include <stdlib.h>
double ** make_matrix(int height, int width )
{
    double ** mat = (double**)calloc(height, sizeof ( double * ) );
    double * pool = (double*)calloc(height*width, sizeof(double));
    int i;
    for (i=0; i<height; ++i)
    {
        mat[i] = pool+ width * i; 
    }
    return mat;
}
void max_min_avg(double**newmatrix, int height, int width)
{
    int i, j, maximum, minimum; double sum=0, count =1;
    for(j=0;j<width;j++)
    {
        maximum = newmatrix[0][j];
        minimum = newmatrix[0][j];
        for (i = 1; i < height; i++)
        {
            sum += newmatrix[i][j]; count++;
            if (newmatrix[i][j] > maximum)
            {
                maximum  = newmatrix[i][j];
            }
            if (newmatrix[i][j] < minimum)
            {
                minimum  = newmatrix[i][j];
            }
        }
        printf("\nColumn %d:\n \tMin = %d\n", j+1, minimum);
        printf("\tMax = %d\n",maximum);
        printf("\tAvg = %3.2lf\n",sum/count);
        sum=0, count=1;
    }
}
int main()
{
    int height, width, i, j;
    scanf("%d %d ", &height, &width);
    printf("No. of rows:%d\nNo. of columns:%d\n\n", height, width);
    double**newmatrix=make_matrix(height, width);
    for(i=0; i <height; i++)
	{
   		for(j=0; j< width; j++)
    	{
            scanf("%lf", &newmatrix[i][j]);
            printf("%3.0lf ", newmatrix[i][j]);
    	}
	    printf("\n");
	}
    max_min_avg(newmatrix, height, width);
    printf("\n");
}
