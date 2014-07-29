Program Zenekar;
Const
  MaxN=1000;               { max megrendel‚st }
  MaxNap=365;
Type
  Megrend=Array[0..MaxN] Of record e,u,az:word; end;           { }
Var
  N: Longint;            {N=megrendsz m  }
  Meg:Megrend;           {a megrendel‚sek }
  Beoszt:Array[0..MaxNap] Of Word;
  M:Longint;

Procedure Beolvas;
{ Global : N, Meg }
Var InFile: Text;
  i:Longint;
Begin
  Assign(InFile,'zenekar.be'); Reset(InFile);
  ReadLn(InFile,N);
  For i:=1 To N Do Begin
      ReadLn(InFile,Meg[i].e,Meg[i].u);
      Meg[i].az:=i;
   End{for i};
  Close(InFile);
End{Beolvas};

Procedure SzamlaloRendU(Var T : Megrend);
  Var
    i,j : Longint;
    S: Array[0..MaxNap] Of integer;
    T1 : Megrend;
  Begin
    For i := 0 To MaxNap Do S[i]:= 0;
    For i := 1 To N Do Inc(S[T[i].u]);
    For i := 1 To MaxNap Do S[i]:= S[i-1]+S[i];
      (* S[i]=|{j| T[j] <= i}| *)
    For i := N DownTo 1 Do Begin
        j := T[i].u;
        T1[ S[j] ]:= T[i];
        Dec(S[j]);
    End;
    For i := 1 To N Do
      T[i]:=T1[i];
  End (* SzamlaloRendU *);
Procedure SzamlaloRendE(Var T : Megrend);
  Var
    i,j : Longint;
    S: Array[0..MaxNap] Of integer;
    T1 : Megrend;
  Begin
    For i := 0 To MaxNap Do S[i]:= 0;
    For i := 1 To N Do Inc(S[T[i].e]);
    For i := 1 To MaxNap Do S[i]:= S[i-1]+S[i];
      (* S[i]=|{j| T[j] <= i}| *)
    For i := N DownTo 1 Do Begin
        j := T[i].e;
        T1[ S[j] ]:= T[i];
        Dec(S[j]);
    End;
    For i := 1 To N Do
      T[i]:=T1[i];
  End (* SzamlaloRendE *);

Procedure Szamit;
Var
  x,i:Longint;
  szabad:Integer;
Begin{Szamit}
  SzamlaloRendU(Meg);
  SzamlaloRendE(Meg);
  szabad:=1;
  For i:=1 to N do
    if (szabad<=Meg[i].u) then begin
      if (szabad<Meg[i].e) then
        szabad:=Meg[i].e;
      Beoszt[szabad]:=Meg[i].az;
      inc(szabad);
  End{for x};

End{Szamit};

Procedure KiIr;
Var
  KiF:Text;
  i:Longint;
Begin
  Assign(KiF, 'zenekar.ki');Rewrite(KiF);
  m:=0;
  for i:=1 to MaxNap do if Beoszt[i]<>0 then inc(m);
  WriteLn(KiF,m);
  for i:=1 To MaxNap do
    if Beoszt[i]<>0 then
    WriteLn(KiF,Beoszt[i],' ',i);

  Close(KiF);
End{KiIr};

Begin { Program }
  Beolvas;
  Szamit;
  KiIr;
End.

