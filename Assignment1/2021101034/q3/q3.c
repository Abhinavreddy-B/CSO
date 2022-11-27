#include <stdio.h>

extern int checkPrime(long long int n);
int main(){
    int n;
    scanf("%d",&n);
    int temp=checkPrime(n);
    if(temp==-1||temp==0){
        printf("FALSE\n");
    }else if(temp==1){
        printf("TRUE\n");
    }
}