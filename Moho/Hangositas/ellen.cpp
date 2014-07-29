#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <stdlib.h>

using namespace std;
typedef struct Rek{
   int r; int p;
   string ver;
}Rek;
string Tes;
Rek Ver[3];

void msg2(int resz, int pont, string verd, bool vege){
   Ver[resz].p=pont;
   Ver[resz].ver=verd;
   if (vege){
      cout<<Tes+";1;"<<Ver[1].p<<";"+Ver[1].ver<<":";
      cout<<Tes+";2;"<<Ver[2].p<<";"+Ver[2].ver<<endl;
      exit(1);
   }
}
void msg2(){
      cout<<Tes+";1;"<<Ver[1].p<<";"+Ver[1].ver<<":";
      cout<<Tes+";2;"<<Ver[2].p<<";"+Ver[2].ver<<endl;
      exit(1);
}
int main(int argc, char *argv[]){
   Tes=argv[3];
   string TinFn=(string)argv[1]+"/in."+Tes;
   string ToutFn=(string)argv[1]+"/out."+Tes;
   string CoutFn=(string)argv[2]+"/out."+Tes;

   ifstream TinF(TinFn.c_str());
   ifstream ToutF(ToutFn.c_str());
   ifstream CoutF(CoutFn.c_str());

   Ver[1].p=0; Ver[1].ver="";
   Ver[2].p=0; Ver[2].ver="";

   int M1,M2,VM1,VM2;
   ToutF>>M1>>M2;
   ToutF.close();

   try{
      CoutF>>VM1>>VM2;
      if (CoutF.fail())
         msg2(1,0,"Output formátum hiba",1);
      CoutF.close();
   }catch(...){
      msg2(1,0,"Output formátum hiba",1);
   }
   if (M1==VM1){
      msg2(1,1,"Helyes",0);
   }else{
      msg2(1,0,"Hibás kimenet",0);
   }
   if (M2==VM2){
      msg2(2,1,"Helyes",0);
   }else{
      msg2(2,0,"Hibás kimenet",0);
   }
   msg2();
   return 0;
}
