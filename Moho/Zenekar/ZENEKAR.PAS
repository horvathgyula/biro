Program Zenekar;
Uses TestLib;
{Import lt elemek:
TCase:Integer;           a tesztesetek sz ma
Function DoTest:Boolean; a teszteset ‚rt‚kelhet‹, van output f jl
Procedure Done;          az ‚rt‚kel‚s v‚g‚nek jelz‚se
Procedure Grade(rf, v:Integer); az rf r‚szfeladat ‚rt‚kl‚se, v=0/1
                                ha nem h¡vjuk, 0 ‚rt‚ket kap a teszeset
Procedure WriteMSG(rf:Integer; M:String); az rf r‚szfeladat ‚rt‚kel‚s‚nekmagyar zata
            ha nem h¡vjuk, resen marad
TInF:Text;  teszt input, megnyitva
ToutF:Text; teszt output, megnyitva
CoutF:Text; a versenyz‹ output  llom nya, megnyitva
}
Var
  t:Integer;

Procedure Eval;
Const
  MaxN=1000;
  MaxNap=365;
Var
  N,M,VM,i,x,y,k,Vk:longint;
  E,U:Array[1..MaxN] of integer;
  Nap:Array[1..MaxNap] of   boolean;
  Haszon:Longint;

Begin{Eval}
  Haszon:=0;
  ReadLn(TinF,N);
  for i:=1 to N do
    Readln(TinF, E[i], U[i]);
 ReadLn(ToutF,M);

  {$I-}
   ReadLn(CoutF, VM);
{$I+}
  If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output form tum hiba');
     exit
   End;
  If (M<>VM) Then Begin
     WriteMSG(1,'HIBA: A megold s nem optim lis');
     exit
   End;
   Grade(1,1);
   WriteMSG(1,'HELYES');

   for i:=1 to MaxNap do Nap[i]:=true;

  for i:=1 to M do begin
   {$I-}
     ReadLn(CoutF, x,y);
  {$I+}
    If IOResult<>0 Then Begin
      WriteMSG(2,'HIBA: Output form tum hiba');
      exit
    End;
    If (x<1)or(x>n)or (y<1)or(y>MaxNap) Then Begin
      WriteMSG(2,'HIBA: hib s sorsz m');
      exit
    End;
    if Nap[y] and (E[x]<=y)and(y<=U[x]) then begin
       Nap[y]:=false;
    end else begin
      WriteMSG(2,'HIBA: hib s beoszt s');
      exit
    end;
  end{for};

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
