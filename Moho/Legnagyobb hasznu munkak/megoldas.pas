Program Utemez;
Const
  MaxN=10000;
  MaxH=10000;
Type
  Index = 1..MaxN;
  Hatarido = Array [Index] Of 1..MaxH;
  Beosztas = Array [Index] Of 0..MaxN;
  Haszon   = Array [Index] Of 1..1000;
Var
  i:Integer;
  N:Word;                       {a munkak szama}
  H:Hatarido;
  P:Haszon;
  B:Beosztas;
  OsszH:Longint;

Procedure Beolvas;
Var
  BeF:Text;
  i,x,y:Word;
Begin{Beolvas}
  Assign(BeF, 'utemez.be'); Reset(BeF);
  ReadLn(BeF, N);
  For i:=1 To N Do
    ReadLn(BeF, H[i], P[i]);
  Close(BeF);

End{Beolvas};

Procedure KiIr;
Var  KiF:Text;

Begin{KiIr}
  Assign(KiF, 'utemez.ki'); Rewrite(KiF);
  WriteLn(KiF, OsszH);
  For i:=1 To N Do
    If B[i]<>0 Then
      Write(KiF, B[i]:1,' ');

  Close(KiF);
End{KiIr};

Procedure Szamit;
{Global: N, H,P, B}
Var
  R:Hatarido;
  i,j:Word;

Procedure GyorsRend(Var R:Hatarido);

  Function Feloszt( Bal,Jobb : Word): Word ;
    Var
      Fe,E : Word;
      i,j : Word;
    Begin
      Fe := P[R[(Bal+Jobb) Div 2]];
      i := Bal-1; j := Jobb+1;
      While True Do Begin
        Repeat
          Inc(i)
        Until (P[R[i]]>=Fe);
        Repeat
          Dec(j)
        Until (Fe>=P[R[j]]);
        If I < J  Then Begin
          E := R[i]; R[i] := R[j]; R[j] := E;
        End Else Begin
          Feloszt:= j;
          Exit
        End;
      End{while};
    End (* Feloszt *);

  Procedure Rendez(Bal,Jobb : Integer);
    Var
      f : Word;
    Begin
      f:= Feloszt(Bal, Jobb);
      If Bal<f Then
        Rendez(Bal, f);
      If f<Jobb Then
        Rendez(f+1, Jobb)
    End (* Rendez *);
  Begin
    Rendez(1, N)
  End; (* GyorsRend *)

Begin{Szamit};
  For i:=1 To N Do R[i]:=i;
  GyorsRend(R);
  OsszH := 0;
  For i := 1 To N Do B[i] := 0;
  For i := N Downto 1 Do Begin
    If H[R[i]] > N Then
      j := N
    Else
      j := H[R[i]];
    While (j > 0) And (B[j] <> 0) Do
      Dec(j);
    If j > 0 Then Begin
      B[j] := R[i];
      OsszH := OsszH + P[R[i]]
    End
  End{For};
End{};

Begin{program}
  Beolvas;
  Szamit;
  KiIr;
End.