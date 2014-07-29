Program munka;
{Ertekel‹ a  feladathoz}
Uses TestLib;

Var
  t:Integer;

Procedure Eval;
const
  maxN=30000;
Var
   n,mego,Vmego,i:longint;
   E,V:array[1..maxN] of longint;
   P:array[1..maxN] of boolean;
   x,et,vt:longint;
Begin{Eval}
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
   readln(TinF,n);
   for i:=1 to n do begin
      read(Tinf,E[i]);
      P[i]:=false;
   end;
   readln(Tinf);
   for i:=1 to n do read(Tinf,V[i]);
   et:=0; vt:=0;
   for i:=1 to n do begin
   {$I-}
    Read(CoutF, x);
   {$I+}
   If IOResult<>0 Then Begin
       WriteMSG(2,'HIBA: Output formátum hiba');
       Exit;
    End;
     if (x<1)or(x>n) then begin
       WriteMSG(2,'HIBA: hibás sorszám');
       Exit;
     end;
     if (P[x]) then begin
       WriteMSG(2,'HIBA: többször!');
       Exit;
     end;
     P[x]:=true;
     et:=et+E[x];
     if et+V[x]>vt then
			vt:=et+V[x];
   end{for i};

   if (mego<>vt) then begin
       WriteMSG(1,'HIBA: a megadott megoldás nem optimális');
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
