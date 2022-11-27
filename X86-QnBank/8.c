#include <stdio.h>

typedef long long int ll;

extern void func(ll *a,ll *b, ll *ans,ll m,ll n,ll p);

int main(){
    ll n,m,p;
    scanf("%lld%lld%lld",&m,&n,&p);
    ll a[m][n];
    ll b[n][p];
    for(int i=0;i<m*n;i++){
        scanf("%lld",&a[i/n][i%n]);
    }
    for(int i=0;i<n*p;i++){
        scanf("%lld",&b[i/p][i%p]);
    }
    ll c[m][p];
    func(&a[0][0],&b[0][0],&c[0][0],m,n,p);
    for(int i=0;i<m;i++){
        for(int j=0;j<p;j++){
            printf("%lld ",c[i][j]);
        }
        printf("\n");
    }
}