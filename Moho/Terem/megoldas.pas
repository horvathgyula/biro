Program Terem;
Const
  MaxN=1000;                   {az esemenyek max. szama}
  MaxAB=1440;
Var
  KiF:Text;                    {output allomany}
  N:Word;                      {az esemenyek szama}
  T:Word;                      {a szukszeges termek szama}
  A,B:Array[1..MaxN] of Word;  {az esemeny adatai}
  Be:Array[1..MaxN] of Word;   {a beosztas: az i. esemeny a Be[i] terembe}
  E:Array[1..MaxN] of Word;    {rendezett esemenysor}
  VanMeg,i,j:Word;
  Foglalt:Word;

Procedure Beolvas;
Var
  BeF:Text;
  i:Word;
Begin{Beolvas}
  Assign(BeF,'terem.be'); Reset(BeF);
  ReadLn(BeF,N);

  For i:=1 To N Do Begin
    ReadLn(BeF,A[i],B[i]);
    E[i]:=i;
  End{for i};
  Close(BeF);
End{Beolvas};

Procedure Rendez;
{az esemenyek rendezese befejezesi ido szerint novekvore}
Var
  i,j,ii:Word;
Begin{Rendez}
  For i:=2 To N Do Begin
    ii:=E[i];
    j:=i-1;
    While (j>0)And(B[E[j]]>B[ii]) Do Begin
      E[j+1]:=E[j];
      Dec(j);
    End{while};
    E[j+1]:=ii;
  End{for i};
End{Rendez};

Begin{program}
  Beolvas;
  Rendez;
  T:=0;
  VanMeg:=N;
  While VanMeg>0 Do Begin
    Inc(T);
    Foglalt:=0;
    For i:=1 To N Do
      If (E[i]>0)And(Foglalt<A[E[i]]) Then Begin
        Foglalt:=B[E[i]];
        Be[E[i]]:=T;
        E[i]:=0;
        Dec(VanMeg);
      End{for i };
  End{Vanmeg};

  Assign(KiF,'terem.ki'); Rewrite(KiF);
  WriteLn(KiF, T);
  For i:=1 To T Do Begin
    For j:=1 To N Do
      If Be[j]=i Then
        Write(KiF,j,' ');
    WriteLn(KiF);
  End{for i};

  Close(KiF);
End.
