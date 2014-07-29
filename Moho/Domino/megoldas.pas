Program Domino;
(**)
Var
  M:Word;
  BeF,KiF:Text;

Procedure Megold;
Type
  Matrix=Array[0..9,0..9] of Word;
Var
  U,V,X,Y:Byte;
  N,i:LongInt;
  T,Tu:Matrix;
Begin{Megold}
  For x:=0 To 9 Do
    For y:=0 To 9 Do T[x,y]:=0;
   ReadLn(BeF,N);
   ReadLn(BeF,X,Y);
   T[X,Y]:=1; T[Y,X]:=1;
   Tu:=T;
   For i := 2 to N do Begin
     ReadLn(BeF,X,Y);

     For U:=0 To 9 Do Begin
       If (T[U,Y]>0) And (Tu[U,X]<T[U,Y]+1) Then
         Tu[U,X]:=T[U,Y]+1;
       If (T[U,X]>0) And (Tu[U,Y]<T[U,X]+1) Then
         Tu[U,Y]:=T[U,X]+1;
     End;
     For V:=0 To 9 Do Begin
       If (Tu[Y,V]>0) And (Tu[X,V]<T[Y,V]+1) Then
         Tu[X,V]:=T[Y,V]+1;
       If (T[X,V]>0) And (Tu[Y,V]<T[X,V]+1) Then
         Tu[Y,V]:=T[X,V]+1;
     End;

     T:=Tu;
   End{for i};
   M:=0;
   For X:=0 To 9 Do
     For Y:=X To 9 Do
       If M<T[x,y] Then M:=T[x,y];
End; { Megold }


Begin
  Assign(BeF,'domino.be');Reset(BeF);

  Megold;

  Assign(KiF,'domino.ki');Rewrite(KiF);
  WriteLn(KiF,M);
  Close(BeF); Close(KiF);
End.

