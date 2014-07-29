Program Utemez;
Const
  MaxN=10000;
  MaxNap=365;
Var
  BeF,KiF:Text;
  Beoszt:Array[1..MaxNap] Of 0..MaxN;
  N,M,nap,h,i:word;
Begin
  Assign(BeF, 'utemez.be'); Reset(BeF);
  ReadLn(BeF, N);
  For i:=1 To MaxNap Do
    Beoszt[i]:=0;
  M:=0; {a beosztott munkak szama}
  For i:=1 To N Do Begin
    ReadLn(BeF,h); {i. munka hatarideje h}
    nap:=h;
    While (nap>0) And (Beoszt[nap]>0) Do
      Dec(nap);
    If nap <>0 Then Begin
      Beoszt[nap]:=i;
      Inc(M);
    End;
  End;
  Close(BeF);
  {KiIratas}
  Assign(KiF, 'utemez.ki'); Rewrite(KiF);
  WriteLn(KiF, M);
  For i:=1 To MaxNap Do
    If Beoszt[i]<>0 Then
      WriteLn(KiF, Beoszt[i]:1,' ',i:1);
  Close(KiF);
End.
