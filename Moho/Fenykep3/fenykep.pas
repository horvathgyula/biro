Program fenykep;
Uses TestLib;
Var
  t:Integer;

Procedure Eval;
const
  MaxB=20000;
Var
  Kezd,Mego:array[1..maxb] of longint;
  N,K,M,VM:Longint;
  i,x,y,u,ui:longint;

begin
  readln(TinF,N,K);
  read(ToutF,M);
{$I-}
    read(CoutF, VM);
{$I+}
  If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output formátum hiba');
     Exit;
  End;
   if M<>VM then begin
		WriteMSG(1,'HIBA: hibás a menetek száma');
		exit;
  end;
	WriteMSG(1,'HELYES');
	Grade(1,1);
	
  u:=0;
  for i:=1 to M do begin
{$I-}
    read(CoutF, x);
{$I+}
		If IOResult<>0 Then Begin
			WriteMSG(2,'HIBA: Output formátum hiba');
			Exit;
		End;
		if (x<u) then begin
			WriteMSG(2,'HIBA: nem rendezett a kimenet');
			exit;
		end;
		Mego[i]:=x;
		u:=x;
  end{for i};
  for x:=1 to maxB do Kezd[x]:=0;
  for i:=1 to N do begin
      readln(TinF, x,y);
      if Kezd[y]<x then Kezd[y]:=x;
  end;
  u:=0; ui:=1;
  for x:=1 to maxB do
    if Kezd[x]>0 then begin
      if x<Mego[ui] then begin
        writeMSG(2,'HIBA: hibás menet');
        exit;
      end;
      while (ui<=M)and (Mego[ui]+K<=Kezd[x]) do inc(ui);
	  if ui>M then begin
	    writeMSG(2,'HIBA: nincs mindenki lefényképezve ');
	    exit;
	  end;
    end{for x};

WriteMSG(2,'HELYES');
Grade(2,1);
	
End{Eval};

Begin{Prog}
  For t:=1 To TCase Do Begin
    If DoTest Then
      Eval;
  End;
  Done;
End.

