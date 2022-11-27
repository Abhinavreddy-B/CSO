#include <stdio.h>

typedef long long int ll;

extern ll func(ll m, ll n, ll s);

int main(){
    ll m,n,s;
    scanf("%lld%lld%lld",&m,&n,&s);
    printf("%lld\n",func(m,n,s));
}