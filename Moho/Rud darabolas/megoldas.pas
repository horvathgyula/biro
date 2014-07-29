Program Darabol;
Const
  MaxN=1000;
  MaxM=10000;
Var
  i:Integer;
  H:Longint;
  N:Word; {a vagasok szama}
  D:Array[1..2*MaxN] Of Longint;{}
  Fa:Array[1..2*MaxN] of Record bal,jobb:Word End;
  Kolts:Longint;

Procedure Beolvas;
Var
  BeF:Text;
  i,x,y:Word;
Begin{Beolvas}
  Assign(BeF, 'darabol.be'); Reset(BeF);
  H:=0;
  ReadLn(BeF, N);
  For i:=1 To N Do Begin
    Read(BeF, x);
    D[i]:=x;
    H:=H+x;
  End;
  Close(BeF);

End{Beolvas};

Procedure KiIr;
Var  KiF:Text;

Procedure Bejar(p:Word);
Var k:Word;
Begin
If Fa[p].bal=0 Then Exit;
  WriteLn(KiF, D[p]:1,' ',D[Fa[p].bal]:1);
  If Fa[p].bal<>0 Then Bejar(Fa[p].bal);
  If Fa[p].jobb<>0 Then Bejar(Fa[p].jobb);
End{Bejar};

Begin{KiIr}
  Assign(KiF, 'darabol.ki'); Rewrite(KiF);
  WriteLn(KiF,Kolts);
  Bejar(2*N-1);

  Close(KiF);
End{KiIr};

Procedure Szamit;
{Global: N, D, S}
Var
  K,S:Array[1..2*MaxN] of Longint;
  Sn, i,x,y,z:Integer;

Procedure SorBa(i:Word);
Var apa,fiu:Word;
Begin
  Inc(Sn); S[Sn]:=i;
  fiu:=Sn; apa:=fiu div 2;
  While (apa>0)And(D[S[apa]]>D[i]) Do Begin
    S[fiu]:=S[apa];
    fiu:=apa; apa:=fiu div 2
  End;
  S[fiu]:=i;
End{SorBa};
Function SorBol:Word;
Var apa,fiu,x:Word;
Begin
  SorBol:=S[1];
  apa:=1; fiu:=2;
  x:=S[Sn];
  Dec(Sn);
  While (fiu<=Sn) Do Begin
    If (fiu<Sn)And(D[S[fiu+1]]<D[S[fiu]]) Then Inc(fiu);
    If D[x]<=D[S[fiu]] Then Break;
    S[apa]:=S[fiu];
    apa:=fiu;
    fiu:=2*apa;
  End;
  S[apa]:=x;
End{SorBol};

Begin{Szamit}
{
  For i:=N Downto N div 2 Do Begin
    S[i]:=i;
    Fa[i].bal:=0;Fa[i].jobb:=0;
  End;
}
  Sn:=1; S[1]:=1; Fa[1].bal:=0; Fa[1].jobb:=0;
  K[1]:=0;
  For i:=2 To N Do Begin{inicializalas}
    K[i]:=0;
    SorBa(i);
    Fa[i].bal:=0;Fa[i].jobb:=0;
  End{for i};
  For i:=1 To N-1 Do Begin{}
    x:=SorBol;
    y:=SorBol;
    z:=i+N;
    D[z]:=D[x]+D[y];
    K[z]:=K[x]+K[y]+D[z];
    SorBa(z);
    Fa[z].bal:=x;
    Fa[z].jobb:=y;
  End{for i};
  Kolts:=K[2*N-1];
End{Szamit};

Begin{program}
  Beolvas;
  Szamit;
  KiIr;
End.