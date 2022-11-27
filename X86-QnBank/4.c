#include <stdio.h>

typedef long long int ll;

extern ll func(ll n,ll m);
int main(){
    ll n,m;
    scanf("%lld%lld",&n,&m);
    printf("%lld\n",func(n,m));
}