Program Utemez;
{Ertekel� a Utemez feladathoz}
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
Const
  MaxN=10000;
  MaxVH=10000;
Var
  t:Integer;
Procedure Eval;
Var
  N,i: Longint;
  U,V,H:Array[1..MaxN] of Integer;
  M,VM,x,y,Ido:Longint;
Begin{Eval}
  ReadLn(TinF, N);
  For i:=1 To N Do Begin
    Read(TinF, V[i], H[i]);
  End;
  ReadLn(ToutF, M);

   {$I-}
    ReadLn(CoutF, VM);
   {$I+}
   If IOResult<>0 Then Begin
     WriteMSG(1,'HIBA: Output form�tum hiba');
     Exit;
   End;
   If (VM<>M) Then Begin
     WriteMSG(1,'HIBA: Az optim�lis megold�s �rt�ke hib�s');
     Exit;
   End;
  Grade(1,1);
  WriteMSG(1,'HELYES');
  VM:=0;
  For i:=1 To M Do Begin
   {$I-}
    Read(CoutF, x);
   {$I+}
   If IOResult<>0 Then Begin
     WriteMSG(2,'HIBA: Output form�tum hiba');
     Exit;
   End;
   If (x<1)Or(x>N) Then Begin
       WriteMSG(2,'HIBA: Hib�s program sorsz�m');
       Exit;
    End;
    Inc(VM);
    U[VM]:=x;
  End{for};
  Ido:=0;
  For i:=1 To M Do Begin
    Ido:=Ido+V[U[i]];
    If H[U[i]]<Ido Then Begin
       WriteMSG(2,'HIBA: Hat�rid�t s�rt� �temez�s');
       Exit;
     End;
  End{};

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
