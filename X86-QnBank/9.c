#include <stdio.h>

typedef long long int ll;

extern long long int func(long long int N);

int main(){
    ll N;
    scanf("%lld",&N);
    printf("%lld\n",func(N));
}