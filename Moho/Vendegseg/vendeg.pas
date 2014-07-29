Program vendeg;
Uses TestLib;
Const
  MaxN=1000000;
  MaxM=100000;
Var
  t:Integer;

Procedure Eval;
Var
  i,N,ki,hany:longint;
  Be: array[1..MaxN] of record a,b:longint end;
  mego:longint;
Begin{Eval}
  ReadLn(TinF, N);
  for i:=1 to n do begin
       readln(TinF,Be[i].a, Be[i].b);
  end;
   readln(Toutf,ki, mego);

   {$I-}
    Readln(CoutF, ki, hany);
   {$I+}
   If IOResult<>0 Then Begin
       WriteMSG(1,'HIBA: Output formátum hiba');
       Exit;
    End;
     if (mego<>hany) then begin
       WriteMSG(1,'HIBA: a találkozások száma hibás');
       Exit;
     end;
   hany:=0;
   for i:=1 to N do begin
		if (Be[ki].a<=Be[i].b)and(Be[i].a<=Be[ki].b) then inc(hany);
   end;

     if (mego+1<>hany) then begin
       WriteMSG(1,'HIBA: a megoldás nem optimális');
       Exit;
     end;

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
