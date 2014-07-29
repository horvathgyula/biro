Program Lada;
Const
  MaxN=10000;               {a ladak max. szama}
Var
  N :Word;                  {a ladak szama}
  M :Longint;               {az osszepakilt ladak szama}
  A :Array[1..MaxN] of Word;{a ladasor}

Procedure Beolvas;
Var BeF:Text;
  i:Integer;X:Word;
  Begin
    Assign(BeF,'lada.be');Reset(BeF);
    ReadLn(BeF,N);
    For i:=1 To N Do Begin
      Read(Bef, A[i]);
    End;
    Close(BeF);
  End{Beolvas};

Procedure Szamit;
Var i,j,k:Word;
  Csat,
  Fej,Veg  :Array[1..MaxN] Of 0..MaxN;
  {az osszepakolt ladasor feje es vege}
Function Keres(i:Word):Word;
{Binaris keresessel keressuk a legkisebb olyan nyitott ladat,
amibe A[i] belefer, ha nincs ilyen, akkor az eredmeny M+1}
  Var bal,jobb,k,kk,X:Word;
  Begin{Keres}
    X:=A[i]; Veg[M+1]:=i;
    {Veg[1]<=Veg[2]<=...<=Veg[M]}
    Bal:=1; Jobb:=M+1;
    While bal<jobb Do Begin
      k:=(bal+jobb) Div 2;
      kk:=Veg[k];
      If X>=A[kk] Then
        bal:=k+1
      Else
        jobb:=k;
    End;
    Keres:=jobb;
  End{Keres};

Procedure KiIr;
Var KiF:Text;
  i,j:Word;
Begin
  Assign(KiF,'lada.ki');Rewrite(KiF);
  WriteLn(KiF,M);
  For i:=1 To M Do Begin
    j:=Fej[i];
    Repeat
      Write(KiF,A[j]:1,' ');
      j:=Csat[j];
    Until j=0;
    WriteLn(KiF);
  End;
  Close(KiF);
End{KiIr};

Begin{Szamit}
  For i:=1 To N Do Csat[i]:=0;
  M:=1;
  Fej[1]:=1; Veg[1]:=1;
  For i:=2 To N Do Begin
    j:=Keres(i);
    If j>M Then Begin
      Inc(M);
      Fej[M]:=i; Veg[M]:=i;
    End Else Begin
      k:=Veg[j];
      Csat[k]:=i; Veg[j]:=i
    End;
  End;
  KiIr;
End{Szamit};

Begin{program}
  Beolvas;
  Szamit;
End.
