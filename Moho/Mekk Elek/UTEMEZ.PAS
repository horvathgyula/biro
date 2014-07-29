Program Utemez;
{Ertekel‹ a UTEMEZ feladathoz}
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
Const
  MaxN=10000;
Type
  Beoszt=Array[1..MaxN] of Integer;
Var
  Szabad:Array[1..365] of Boolean;
  N:Integer;
  M,VM:Integer;
  H,B:Beoszt;
  i,x,y:Integer;
Begin{Eval}
  ReadLn(TinF, N);
  For i:=1 To N Do ReadLn(TInF,H[i]);
  ReadLn(ToutF, M);

  {$I-}
    ReadLn(CoutF, VM);
  {$I+}
  If IOResult<>0 Then Begin
    WriteMSG(1,'HIBA: Output formátum hiba');
    Exit;
  End;

  If VM<>M Then Begin
    WriteMSG(1,'HIBA: A beosztható munkák max. száma '+InttoStr(M)+' és nem '+InttoStr(VM));
    Exit;
  End;
  Grade(1,1);
  WriteMSG(1,'HELYES');

  For i:=1 To N Do B[i]:=0;
  For i:=1 To 365 Do Szabad[i]:=True;

  For i:=1 To VM Do Begin
    {$I-}
      ReadLn(CoutF, x,y);
    {$I+}
    If IOResult<>0 Then Begin
      WriteMSG(2,'HIBA: Output formátum hiba');
      Exit;
    End;
    If (x<1)Or(N<x) Then Begin
      WriteMSG(2,'HIBA: '+IntToStr(x)+' nem valódi munkasorszám');
      Exit;
    End;
    If (y<1)Or(365<y) Then Begin
      WriteMSG(2,'HIBA: '+IntToStr(y)+' nem valódi napsorszám');
      Exit;
    End;
    If B[x]<>0 Then Begin
      WriteMSG(2,'HIBA: A '+InttoStr(x)+' munka többszörösen beosztott');
      Exit;
    End;
    If Not Szabad[y] Then Begin
      WriteMSG(2,'HIBA: A '+InttoStr(y)+' napra már van beosztott munka');
      Exit;
    End;
    Szabad[y]:=False;
    B[x]:=y
  End{for i};

  If Not SeekEoF(CoutF) Then Begin
    WriteMSG(2,'HIBA: Az output állomány a kelleténél több sort tartalmaz');
    Exit;
  End;

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
