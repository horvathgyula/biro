Program szinez;
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
const
  maxN=1000;
Var
  N,M,VK,K,x,y:Longint;
  i:integer;
  A,B,E:array[1..MaxN] of integer;
procedure sor2;
var i,ii,j:integer;
begin
  if K=0 then begin
    Grade(2,1);
    WriteMSG(2,'HELYES');
    exit
  end;

  for ii:=1 to K do begin
{$I-}
   Read(CoutF, i);
{$I+}
   If IOResult<>0 Then Begin
     WriteMSG(2,'HIBA: Output formátum hiba');
     Exit;
   End;
   if (i<1)or(i>M) then begin
     WriteMSG(2,'HIBA: hib s vend‚gsorsz m');
     Exit;
   end;
   for j:=1 to n do
     if (A[i]<=E[j])and(E[j]<=B[i]) then begin
       E[j]:=0;
     end;

  end{for i};
  j:=1;
  while (j<=n)and(E[j]=0) do inc(j);
  if j<=n then begin
   WriteMSG(2,'HIBA: nem minden esem‚nyre van tan£');
     Exit;
  end;

  Grade(2,1);
  WriteMSG(2,'HELYES');
end;

Begin{Eval}
  ReadLn(TinF,M,N);
  for i:=1 to M do begin
    readln(TinF, A[i], B[i]);
  end;
  for i:=1 to N do read(TinF,E[i]);

  ReadLn(ToutF,K);

  {$I-}
   ReadLn(CoutF, VK);
{$I+}
   If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output formátum hiba');
     Exit;
   End;
   If K<>VK Then Begin
     WriteMSG(1,'HIBA: a kiv lasztott vend‚gek száma hibás');
     Exit;
   End;
  Grade(1,1);
  WriteMSG(1,'HELYES');

  sor2;
End{Eval};

Begin{Prog}
  For t:=1 To TCase Do Begin
    If DoTest Then
      Eval;
  End;
  Done;
End.
