Program Domino;
(*Megoldas: Jeloljuk T(u,v,i)-vel annak a leghosszabb illeszkedo dominosornak
  a hosszat, amely kirakhato az elso i dominobol es egyik vegen u, a masikon
  v potty van. Nyilvanvalo, hogy a T(u,v,i+1) ertekek kiszamithatok az
  i+1-edik domino [x:y] es T(u,v,i) ertekekbol, hisz minden u-ra (0<=u<=9)
  T(u,y,i+1)=Max{T(u,y,i), T(u,x,i)+1}, T(u,x,i+1)=Max{T(u,x,i), T(u,y,i)+1}.
*)
Var
  M:Longint; {a megoldas}
  BeF,KiF:Text;
Const
  MaxN=100000;
  MInf=-MaxN-1;  {- vegtelen}
Procedure Megold;
Type
  Matrix=Array[0..9,0..9] of Longint;
Var
  U,V,X,Y:Byte;
  N,i,Uj:Longint;
  T,Tu:Matrix;
Begin{Megold}
  For x:=0 To 9 Do              {inicializalas}
    For y:=0 To 9 Do T[x,y]:=MInf;
   ReadLn(BeF,N);
   ReadLn(BeF,X,Y);
   T[X,Y]:=1; T[Y,X]:=1;        {kirakjuk az elso dominot}
   Tu:=T;
   For i := 2 to N do Begin
   {T[U,V] az elso i-1 domino kirakasaval keletkezo leghosszabb olyan
    illeszkedo sorozat hossza, aminek egyik vegen U, a masikon V potty van. }
     ReadLn(BeF,X,Y);
     For U:=0 To 9 Do Begin
       Uj:=T[U,Y]+1;
       If (Tu[U,X]<Uj) Then
         Tu[U,X]:=Uj;
       Uj:=T[U,X]+1;
       If (Tu[U,Y]<Uj) Then
         Tu[U,Y]:=Uj;
     End;
     For V:=0 To 9 Do Begin
       Uj:=T[Y,V]+1;
       If (Tu[X,V]<Uj) Then
         Tu[X,V]:=Uj;
       Uj:=T[X,V]+1;
       If (Tu[Y,V]<Uj) Then
         Tu[Y,V]:=Uj;
     End;

     T:=Tu;
   End{for i};
   M:=0;
   For X:=0 To 9 Do
     For Y:=X To 9 Do
       If M<T[x,y] Then M:=T[x,y];
End; { Megold }
Var Puf:Array[1..20000] of Char;
Begin{Program}
  Assign(BeF,'domino.be');Reset(BeF);
  SetTextBuf(BeF,Puf);
  Megold;

  Assign(KiF,'domino.ki');Rewrite(KiF);
  WriteLn(KiF,M);
  Close(BeF); Close(KiF);
End.
