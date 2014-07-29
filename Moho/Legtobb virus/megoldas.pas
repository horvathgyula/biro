Program Virus;
Const
  MaxN=300000;
  MaxM=7000;
Var
  N,H: Longint;
  K,P: Array[0..MaxM+1] of Longint;
  MaxV,T:Longint;

Procedure Beolvas;
Var
  BeF:Text;
  i,a,b:Longint;
Begin
  Assign(BeF,'virus.be'); Reset(BeF);
  ReadLn(BeF,N, H);
  For i:=1 To N Do Begin
    ReadLn(BeF,a, b);
    Inc(K[a]);
    Inc(P[b]);
  End;
  Close(BeF);
End{Beolvas};

Procedure Szamit;
Var
  x,i,V:Longint;
Begin
  P[0]:=0; K[MaxM+1]:=0;
  For i:=1 To MaxM Do P[i]:=P[i-1]+P[i];
  For i:=MaxM DownTo 1 Do K[i]:=K[i+1]+K[i];
  T:=0; MaxV:=0;
  For i:=1 To MaxM-H Do Begin
    V:=N-P[i]-K[i+H];
    If V>MaxV Then Begin
      MaxV:=V;
      T:=i;
    End;
  End;
End{Szamit};

Procedure KiIr;
Var
  KiF:Text;
Begin
  Assign(KiF,'virus.ki'); Rewrite(KiF);
  Writeln(KiF,MaxV,' ',T);
  Close(KiF);
End;

Begin
  Beolvas;
  Szamit;
  KiIr;
End.
