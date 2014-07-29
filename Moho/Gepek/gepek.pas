Program lepes;
Uses TestLib;
Var
  t:Integer;

Procedure Eval;
  const	
	maxM=100002;
	maxN=10002;
	type
		Lanc=^Cella;
		Cella=record gep:longint; csat:Lanc end;
  var 
	N,M,i,x,y:longint;
	VM,TM:longint;
	H:array[1..MaxM] of longint;
	Mego: array[1..MaxN] of longint;
	NapGepek:array[1..maxN] of Lanc;
	
function Keres(x:longint; g:longint):boolean;
var
	p:Lanc;
begin
	Keres:=true;
	p:=NapGepek[x];
	while (p<>nil) do begin
		if (p^.gep=g) then begin
			exit;
		end;
		p:=p^.csat;
	end;
	new(p);
	p^.gep:=g;
	p^.csat:=NapGepek[x];
	NapGepek[x]:=p;
	Keres:=false;
end;	
Begin{Eval}
	readln(TinF, N,M);
	for i:=1 to M do
		read(TinF, H[i]);
	
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
   for i:=1 to N do begin  Mego[i]:=0; NapGepek[i]:=nil; end;
   
	for i:=1 to M do begin
{$I-}
   Readln(CoutF, x,y);
{$I+}
		If IOResult<>0 Then Begin
			WriteMSG(2,'HIBA: Output formátum hiba');
			Exit;
		End;
		if (x<1)or(N<x)or(y<1)or(y>TM) then begin
			WriteMSG(2,'HIBA: hibás sorszám');
			Exit;
		end;
		if (x>H[i]) then begin
			WriteMSG(2,'HIBA: határidõ sértés');
			Exit;
		end;
		if (Mego[x]>=TM) then begin
			WriteMSG(2,'HIBA: túl sok egy napra');
			Exit;
		end;
		inc(Mego[x]);
		if (Keres(x,y)) then begin
			WriteMSG(2,'HIBA: több munka egy nap azonos gépen');
			Exit;
		end;						
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
