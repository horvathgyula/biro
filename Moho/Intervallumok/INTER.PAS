Program Lepcso;
{Ertekelã a LEPCSO feladathoz}
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
  MaxV=10000;
Var
{  Int:Array[1..MaxV] of Rekord K,V:Word End;}
  t:Integer;

Procedure Eval;
Type 
  Lanc=^Cella;
  Cella=Record veg:Word; csat:Lanc End;
Var
  N,M,VM: Longint;
  VI:Array[1..MaxV] of Boolean;
  Int:Array[1..MaxV] of Lanc;
  KX,VX,i,j,x,y:Longint;
  Cell,P:Lanc;

Begin{Eval}
  ReadLn(TInF, N);
  For x:=1 To MaxV Do Int[x]:=Nil;
  For i:=1 To N Do Begin
    ReadLn(TinF, KX, VX);
    New(Cell);
    Cell^.Veg:=VX;
    Cell^.csat:=Int[KX];
    Int[KX]:=Cell;    
  End{for i};

  ReadLn(ToutF,M);
 
  {$I-}
    ReadLn(CoutF, VM);
   {$I+}
   If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output form·tum hiba');
     Exit;
   End;
   If M<>VM Then Begin
     WriteMSG(1,'HIBA: A megold·s '+InttoStr(M)+' Ès nem '+InttoStr(VM));
     Exit;
   End;

   Grade(1,1);
   WriteMSG(1,'HELYES');

  For i:=1 To MaxV Do 
    VI[i]:=False;

  For i:=1 To M Do Begin
    {$I-}
      ReadLn(CoutF, KX, VX);
    {$I+}
    If IOResult<>0 Then Begin
      WriteMSG(2,'HIBA: Output form·tum hiba');
      Exit;
    End;
    If (KX<1)Or(KX>MaxV)Or(VX<1)Or(VX>MaxV) Then Begin
      WriteMSG(2,'HIBA: Output form·tum hiba');
      Exit;
    End;
    P:=Int[KX];
    While (P<>Nil)And(P^.Veg<>VX) Do P:=P^.csat;
    If P=Nil Then Begin
      WriteMSG(2,'HIBA: Nincs ilyen intervallum: '+InttoStr(KX)+' '+InttoStr(VX));
      Exit;
    End;
   
    For j:=KX To VX Do VI[j]:=True;
  End{for i};

  For x:=1 To MaxV Do Begin
    P:=Int[X];
    While P<>Nil Do Begin
      y:=P^.Veg; 
      p:=P^.csat;
      If Not VI[X] And Not VI[y] Then Begin
        WriteMSG(2,'HIBA: Nincs lefedve: '+InttoStr(X)+' Ès nem '+InttoStr(y));
        Exit;      
      End;
    End{while};
  End{for i};

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
