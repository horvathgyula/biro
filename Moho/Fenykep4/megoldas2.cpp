//Fénykép
#include<iostream>
#include<stdio.h>
#include <queue>
#include <list>
#define  maxM 10001
#define  maxN 100001
using namespace std;

int N,K, maxT=0;
int Erk[maxN];
list<int> Tav[maxM];
int main() {
   FILE *be=fopen("fenykep.be","r");
   FILE *ki=fopen("fenykep.ki","w");
   fscanf(be, "%d %d",&N, &K);
   int a,b;
   for(int i=1;i<=N;i++){
      fscanf(be, "%d %d",&a ,&b );
      Erk[i]=a;
      Tav[b].push_front(i);
      if(b>maxT) maxT=b;
   }
    priority_queue<int> H;
   int i=0; int m=0;
   int Beoszt[maxN];

   for (int x=maxT; x>0; x--){
      for(int y:Tav[x])
         H.push(y);

      if(H.size()>=K){
         for(int ii=1;ii<=K;ii++){
            int e=H.top(); H.pop();
            Beoszt[m++]=e;
         }
      }
       while(H.size()>0 && Erk[ H.top()]==x)
         H.pop();
    }//for x
   fprintf(ki,"%d\n", m/K);
   for(int i=0;i<m;i++){
      fprintf(ki, "%d ",Beoszt[i]);
      if((i+1)%K==0) fprintf(ki, "\n");
   }
   fprintf(ki,"\n");
    return 0;
}//end main


