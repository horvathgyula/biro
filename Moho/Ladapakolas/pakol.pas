Program Pakol;
Uses TestLib;
Var
  t:Integer;

Procedure Eval;
const
  MaxN=1000;

procedure Sor1;
  var M,VM:longint;
begin
  readln(ToutF,M);
{$I-}
   Readln(CoutF, VM);
{$I+}
   If IOResult<>0 Then Begin
       WriteMSG(1,'HIBA: Output formátum hiba');
       Exit;
   End;
   if M<>VM then begin
        WriteMSG(1,'HIBA: hibás megoldás');
        Exit;
   end;
  Grade(1,1);
  WriteMSG(1,'HELYES')
end{Sor1};

Begin{Eval}
  Sor1;
End{Eval};

Begin{Prog}
  For t:=1 To TCase Do Begin
    If DoTest Then
      Eval;
  End;
  Done;
End.
