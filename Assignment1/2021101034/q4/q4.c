#include <stdio.h>

extern long long int largestPrimeFactor(long long int n);

int main(){
    long long int n;
    scanf("%lld",&n);
    printf("%lld\n",largestPrimeFactor(n));
}