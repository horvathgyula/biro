Program Utemez;
Const
  MaxN=10000;
  MaxNap=365;
Var
  BeF,KiF:Text;
  Munka:Array[1..MaxNap] Of Record K:0..MaxNap; MSorsz:Integer End;
  {<Munka[B].K, B> egy megrendeles, sorszama Munka[B].MSorsz}
  N,M,K,B,i:word;
  Foglalt:Word;
Begin
  Assign(BeF, 'utemez.be'); Reset(BeF);
  ReadLn(BeF, N);
  For i:=1 To MaxNap Do
    Munka[i].MSorsz:=0;
  {Beolvasas}
  For i:=1 To N Do Begin
    ReadLn(BeF,K,B);
    If (Munka[B].MSorsz=0) Or (K>Munka[B].K) Then Begin
      Munka[B].K:=K;
      Munka[B].MSorsz:=i
    End;
  End;
  Close(BeF);

  M:=0;      {a beosztott munkak szama}
  Foglalt:=0;{eddig mar foglalt a mester}

  For B:=1 To MaxNap Do
    If (Munka[B].MSorsz<>0) And (Foglalt<Munka[B].K) Then Begin
      Foglalt:=B;
      Inc(M);
      Munka[B].MSorsz:=-Munka[B].MSorsz
    End;


  {KiIratas}
  Assign(KiF, 'utemez.ki'); Rewrite(KiF);
  WriteLn(KiF, M);
  For i:=1 To MaxNap Do
    If Munka[i].MSorsz<0 Then
      Write(KiF, Abs(Munka[i].MSorsz):1,' ');
  WriteLn(KiF);
  Close(KiF);
End.
