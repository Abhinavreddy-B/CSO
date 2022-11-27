#include <stdio.h>

typedef long long int ll;

extern ll func(ll n);

int main(){
    ll n;
    scanf("%lld",&n);
    int temp=func(n);
    if(temp){
        printf("TRUE\n");
    }else{
        printf("FALSE\n");
    }
    
}