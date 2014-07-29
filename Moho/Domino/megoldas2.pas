Program Domino;
(*Megoldas: Jeloljuk T(u,v,i)-vel annak a leghosszabb illeszkedo dominosornak
  a hosszat, amely kirakhato az elso i dominobol es egyik vegen u, a masikon
  v potty van. Nyilvanvalo, hogy a T(u,v,i+1) ertekek kiszamithatok az
  i+1-edik domino [x:y] es T(u,v,i) ertekekbol, hisz minden u-ra (0<=u<=9)
  T(u,y,i+1)=Max{T(u,y,i), T(u,x,i)+1}, T(u,x,i+1)=Max{T(u,x,i), T(u,y,i)+1}.
*)
Var
  M:Longint;   {a megoldas}
  BeF,KiF:Text;{B/K allomanyok}
Const
  MaxN=100000; {max. dominoszam }
  MInf=-MaxN-1;{- vegtelen}
Procedure Megold;
Type
  Matrix=Array[0..9,0..9] of Longint;
Var
  X,Y:Byte;   {az aktualis domino [X:Y] }
  U:Integer;
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
     ReadLn(BeF,X,Y);       { szimmetria miatt csak U<=V-re szamitjuk T[U,V]-t}
     If X>Y Then Begin      { X es Y felcserelese }
       U:=X; X:=Y;Y:=U;
     End;                   { az [X:Y] domino illesztese }
     For U:=0 To X Do Begin { X<=Y }
       Uj:=T[U,X]+1;        { [U:X][X:Y] -> [U:Y] }
       If (Tu[U,Y]<Uj) Then Tu[U,Y]:=Uj;
       Uj:=T[U,Y]+1;        { [U:Y][Y:X] -> [U:X] }
       If (Tu[U,X]<Uj) Then Tu[U,X]:=Uj;
     End;
     For U:=X To Y Do Begin
       Uj:=T[U,Y]+1;        { [U:Y][Y:X] -> [X:U] }
       If (Tu[X,U]<Uj) Then Tu[X,U]:=Uj;
       Uj:=T[X,U]+1;        { [Y:X][X:U] -> [U:Y] }
       If (Tu[U,Y]<Uj) Then Tu[U,Y]:=Uj;
     End;
     For U:=Y To 9 Do Begin
       Uj:=T[Y,U]+1;        { [X:Y][Y:U] -> [X:U] }
       If (Tu[X,U]<Uj) Then Tu[X,U]:=Uj;
       Uj:=T[X,U]+1;        { [Y:X][X:U] -> [Y:U] }
       If (Tu[Y,U]<Uj) Then Tu[Y,U]:=Uj;
     End;
     T:=Tu;
   End{for i};
   M:=0;
   For X:=0 To 9 Do     { maximun kereses }
     For Y:=X To 9 Do
       If M<T[x,y] Then M:=T[x,y];
End; { Megold }
Var Puf:Array[1..20000] of Char; {Puffer az beolvasa gyorsitasara}
Begin{Program}
  Assign(BeF,'domino.be');Reset(BeF);
  SetTextBuf(BeF,Puf);
  Megold;

  Assign(KiF,'domino.ki');Rewrite(KiF);
  WriteLn(KiF,M);
  Close(BeF); Close(KiF);
End.
