#include <stdio.h>

extern long long int greatestCommonDivisor(long long int a,long long int b);

int main(){
    int n,m;
    scanf("%d%d",&n,&m);
    printf("%lld\n",greatestCommonDivisor(n,m));
}