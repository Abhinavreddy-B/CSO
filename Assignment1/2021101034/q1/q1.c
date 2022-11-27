#include <stdio.h>

extern long long int quotient(long long int M,long long int N);
extern long long int remaindr(long long int M,long long int N);

int main(){
    long long m,n;
    scanf("%lld%lld",&m,&n);
    printf("%lld ",quotient(m,n));
    printf("%lld\n",remaindr(m,n));
    return 0;
}