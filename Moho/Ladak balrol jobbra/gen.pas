Program GLada;
Const
  MaxN=10000;
Type
  Sor=Array[1..MaxN] Of Integer;
Var
  InF:Text;

  N,x,y,Cs:Longint;
  M,i,j,k:Integer;
  A:Sor;

Begin
  Val(ParamStr(1),N,i);
  N:=5000;
  M:=30000;
  Randomize;
  Assign(InF, 'lada.bea'); Rewrite(InF);
  WriteLn(InF,N);
  x:=Random(M)+1;
  Write(Inf,x:1,' ');
  For i:=1 To N Do Begin
    x:=Random(M)+1;
    A[i]:=x;
    Write(Inf,' ',x:1);
  End;

  WriteLn(Inf);
  Close(InF);
End.