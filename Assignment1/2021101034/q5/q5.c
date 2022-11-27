#include <stdio.h>

extern long long int  squareOfSums(long long int n);

int main(){
    long long int n;
    scanf("%lld",&n);
    printf("%lld\n",squareOfSums(n));
}