#include <stdio.h>

typedef long long int ll;

extern ll func(ll *arr,ll n);

int main(){
    ll N;
    scanf("%lld",&N);
    ll arr[N];
    for(int i=0;i<N;i++){
        scanf("%lld",&arr[i]);
    }
    func(&arr[0],N);
    for(int i=0;i<N;i++){
        printf("%lld ",arr[i]);
    }
    printf("\n");
}