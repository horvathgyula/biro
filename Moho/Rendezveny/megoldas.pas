Program Rendez;
Const
  MaxN=1000;
Type
  Igeny=Record k,b, id:integer End;
Var
  N:integer;
  Ig:Array[1..MaxN] of Igeny;
  A,B:Array[1..MaxN] of integer;
  mA,mB:integer;
Procedure Beolvas;
Var
  BeF:Text;
  i,x,y:integer;
Begin
Assign(BeF, 'rendez.be'); Reset(BeF);
  ReadLn(BeF, N);

  For i:=1 To N Do Begin
    ReadLn(BeF, x,y);
    Ig[i].k:=x; Ig[i].b:=y; Ig[i].id:=i;
  End{for i};

  Close(BeF);
End{Beolvas};

Procedure KiIr;
Var
  KiF:text;
  i:Longint;
Begin
  Assign(KiF, 'rendez.ki'); Rewrite(KiF);
  writeln(Kif, mA,' ',mB);
  for i:=1 to mA do
    write(Kif,A[i],' ');
  writeln(Kif);
  for i:=1 to mB do
    write(Kif,B[i],' ');
  writeln(Kif);

  Close(KiF);
End{KiIr};

Procedure Szamit;
const
  Maxi=720;
Var
  S:array[0..Maxi] of integer;
  R:array[1..MaxN] of integer;
  i,ii,x,y:integer;
  Aveg,Bveg:integer;
Begin{Szamit}
  For i:=0 To Maxi Do S[i]:=0;
  for i:=1 to N do inc(S[Ig[i].b]);
  For i:=1 To Maxi Do S[i]:=S[i]+S[i-1];
  for i:=1 to N do begin
    x:=S[Ig[i].b];
    R[x]:=Ig[i].id;
    dec(S[Ig[i].b]);
  end;
  mA:=0;mB:=0;
  Aveg:=0; Bveg:=0;
  for i:=1 to N do Begin
     ii:=R[i];
     if Aveg>=Bveg then begin
       if Aveg<Ig[ii].k then begin
         inc(mA); A[mA]:=Ig[ii].id;
         Aveg:=Ig[ii].b;
       end else if Bveg<Ig[ii].k then begin
         inc(mB); B[mB]:=Ig[ii].id;
         Bveg:=Ig[ii].b;
       end
     end else begin
       if Bveg<Ig[ii].k then begin
         inc(mB); B[mB]:=Ig[ii].id;
         Bveg:=Ig[ii].b;
       end else if Aveg<Ig[ii].k then begin
         inc(mA); A[mA]:=Ig[ii].id;
         Aveg:=Ig[ii].b;
       end
     end;
  end;
End{Szamit};

Begin{Prog}
  Beolvas;
  Szamit;
  KiIr;
End.
