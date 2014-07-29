Program Utemez;
{Ertekelã a Utemez feladathoz}
Uses TestLib;
{Import†lt elemek:
TCase:Integer;           a tesztesetek sz†ma
Function DoTest:Boolean; a teszteset ÇrtÇkelhetã, van output f†jl
Procedure Done;          az ÇrtÇkelÇs vÇgÇnek jelzÇse
Procedure Grade(rf, v:Integer); az rf rÇszfeladat ÇrtÇklÇse, v=0/1
                                ha nem h°vjuk, 0 ÇrtÇket kap a teszeset
Procedure WriteMSG(rf:Integer; M:String); az rf rÇszfeladat ÇrtÇkelÇsÇnekmagyar†zata
            ha nem h°vjuk, Åresen marad
TInF:Text;  teszt input, megnyitva
ToutF:Text; teszt output, megnyitva
CoutF:Text; a versenyzã output †llom†nya, megnyitva
}
Const
  MaxN=10000;
  MaxVH=10000;
Var
  t:Integer;
Procedure Eval;
Var
  N,i: Longint;
  U,V,H:Array[1..MaxN] of Integer;
  M,VM,x,y,Ido:Longint;
Begin{Eval}
  ReadLn(TinF, N);
  For i:=1 To N Do Begin
    Read(TinF, V[i], H[i]);
  End;
  ReadLn(ToutF, M);

   {$I-}
    ReadLn(CoutF, VM);
   {$I+}
   If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output form·tum hiba');
     Exit;
   End;
   If (VM<>M) Then Begin
     WriteMSG(1,'HIBA: Az optim†lis megold·s ÈrtÈÇke hib·s');
     Exit;
   End;
  Grade(1,1);
  WriteMSG(1,'HELYES');
  VM:=0;
  For i:=1 To M Do Begin
   {$I-}
    Read(CoutF, x);
   {$I+}
   If IOResult<>0 Then Begin
     WriteMSG(2,'HIBA: Output form·tum hiba');
     Exit;
   End;
   If (x<1)Or(x>N) Then Begin
       WriteMSG(2,'HIBA: Hib·s program sorsz·m');
       Exit;
    End;
    Inc(VM);
    U[VM]:=x;
  End{for};
  Ido:=0;
  For i:=1 To M Do Begin
    Ido:=Ido+V[U[i]];
    If H[U[i]]<Ido Then Begin
       WriteMSG(2,'HIBA: Hat·ridıt sÈrtı ¸temezÈs');
       Exit;
     End;
  End{};

  Grade(2,1);
  WriteMSG(2,'HELYES');
End{Eval};

Begin{Prog}
  For t:=1 To TCase Do Begin
    If DoTest Then
      Eval;
  End;
  Done;
End.
