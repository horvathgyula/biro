Program Utemez;
{Ertekel� a UTEMEZ feladathoz}
Uses TestLib;
{Import�lt elemek:
TCase:Integer;           a tesztesetek sz�ma
Function DoTest:Boolean; a teszteset �rt�kelhet�, van output f�jl
Procedure Done;          az �rt�kel�s v�g�nek jelz�se
Procedure Grade(rf, v:Integer); az rf r�szfeladat �rt�kl�se, v=0/1
                                ha nem h�vjuk, 0 �rt�ket kap a teszeset
Procedure WriteMSG(rf:Integer; M:String); az rf r�szfeladat �rt�kel�s�nekmagyar�zata
            ha nem h�vjuk, �resen marad
TInF:Text;  teszt input, megnyitva
ToutF:Text; teszt output, megnyitva
CoutF:Text; a versenyz� output �llom�nya, megnyitva
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
    WriteMSG(1,'HIBA: Output form�tum hiba');
    Exit;
  End;

  If VM<>M Then Begin
    WriteMSG(1,'HIBA: A beoszthat� munk�k max. sz�ma '+InttoStr(M)+' �s nem '+InttoStr(VM));
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
      WriteMSG(2,'HIBA: Output form�tum hiba');
      Exit;
    End;
    If (x<1)Or(N<x) Then Begin
      WriteMSG(2,'HIBA: '+IntToStr(x)+' nem val�di munkasorsz�m');
      Exit;
    End;
    If (y<1)Or(365<y) Then Begin
      WriteMSG(2,'HIBA: '+IntToStr(y)+' nem val�di napsorsz�m');
      Exit;
    End;
    If B[x]<>0 Then Begin
      WriteMSG(2,'HIBA: A '+InttoStr(x)+' munka t�bbsz�r�sen beosztott');
      Exit;
    End;
    If Not Szabad[y] Then Begin
      WriteMSG(2,'HIBA: A '+InttoStr(y)+' napra m�r van beosztott munka');
      Exit;
    End;
    Szabad[y]:=False;
    B[x]:=y
  End{for i};

  If Not SeekEoF(CoutF) Then Begin
    WriteMSG(2,'HIBA: Az output �llom�ny a kellet�n�l t�bb sort tartalmaz');
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
