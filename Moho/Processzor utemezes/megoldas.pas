Program Utemez;
Const
  MaxN=10000;  { az esemenyek max. szama  }
Var
  N    :Word;                  { az esemenyekszama }
  V,H  :Array[1..MaxN] of Word;{ az esemenyek kezdo es vegzo idopontjai }
  M:Word;
  B:Array[1..MaxN] of Word;

Procedure Beolv;
{Global:N, K,V}
  Var
    Bef:Text;
    i:Word;
  Begin
    Assign(Bef,'utemez.be'); Reset(Bef);
    ReadLn(Bef,N);
    For i:=1 To N Do Begin
      ReadLn(Bef,V[i], H[i]);
    End;
    Close(Bef);
  End;

Procedure KiIr;
{Global: M,E }
  Var
    Kif:Text;
    i:Word;
  Begin
    Assign(KiF,'utemez.ki'); Rewrite(KiF);
    WriteLn(Kif,M);
    For i:=1 To M-1 Do Write(Kif,B[i],' ');
    WriteLn(Kif,B[M]);
    Close(KiF);
End;

Procedure MohoValaszt;
{Globalis: N, K,V, M,E}
Var  S:Array[1..MaxN] of Word;

Procedure Rendez;
{Global: S, N}
Var
 i:Word;
  Function Megelozi(i,j:Word):Boolean;
  Begin{Megelozi}
    Megelozi:=(V[i]<V[j]) Or (V[i]=V[j])And(H[i]<H[j])
  End{Megelozi};

  Function Feloszt( Bal,Jobb : Word): Word ;
  {Kimenet: S[bal..f-1] < S[f] < S[f+1..jobb]}
    Var
      Fe : Word;
      i,f : Word;
    Begin
      Fe := S[Bal]; {a feloszt¢ pont indexe}
      f:=Bal;
      For i:=Bal+1 To Jobb Do
        If Megelozi(S[i], Fe) Then Begin
           S[f]:=S[i];
           Inc(f);
           S[i]:=S[f]
        End;
      S[f]:=Fe;
      Feloszt:= f;
    End (* Feloszt *);

  Procedure Rendez(Bal,Jobb : Integer);
    Var
      f : Word;
    Begin
      f:= Feloszt(Bal, Jobb);
      If Bal<f-1 Then
        Rendez(Bal, f-1);
      If f+1<Jobb Then
        Rendez(f+1, Jobb)
    End (* Rendez *);
Begin{Rendez}
   For i:=1 To N Do  S[i]:=i;
   Rendez(1, N)
End{Rendez};

Var
  TVIdo,i,ii,j,jj:Longint;
  Vido:Array[0..MaxN] of Longint;
  OK:Boolean;
Begin
  Rendez;
  M:=0; VIdo[0]:=0;
  For i:=1 To N Do Begin
    ii:=S[i];
    j:=M;
    While (j>0) And (VIdo[j]+V[ii]>H[ii]) Do
      dec(j);
    OK:=True;
    For jj:=j+1 To M Do
     If (VIdo[jj]+V[ii]>H[B[jj]]) Then Begin
       OK:=False;
       Break;
     End;
    If Not OK Then Continue;
    For jj:=M DownTo j+1 Do Begin
      B[jj+1]:=B[jj];
      VIdo[jj+1]:=VIdo[jj]+V[ii];
    End;
    B[j+1]:=ii;
    VIdo[j+1]:=VIdo[j]+V[ii];
    Inc(M);
  End{for i};

End{MohoValaszt};

Begin{Program}
  Beolv;
  MohoValaszt;
  KiIr;
End.
