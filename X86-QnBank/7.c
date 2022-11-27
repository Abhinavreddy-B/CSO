#include <stdio.h>

typedef long long int ll;

extern ll func(ll *a,ll n,ll key);

int main(){
    ll n;
    scanf("%lld",&n);
    ll a[n];
    for(int i=0;i<n;i++){
        scanf("%lld",&a[i]);
    }
    ll key;
    scanf("%lld",&key);
    ll pos=func(&a[0],n,key);
    printf("%lld\n",pos);
}