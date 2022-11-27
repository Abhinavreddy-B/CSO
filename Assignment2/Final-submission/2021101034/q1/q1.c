#include <stdio.h>

extern void func(int n,long long int* inp,long long int* ans);

int main(){
    int n;
    scanf("%d",&n);
    long long int inp[n];
    long long int ans[n];
    for(int i=0;i<n;i++){
        scanf("%lld",&inp[i]);
    }
    func(n,inp,ans);
    for(int i=0;i<n;i++){
        printf("%lld ",ans[i]);
    }
    printf("\n");
}