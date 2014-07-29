Program Hatarido;
{Ertekelã a HATARIDO feladathoz}
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
Var
  t:Integer;
Procedure Eval;
Var
  M1,N,VM1: Longint;
  i: integer;
  utem: array [1..10000] of record ido,bunt: integer; end;
Procedure Sor1;
Begin
  {$I-}
    ReadLn(CoutF, VM1);
   {$I+}
   If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output form·tum hiba');
     Exit;
   End;
   If (M1<>VM1) Then Begin
     WriteMSG(1,'HIBA: A megold·s hib†s');
   End Else Begin
     Grade(1,1);
     WriteMSG(1,'HELYES');
   End;
End;
Procedure Sor2;
  var volt: array[1..10000] of boolean;
      bunt: longint;
      i,j: integer;
Begin
  for i:=1 to n do volt[i]:=false; bunt:=0;
  i:=0;
  while not seekeoln(CoutF) do
  begin
  {$I-}
    inc(i); Read(CoutF, j);
   {$I+}
   If IOResult<>0 Then Begin
     WriteMSG(2,'HIBA: Output form·tum hiba');
     Exit;
   End;
   If (j<1) or (j>n) Then Begin
     WriteMSG(2,'HIBA: Hib†s sorsz†m');
     exit;
   End;
   If volt[j] Then Begin
     WriteMSG(2,'HIBA: Tîbbszîr beosztott munka');
     exit;
   End; volt[j]:=true;
   if utem[j].ido<i then bunt:=bunt+utem[j].bunt;
  end;
  If i<n Then Begin
     WriteMSG(2,'HIBA: Nincs beosztva minden munka');
   End
   Else If bunt<>M1 Then Begin
     WriteMSG(2,'HIBA: Nem optim†lis ÅtemezÇs');
   End else Begin
     Grade(2,1);
     WriteMSG(2,'HELYES');
   End;
End;
Begin{Hatarido}
  ReadLn(ToutF, M1);
  Readln(TinF, N);
  for i:=1 to n do readln(TinF,utem[i].ido,utem[i].bunt);
  Sor1;
  Sor2;
End{Eval};

Begin{Prog}
  For t:=1 To TCase Do Begin
    If DoTest Then
      Eval;
  End;
  Done;
End.
