Program Virus;
{Ertekel‹ a VIRUS feladathoz}
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
Const
  MaxN=10000;
  MaxV=10000;
Var
{  Int:Array[1..MaxV] of Rekord K,V:Word End;}
  t:Integer;

Procedure Eval;
Var
  M1,M2, VM1,VM2: Longint;

Begin{Eval}
  ReadLn(ToutF, M1, M2);
  {$I-}
    ReadLn(CoutF, VM1, VM2);
   {$I+}
   If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output formátum hiba');
     Exit;
   End;
   If (M1<>VM1) Or (M2<>VM2) Then Begin
     WriteMSG(1,'HIBA: A megoldás hib s');
     Exit;
   End;

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
