#include<stdio.h>
#include<stdlib.h>
#define maxN 100001
#include<iostream>
using namespace std;

int Pont_Rend(const void* a,const void* b) {
  if (*((int *) a) == *((int *) b)) return 0;
   else if (*((int *) a) > *((int *) b)) return 1;
   else return -1;
}

int main(){
   int n,i,e,x,ii;
   int P[maxN];
   int M[maxN];

   FILE *be=fopen("szamok.be","r");
   FILE *ki=fopen("szamok.ki","w");
   fscanf(be, "%d",&n);
   for(int i=0;i<n;i++){
      fscanf(be, "%d",&x);
      P[i]=x;
      M[i]=-1;
   }
   fclose(be);
   qsort((char*)(P), n, sizeof(int), Pont_Rend);
   int fedo=0;
   P[n]=2*P[n-1];
   e=0; i=2;
   while(i<=n){
      if (i==n-2){
         fedo+=P[i-1]-P[e];
         M[e]=i-1;
         fedo+=P[n-1]-P[i];
         M[i]=n-1;
         break;
      }
      while(i<n && (P[i]-P[i-1]<P[i+1]-P[i])) i++;
      fedo+=P[i-1]-P[e];
      M[e]=i-1;
      e=i; i+=2;
   }
   fprintf(ki, "%d\n", fedo);
   i=0;
   while(i<n){
      ii=M[i];
      fprintf(ki, "%d %d\n", P[i], P[ii]);
      i=ii+1;
   }
   fclose(ki);
   return 0;
}
