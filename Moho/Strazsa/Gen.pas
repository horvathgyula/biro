Program Generstrazsa;
{ A tesztadat generalas az ELFOGO problemahoz }
Const
  MaxN=10000;                                 { pontok maxim lis sz ma }
  MaxM=1000;
Var
  N,M,i,k,j ,x,y : Word;                     { a pontok sz ma}
  SN,Sm:String;
  BeF:Text;                   { a kimeneti  llom ny }

Begin{Program}
  Assign(BeF,'STRAZSA.BE'); Rewrite(BeF);
randomize;
  SN:=ParamStr(1);
  Val(SN,N,i);
  SM:=ParamStr(2);
  Val(SM,M,i);
  WriteLn(BeF,N);

  For i:=1 To M Do Begin
    X:=Random(N)+1;
    Y:=Random(N-X)+1+X;
    WriteLn(BeF,X,' ',Y:1);
  End;
  WriteLn(BeF,0:1,' ',0:1);
  Close(BEF);
End.

