Program Strazsa;
Const
  MaxN=10000;
Var
  N:Word;
  Int:Array[0..MaxN] Of 0..MaxN; { az intervallumok tombje }
  Megold:Word;

Procedure BeOlvas;
  Var i,x,y:Word;
    BeF:Text;
  Begin
    Assign(BeF,'strazsa.be'); Reset(BeF);
    ReadLn(BeF,N);
    For i:=0 To N Do Int[i]:=0;
    ReadLn(BeF,x,y);
    While x<>0 Do Begin
      If Int[x]<y Then Int[x]:=y;
      ReadLn(BeF,x,y);
    End;
    Close(BeF);
  End {Beolvas};

Procedure KiIr;
  Var
    KiF:Text;
  Begin
    Assign(KiF,'strazsa.ki'); Rewrite(KiF);
    WriteLn(KiF,Megold);
    Close(KiF);
  End{KiIr};

Function Szamit:Word;
  Var Veg,Veg1,i,Szaml:Word;
    Lehet:Boolean;
  Begin
    Szaml:=1;
    Lehet:=Int[1]>0;
    Veg:=Int[1]; i:=2;
    While (i<=N) And Lehet And (Veg<N) Do Begin
      Inc(Szaml);
      Veg1:=0;
      While i<=Veg Do Begin
        If (Int[i]<>0) And (Int[i]>Veg1) Then
          Veg1:=Int[i];
        Inc(i);
      End;
      Lehet:=Veg1>Veg;
      If Lehet Then Veg:=Veg1;
    End{While};

    If Lehet And (Veg=N) Then
      Szamit:=Szaml
    Else
      Szamit:=0;
  End{Szamit};

Begin {Program}
  BeOlvas;
  Megold:=Szamit;
  KiIr;
End.