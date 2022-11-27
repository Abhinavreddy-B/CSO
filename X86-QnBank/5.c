#include <stdio.h>

typedef long long int ll;

extern ll func(ll x);

int main(){
    ll x;
    scanf("%lld",&x);
    printf("%lld\n",func(x));
}