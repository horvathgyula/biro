Program Darabol;
Const
  MaxN=1000;
  MaxM=10000;
Var
  i:Integer;
  H:Longint;
  N,M:Word; {a vagasok szama}

  BeF:Text;
  x,y:Word;
Begin{}
  N:=1000; M:=1000;
  Randomize;
  Assign(BeF, 'darabola.be'); Rewrite(BeF);
  H:=0;
  WriteLn(BeF, N);
  For i:=1 To N Do Begin
    x:=Random(M)+1;
    Write(BeF, x:1,' ');

  End;

  Close(BeF);

End{}.

