Program koncert;
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
  MaxN=100000;
  MaxM=200000;
Var
  t:Integer;

Procedure Eval;
Var
  i,N,M:longint;
  Be: array[1..MaxN] of record a,b:longint end;
  Szek:array[1..maxM] of boolean;
  Ul:array[1..maxN] of boolean;
  mego,Vmego,x,y:longint;
Begin{Eval}
  ReadLn(TinF, M,N);
  for i:=1 to n do begin
       readln(TinF,Be[i].a, Be[i].b);
       Ul[i]:=false;
  end;
   readln(Toutf,mego);

   {$I-}
    Readln(CoutF, Vmego);
   {$I+}
   If IOResult<>0 Then Begin
       WriteMSG(1,'HIBA: Output formátum hiba');
       Exit;
    End;
     if (mego<>Vmego) then begin
       WriteMSG(1,'HIBA: a megoldás nem optimális');
       Exit;
     end;
   Grade(1,1);
   WriteMSG(1,'HELYES');
   for i:=1 to M do Szek[i]:=false;
   for i:=1 to mego do begin
      Readln(CoutF, x,y);
      if (x<1)or(x>N)or(y<1)or(y>M) then begin
        WriteMSG(2,'HIBA: hibás ültetés');
        exit;
      end;
      if (y<Be[x].a)or(y>Be[x].b) then begin
        WriteMSG(2,'HIBA: nem igénynek megfelelõ ültetés');
        exit;
      end;
      if Ul[x] then  begin
        WriteMSG(2,'HIBA: valaki kétszer kapna');
        exit;
      end;
      if (Szek[y]) then begin
        WriteMSG(2,'HIBA: ott már ülnek');
        exit;
      end;
      Ul[x]:=true;
      Szek[y]:=true;
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
