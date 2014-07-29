Program Lift;
(*Megoldas:
Legyen Fa[i] azon utasok szama, akiknek felfele menet at kell mennie
az i-edik emeletem, azaz akik i-nel nem magasabbrol indulva i-nel
magasabbra mennek. Hasonloan, legyen La[i] azon utasok szama, akik
lefele menet atmennek az i-edik emeleten, tahat akik i-nel nem
alacsonyabbrol indulnak es lefele menet a celjuk i-nel kissebb.
Ezekkel a jelolesekkel a megoldas:
Max{ Max{Fa[i]%K},Max{La[i]%K} }; i=1..N,
 ahol % az egeszosztas felso egesz reszet jelenti.
*)
Const
  MaxN=1000;
Var
  N,K:Word;
  CF,CL,F,L:Array[0..MaxN] of Longint;
  {F[i] az i-edik emeltrol felfele meno utasok szama,
   L[i] az i-edik emeltrol lefele meno utasok szama,
   CF[i] azon utasok szama, akik felfele az i-edik emeletre mennek,
   CL[i] azon utasok szama, akik lefele az i-edik emeletre mennek,
  }
  Menet:Word;
  i,At,Ki,Fel,Le:Longint;
  KiF:Text;

Procedure Beolvas;
Var
  BeF:Text;
  i,e:Word;
Begin
  Assign(BeF,'lift.be'); Reset(BeF);
  ReadLn(BeF,N,K);
  For i:=1 To N Do Begin
    F[i]:=0; L[i]:=0;
    CF[i]:=0; CL[i]:=0;
  End;
  For i:=1 To N Do Begin
    Read(Bef,e);
    While e>0 Do Begin
      If e>i Then Begin
        Inc(CF[e]);
        Inc(F[i]);
      End Else Begin
        Inc(CL[e]);
        Inc(L[i]);
      End;
      Read(BeF,e);
    End{while};
    ReadLn(BeF);
  End{for i};

End{Beolvas};
Begin{Program}
  Beolvas;
  At:=0; {az egy emeleten atmenok maxi szama }
  {Felfele menet}
  Ki:=0; {azok szama, akik felfele menet kiszallnak az i-edik emelig }
  Fel:=0;{azok szama, akik i-nel nem magasabbrol felfele mennek}
  {Fa[i]=Fel-Ki}
  For i:=1 To N Do Begin
    Ki:=Ki+CF[i];  {az i-edikig kiszallok szama }
    Fel:=Fel+F[i]; {az osszes felfele meno szama }
    If (Fel-Ki)>At Then
      At:=Fel-Ki
  End{for i};
  {Lefele menet}
  Ki:=0;{azok szama, akik lefele menet kiszallnak az i-edik emeletig }
  Le:=0;{azok szama, akik i-nel nem magasabbrol felfele mennek}
  {La[i]=Le-Ki}
  For i:=N DownTo 1 Do Begin
    Ki:=Ki+CL[i]; {az i-edikig kiszallok szama }
    Le:=Le+L[i];  {az osszes lefele meno szama }
    If (Le-Ki)>At Then
      At:=(Le-Ki);
  End{for i};

  Menet:=(At+K-1) Div K;
  Assign(KiF,'lift.ki');Rewrite(KiF);
  WriteLn(KiF,Menet);
  Close(KiF);
End.