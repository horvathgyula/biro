Program raktar;
{Ertekel� a  feladathoz}
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
Const
  MaxK=10000;
  MaxN=2000000;
Var
  t:Integer;

Procedure Eval;
Var
  i,j,N,K:longint;
  P: array[1..MaxK] of longint;
  A:array[1..MaxN] of longint;
  mego,Vmego,x,y:longint;
  l:char;
Begin{Eval}
  ReadLn(TinF, N,K);
  for i:=1 to n do begin
    read(TinF,A[i]);
  end;
   readln(Toutf,mego);

   {$I-}
    Readln(CoutF, Vmego);
   {$I+}
   If IOResult<>0 Then Begin
       WriteMSG(1,'HIBA: Output form�tum hiba');
       Exit;
    End;
     if (mego<>Vmego) then begin
       WriteMSG(1,'HIBA: a megold�s nem optim�lis');
       Exit;
     end;
   Grade(1,1);
   WriteMSG(1,'HELYES');

   for i:=1 to K do P[i]:=K+1;
   for i:=1 to N do begin
      Read(CoutF, j);
      if (j<1)and(j>mego) then begin
        WriteMSG(2,'HIBA: illeg�lis oszlopsz�m');
        exit;
      end;
      if (A[i]>P[j]) then begin
        WriteMSG(2,'HIBA: illeg�lis pakol�s');
        exit;
      end;
      P[j]:=A[i];
   end;

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
