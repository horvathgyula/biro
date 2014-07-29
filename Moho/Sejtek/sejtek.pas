Program sejtek;
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
Var
  A,B,VA,VB:Longint;
Begin{Eval}
 read(ToutF,A,B);
 {$I-}
    readln(CoutF,VA,VB);
{$I+}
  If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output formátum hiba');
     Exit;
  End;
  if (A<>VA)or(B<>VB) then begin
    WriteMSG(1,'HIBA: hibás a megoldás');
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
