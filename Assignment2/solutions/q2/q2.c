#include <stdio.h>

extern long long int func(long long int n,long long int diff);

int main(){
    long long int n;
    scanf("%lld",&n);
    printf("%lld\n",func(n,0));
}