#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int m, n;
typedef struct INT_NODE
{ 
    int item; struct INT_NODE * next; 
}
INT_NODE;
typedef struct 
{ 
    INT_NODE * first, * last; 
}
INT_LIST;
INT_NODE * make_int_node ( int x )
{
	INT_NODE * node = (INT_NODE*) calloc(1,sizeof(INT_NODE));
	node->item = x;
	return node;
}
INT_LIST * make_int_list ( void )
{
	INT_LIST * list = (INT_LIST*) calloc(1,sizeof(INT_LIST));
	return list;
}
void append (int x, INT_LIST*list)
{
    INT_NODE * p = make_int_node ( x );
    if ( list->first == NULL )
        list->first = list->last = p;
    else
    {
        list->last->next = p;
        list->last = p;
    }
}
int ** make_matrix(int height, int width )//from assignment 6
{
    int ** mat = (int**)calloc(height, sizeof ( int * ) );
    int * pool = (int*)calloc(height*width, sizeof(int));
    int i;
    for (i=0; i<height; ++i)
    {
        mat[i] = pool+ width * i; 
    }
    return mat;
}
void sort_column(int k, int ** mat)
{
    int i=0, j=0, count=0;
    int**temp=make_matrix(m, n);//using temp matrix which can be copied to original mat
    INT_LIST *list[100];
    for(i;i<100;i++)//numbers 0-99
    {
        list[i]=make_int_list();//making array of 100 lists
    }
    for(i=0;i<m;i++)
    {
        append(i, list[mat[i][k]]);//append row number to each list
    }
    for(j;j<100;j++)
    {
        INT_NODE * p = list[j]->first;
        while ( p != NULL )//ignore cases with null
        {
            temp[count]=mat[p->item];//temp matrix has rows in order desired
            count++; p = p->next;//increment p
        }
    }
	for(i=0;i<m;i++)
        mat[i]=temp[i];
}
int main(int argc, char *argv[])
{
    int k = atoi(argv[1]), i, j;
    scanf("%d %d ", &m, &n);
    printf("%d %d\n", m, n);
    int**mat=make_matrix(m, n);
    for(i=0; i <m; i++)
	{
   		for(j=0; j< n; j++)
    	{
            scanf("%d", &mat[i][j]);
    	}
	}
    sort_column(k, mat);//sorting the matrix on column k
    for(i=0; i <m; i++)//printing sorted matrix in the form
	{
   		for(j=0; j< n; j++)
    	{
            printf("%d ", mat[i][j]);
    	}
    	printf("\n");
	} 
}
