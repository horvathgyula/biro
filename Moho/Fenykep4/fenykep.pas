Program fenykep;
Uses TestLib;
Var
  t:Integer;

Procedure Eval;
  const	
	maxN=100002;
  var 
	N,K,i,j:longint;
	E,T:array[1..MaxN] of longint;
	M,VM,x, A,B:longint;
	Volt:array[1..maxN] of boolean;
Begin{Eval}
	readln(TinF, N,K);
	for i:=1 to N do begin
		readln(TinF, E[i], T[i]);
		Volt[i]:=false;
	end;
 Readln(ToutF, M);
 
 	If Eof(CoutF) Then Begin
       WriteMSG(1,'HIBA: Output form�tum hiba');
       Exit;
	End;
{$I-}
   Readln(CoutF, VM);
{$I+}
   If IOResult<>0 Then Begin
       WriteMSG(1,'HIBA: Output form�tum hiba');
       Exit;
   End;
   if M<>VM then begin
        WriteMSG(1,'HIBA: hib�s megold�s');
        Exit;
   end;	
 Grade(1,1);
  WriteMSG(1,'HELYES');	
  

	for i:=1 to M do begin
		A:=1; B:=10000;
		for j:=1 to K do begin
{$I-}
   Read(CoutF, x);
{$I+}
		
		If IOResult<>0 Then Begin
			WriteMSG(2,'HIBA: Output form�tum hiba');
			Exit;
		End;
		if (x<1)or(x>N) then begin
//writeln(x,'?',N);
			WriteMSG(2,'HIBA: hib�s sorsz�m');
			Exit;
		end;
		if Volt[x] then begin
			WriteMSG(2,'HIBA: volt m�r');
			Exit;
		end;
			if (A<E[x]) then A:=E[x];
			if (T[x]<B) then B:=T[x];
			if (A>B) then begin
				WriteMSG(2,'HIBA: nincs mind jelen!');
				Exit;
			end;			
			Volt[x]:=true;
		end{for j};
		readln(CoutF);
	end{for i};

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
