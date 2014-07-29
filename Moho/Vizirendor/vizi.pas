Program vizi;
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
  MaxN=1000;
Var
  N,A,B,K,M,Vm,Ka,Kb:Longint;
  i,x,xx:integer;
  T:array[1..MaxN] of integer;
  V:array[1..MaxN] of boolean;
Begin{Eval}
  readln(TinF,N,A,B,K);
  T[1]:=0;
  for i:=2 to N do begin
     readln(TinF,T[i]);
  end;
  KA:=K*A; KB:=K*B;
  for i:=1 to N do begin
     V[i]:=false;
  end;

  read(ToutF,M);
 {$I-}
    read(CoutF,VM);
{$I+}
  If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output formátum hiba');
     Exit;
  End;
  if M<>VM then begin
    WriteMSG(1,'HIBA: hibás a megoldás');
    Exit;
  end;
  Grade(1,1);
  WriteMSG(1,'HELYES');
  for i:=1 to M do begin
 {$I-}
    read(CoutF,x);
{$I+}
    If IOResult<>0 Then Begin
      WriteMSG(1,'HIBA: Output formátum hiba');
      Exit;
    End;
    if (x<1)or(x>N) then begin
      WriteMSG(1,'HIBA: hibás várossorszám');
      Exit;
    end;
    xx:=x;
    V[x]:=true;
    while (xx>0)and(T[x]-T[xx]<=KB) do begin
       V[xx]:=true;
       dec(xx);
    end;
    xx:=x;
    while (xx<=N)and(T[xx]-T[x]<=KA) do begin
       V[xx]:=true;
       inc(xx);
    end;
  end{for i};
  for i:=1 to N do
    if not V[i] then begin
      WriteMSG(2,'HIBA: nem minden város érhetõ el idõben');
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
