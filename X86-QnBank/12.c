#include <stdio.h>

extern long long int func(long long int n,long long int k);

int main(){
    long long int N,k;
    scanf("%lld%lld",&N,&k);
    printf("%lld\n",func(N,k));
}