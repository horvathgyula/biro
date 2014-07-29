Program Lift;
Const
  MaxN=100;
Var
  N,K:Word;
  E:Array[1..MaxN,1..2*MaxN+1] of 0..MaxN;
  CF,CL,F,L:Array[0..MaxN+1] of Longint;
  Menet:Word;
  i,j,At:Word;
  KiF:Text;

Procedure Beolvas;
Var
  BeF:Text;
  i,j,a:Word;
Begin
  Assign(BeF,'lift.be'); Reset(BeF);
  ReadLn(BeF,N,K);
  For i:=1 To N Do Begin CF[i]:=0; CL[i]:=0 End;
  For i:=1 To N Do Begin
    j:=1;
    Read(Bef,a);
    While a>0 Do Begin
      E[i,j]:=a;
      If a>i Then
        Inc(CF[a])
      Else
        Inc(CL[a]);
      Read(BeF,a);
      Inc(j);
    End;
    E[i,j]:=0;
    ReadLn(BeF);
  End{for i};

End{Beolvas};
Begin{Program}
  Beolvas;
  Menet:=0;
  F[0]:=0;
  For i:=1 To N Do Begin
    F[i]:=F[i-1]-CF[i];
    j:=1;
    While E[i,j]>0 Do Begin
      If E[i,j]>i Then
        Inc(F[i]);
      Inc(j);
    End{while};
    At:=(F[i]+K-1) div K;
    If At>Menet Then
      Menet:=At;
  End{for i};

  L[N+1]:=0;
  For i:=N DownTo 1 Do Begin
    L[i]:=L[i+1]-CL[i];
    j:=1;
    While E[i,j]>0 Do Begin
      If E[i,j]<i Then
        Inc(L[i]);
      Inc(j);
    End{while};
    At:=(L[i]+K-1) div K;
    If At>Menet Then
      Menet:=At;
  End{for i};

  Assign(KiF,'lift.ki');Rewrite(KiF);
  WriteLn(KiF,Menet);
  Close(KiF);
End.