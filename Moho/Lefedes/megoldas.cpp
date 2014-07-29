#include<stdio.h>
#include<stdlib.h>
#define maxN 100001
using namespace std;

typedef struct{
   int x; bool kov;
}Pont;

typedef struct{
   int az; int tav;
}Res;
int Pont_Rend(const void* a,const void* b) {
  int ax =((Pont*) a)->x;
  int bx =((Pont*) b)->x;
  if (ax == bx) return 0;
   else if (ax > bx) return 1;
   else return -1;
}
int Res_Rend(const void* a,const void* b) {
   int ax =((Res*) a)->tav;
   int bx =((Res*) b)->tav;
   if (ax == bx) return 0;
   else if (ax > bx) return 1;
   else return -1;
}

int main(){
   int n,k,i,ii,x;
   Pont P[maxN];
   Res R[maxN];

   FILE *be=fopen("lefed.be","r");
   FILE *ki=fopen("lefed.ki","w");
   fscanf(be, "%d %d",&n, &k);
   for(int i=0;i<n;i++){
      fscanf(be, "%d",&x);
      P[i].x=x; P[i].kov=false;
   }
   P[n].kov=false;
   fclose(be);
   qsort((char*)(P), n, sizeof(Pont), Pont_Rend);
   P[n].x=2*P[n-1].x;
   for(int i=0;i<n;i++){
      R[i].az=i;
      R[i].tav=P[i+1].x-P[i].x;
   }
   qsort((char*)(R), n, sizeof(Res), Res_Rend);
   for(int i=0;i<n-k;i++){
      P[R[i].az].kov=true;
   }
   int hossz=0;
   i=0;
   while(i<n){
      ii=i;
      while(P[ii].kov) ii++;
      if (i==ii)
         hossz++;
      else
         hossz+=P[ii].x-P[i].x;
      i=ii+1;
   }
   fprintf(ki, "%d\n", hossz);
   i=0;
   while(i<n){
      ii=i;
      while(P[ii].kov) ii++;
      if (i==ii)
         fprintf(ki, "%d %d\n", P[i].x, P[i].x+1);
      else
         fprintf(ki, "%d %d\n", P[i].x, P[ii].x);
      i=ii+1;
   }
   fclose(ki);
   return 0;
}
