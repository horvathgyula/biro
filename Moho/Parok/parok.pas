Program parok;
Uses TestLib;
Var
  t:Integer;

Procedure Eval;
const
  maxN=100000;
  MaxB=20000;
type
  Par=record e,t:longint end;
Var
  P:array[1..maxN] of Par;
  Volt:array[1..maxN] of boolean;
  N,M,VM:Longint;
  i,x,y:longint;

begin
  readln(TinF,N);
    for i:=1 to N do begin 
      Volt[i]:=false;
      readln(TinF, x,y);
      P[i].e:=x; P[i].t:=y;
	end;
  
  read(ToutF,M);
{$I-}
    readln(CoutF, VM);
{$I+}
  If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output form�tum hiba');
     Exit;
  End;
   if M<>VM then begin
		WriteMSG(1,'HIBA: hib�s a menetek sz�ma');
		exit;
  end;
	WriteMSG(1,'HELYES');
	Grade(1,1);
	
  for i:=1 to M do begin
{$I-}
    readln(CoutF, x,y);
{$I+}
		If IOResult<>0 Then Begin
			WriteMSG(2,'HIBA: Output form�tum hiba');
			Exit;
		End;
		if (x<1)or(x>N)or(y<1)or(y>N)or(x=y) then begin
			WriteMSG(2,'HIBA: hib�s sorsz�m');
			exit;
		end;		
		if (Volt[x])or(volt[y]) then begin
			WriteMSG(2,'HIBA: t�bb p�rban szerepel valaki');
			exit;		
		end;
		if (P[x].t<=P[y].e) or (P[y].t<=P[x].e) then begin
			WriteMSG(2,'HIBA: hib�s p�ros�t�s');
			exit;			
		end;
		Volt[x]:=true; Volt[y]:=true;
  end{for};

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

