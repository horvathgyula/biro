Program termek;
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
  maxN=200;
  maxM=500;
Var
  N:Longint;
  Terem,A,B:array[1..maxn] of integer;
  Mego,VMego,i,x:longint;
  Be:array[1..maxn] of boolean;
  beoszt:longint;
Begin{Eval}
 readln(TinF,N);
 for i:=1 to N do begin
   readln(TinF, A[i], B[i]);
   Terem[i]:=0;
 end;
  read(ToutF,Mego);

{$I-}
  readln(CoutF,VMego);
{$I+}
  If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output formátum hiba');
     Exit;
  End;
  if (Mego<>Vmego) then begin
    WriteMSG(1,'HIBA: a szükseges termek száma hibás');
    Exit;
  end;
  Grade(1,1);
  WriteMSG(1,'HELYES');
  for i:=1 to N do Be[i]:=false;
  beoszt:=0;

  for i:=1 to Mego do begin
    while not Seekeoln(CoutF) do begin
{$I-}
      read(CoutF, x);
{$I+}
      If (IOResult<>0)or(x<1)or(x>N) Then Begin
        WriteMSG(2,'HIBA: Output formátum hiba');
        Exit;
      End;
      If Be[x] Then Begin
        WriteMSG(2,'HIBA: többszörös beosztás');
        Exit;
      End;
      if Terem[i]>A[x] then begin
        WriteMSG(2,'HIBA: ütközik két elõadás');
        Exit;
      end;
      Terem[i]:=B[x];
      inc(beoszt);
    end;

    readln(CoutF);
  end{for i};

  if beoszt<>N then begin
        WriteMSG(2,'HIBA: van benemosztott elõadás');
        Exit;
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
