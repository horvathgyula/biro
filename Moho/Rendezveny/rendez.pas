Program Rendez;
Uses TestLib;
{Import�lt elemek:
TCase:Integer;           a tesztesetek sz�ma
Function DoTest:Boolean; a teszteset �rt�kelhet�, van output f�jl
Procedure Done;          az �rt�kel�s v�g�nek jelz�se
Procedure Grade(rf, v:Integer); az rf r�szfeladat �rt�kl�se, v=0/1
                                ha nem h�vjuk, 0 �rt�ket kap a teszeset
Procedure WriteMSG(rf:Integer; M:String); az rf r�szfeladat �rt�kel�s�nekmagyar�zata
            ha nem h�vjuk, �resen marad
TInF:Text;  teszt input, megnyitva
ToutF:Text; teszt output, megnyitva
CoutF:Text; a versenyz� output �llom�nya, megnyitva
}
Var
  t:Integer;

Procedure Eval;
const Max=1000;
Var
  N,i,M1,M2,VM1,VM2:longint;
  K,B:array[0..Max] of integer;
  Veg,j:longint;
Begin{Eval}
  ReadLn(TinF,N);
  for i:=1 to N do begin
     Read(TinF,K[i]);
     ReadLn(TinF,B[i]);
  end;
  ReadLn(ToutF,M1,M2);
{$I-}
   ReadLn(CoutF, VM1,VM2);
{$I+}
   If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output form�tum hiba');
     Exit;
   End;
   If (VM1<0)or(VM2<0) Then Begin
     WriteMSG(1,'HIBA: Hib�s kimenet');
     Exit;
   End;
   if M1+M2<>VM1+VM2 then Begin
     WriteMSG(1,'HIBA: Az el�add�sok sz�ma nem maxim�lis');
     Exit;
   End;
  Grade(1,1);
  WriteMSG(1,'HELYES');

  Veg:=0;
  for i:=1 to VM1 do begin
  {$I-}
     Read(CoutF, j);
  {$I+}
     If IOResult<>0 Then Begin
       WriteMSG(2,'HIBA: Output form�tum hiba');
       Exit;
     End;
     If (j<0)or(j>N) Then Begin
       WriteMSG(2,'HIBA: Hib�s el�ad�s sorsz�m');
       Exit;
     End;
     if (K[j]<=Veg) Then Begin
       WriteMSG(2,'HIBA: Hib�s beoszt�s, van k�t �tk�z� el�ad�s');
       Exit;
     End;
     Veg:=B[j];
  end{for};
  ReadLn(CoutF);

  Veg:=0;
  for i:=1 to VM2 do begin
  {$I-}
     Read(CoutF, j);
  {$I+}
     If IOResult<>0 Then Begin
       WriteMSG(2,'HIBA: Output form�tum hiba');
       Exit;
     End;
     If (j<0)or(j>N) Then Begin
       WriteMSG(2,'HIBA: Hib�s el�ad�s sorsz�m');
       Exit;
     End;
     if (K[j]<=Veg) Then Begin
       WriteMSG(2,'HIBA: Hib�s beoszt�s, van k�t �tk�z� el�ad�s');
       Exit;
     End;
     Veg:=B[j];
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
