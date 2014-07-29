Program Mozi;
Uses TestLib;
Var
  t:Integer;

Procedure Eval;
  const	
	maxM=10000;
  var 
  N,M,K, TM,VM,i, x,y:longint;
	Ker:array[1..maxM] of integer;
	Ul:array[1..maxM] of integer;
Begin{Eval}
 Readln(ToutF, TM);
{$I-}
   Readln(CoutF, VM);
{$I+}
   If IOResult<>0 Then Begin
       WriteMSG(1,'HIBA: Output formátum hiba');
       Exit;
   End;
   if TM<>VM then begin
        WriteMSG(1,'HIBA: hibás megoldás');
        Exit;
   end;	
 Grade(1,1);
  WriteMSG(1,'HELYES');	
  readln(TinF,M,N,K);
  for i:=1 to N do begin
	read(TinF, Ker[i]);
  end;
 for i:=1 to M do begin
	Ul[i]:=0;
  end;  
	for i:=1 to TM do begin
		read(ToutF, x,y);
		{$I-}
			Readln(CoutF, x,y);
		{$I+}
		If IOResult<>0 Then Begin
			WriteMSG(2,'HIBA: Output formátum hiba');
			Exit;
		End;
		if (x<1)or(x>N)or(y<1)or(y>M) then begin
			WriteMSG(2,'HIBA: hibás sorszám');
			Exit;
		end;	
		if Ul[y]>0 then begin
			WriteMSG(2,'HIBA: ott már ülnek');
			Exit;
		end;
		if (y<Ker[x])or(y>Ker[x]+K) then begin
//writeln(Ker[x],'?',x,' ',y,' ',K);
			WriteMSG(2,'HIBA: igénynek nem megfelelõ ültetés');
			Exit;
		end;		
		Ul[y]:=x;	
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
