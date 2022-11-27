#include <stdio.h>

extern long long int func(long long int *arr,long long int m,long long int n);

int main(){
    long long int n,m;
    scanf("%lld%lld",&m,&n);
    long long int arr[m][n];
    for(int i=0;i<m*n;i++){
        scanf("%lld",&arr[i/n][i%n]);
    }
    printf("%lld\n",func(&arr[0][0],m,n));
}