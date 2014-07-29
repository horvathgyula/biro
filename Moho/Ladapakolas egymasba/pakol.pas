Program Pakol;
{Ertekel‹ a  feladathoz}
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
Const
  MaxN=10000;
Var
  t:Integer;

Procedure Eval;
Var
  i,N,x,y,vx,vy:longint;
  A,F: array[0..maxn] of longint;

Begin{Eval}
  ReadLn(TinF, N);
  for i:=1 to n do begin
    Read(Tinf,x);
    A[i]:=x; F[i]:=x;

   end;
   readln(Toutf,x,y);
   if (x=0)and(y=0) then begin
   {$I-}
    Read(CoutF, vx,vy);
   {$I+}
   If IOResult<>0 Then Begin
       WriteMSG(1,'HIBA: Output formátum hiba');
       Exit;
    End;
   If (vx<>0)or(vy<>0) Then Begin
       WriteMSG(1,'HIBA: nincs megoldás');
       Exit;
    End;
     Grade(1,1);
     WriteMSG(1,'HELYES');
     exit;
   end{nincs megó};

  for i:=1 to n-1 do begin
  {$I-}
    Readln(CoutF, vx,vy);
  {$I+}
     If IOResult<>0 Then Begin
       WriteMSG(1,'HIBA: Output formátum hiba');
       Exit;
     End;
     If (vx<1) or(vx>N) or(vy<1) or(vy>N) or (vx=vy) Then Begin
       WriteMSG(1,'HIBA: hibás pozíció');
       Exit;
     End;
     if (A[vx]=0)or(F[vx]=0)or(A[vy]=0)or(F[vy]=0) then begin
       WriteMSG(1,'HIBA: üres helyre(röl) pakolna');
       Exit;
     end;

     if (A[vx]+1<>F[vy]) then begin
       WriteMSG(1,'HIBA: hibás pakolási mûvelet');
       Exit;
     end;
     F[vy]:=F[vx];
     A[vx]:=0;F[vx]:=0;
   end{for i};

   Grade(1,1);
   WriteMSG(1,'HELYES');
End{Eval};

Begin{Prog}
  For t:=1 To TCase Do Begin
    If DoTest Then
      Eval;
  End;
  Done;
End.
