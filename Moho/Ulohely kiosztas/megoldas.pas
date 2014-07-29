Program Kioszt;
(*
*)
Const
  MaxN=1000;                        { a megrendelesek max. szama  }
  MaxM=10000;                       { az Ålãhelyek max. sz†ma}
Var
  M:Word;                           { az Ålãhelyek sz†ma}
  N    :Word;                       { a megrendelesek szama }
  A,B  :Array[1..MaxN] of Word;     { az intervallumok kezdo es vegzo idopontjai }
  Mego:Array[1..MaxM] of 0..MaxN;   { a megold†s: az i-edik szÇket a Mego[i]-sz†m£
                                     megrendelã kapja, ha ez<>0}
  S:Array[1..MaxN] of 1..MaxN;      { az intervallumok rendezett sorozata}
  i,ii,x:Integer;
  Hany:Integer;

Procedure Beolvas;
{Global:N, E,T}
  Var
    Bef:Text;
    i:Word;
  Begin
    Assign(Bef,'KIOSZT.BE'); Reset(Bef);
    ReadLn(Bef,M, N);
    For i:=1 To N Do Begin
      ReadLn(Bef,A[i], B[i]);
    End;
    Close(Bef);
  End{Beolvas};

Procedure KiIr;
{Global: M, Mego }
  Var
    Kif:Text;
    x:Word;
  Begin
    Assign(KiF,'KIOSZT.KI'); Rewrite(KiF);
    WriteLn(Kif,Hany);
    For x:=1 To M Do
      If Mego[x]>0 Then Begin
        WriteLn(Kif, Mego[x],' ',x);
      End;

    Close(KiF);
  End{KiIr};

Procedure Rendez;
{Global: S, N, A,B}
  Function Kisebb(i,j:Word):Boolean;
  Begin
    Kisebb:=(B[i]<B[j])Or((B[i]=B[j])And(A[i]<A[j]))
  End;

  Function Feloszt( Bal,Jobb : Word): Word ;
    Var
      Fe,E : Word;
      i,j : Word;
    Begin
      Fe := S[(Bal+Jobb) Div 2];
      i := Bal-1; j := Jobb+1;
      While True Do Begin
        Repeat
          Inc(i)
        Until (Fe=S[i])Or Kisebb(Fe, S[i]);
        Repeat
          Dec(j)
        Until (Fe=S[j])Or Kisebb(S[j], Fe);
        If I < J  Then Begin
           E := S[i]; S[i] := S[j]; S[j] := E;
        End Else Begin
          Feloszt:= j; Exit
        End;
      End;
    End (* Feloszt *);

  Procedure Rendez(Bal,Jobb : Integer);
    Var
      f : Word;
    Begin
      f:= Feloszt(Bal, Jobb);
      If f > Bal Then
        Rendez(Bal, f);
      If f+1 < Jobb Then
        Rendez(f+1, Jobb)
    End (* Rendez *);
  Begin
    Rendez(1, N)
  End; (* Rendez *)


Begin{Program}
  Beolvas;
  For i:=1 To N Do S[i]:=i;
  For i:=1 To M Do Mego[i]:=0;
  Rendez;

  Hany:=0;
  For i:=1 To N Do Begin
    ii:=S[i];
    For x:=A[ii] To B[ii] Do
      If Mego[x]=0 Then Begin
        Mego[x]:=ii;
        Inc(Hany);
        Break;
      End;
  End{for i};

  KiIr;
End.
