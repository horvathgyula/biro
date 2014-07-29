Program Kemping;
  Uses crt;
  Const MaxN=365;
    MaxK=100;
    MaxM=14;
  Var
    K,M,N: Integer;
    Igeny: array [1..MaxN] of Integer;{az igenyek szama Igeny[i] naptol}
    Megold: integer;
    FSzabad: array [1..MaxK] of Integer;
    c: char;

  Function Szabad(i:Integer): Integer;
    var j: integer;
  Begin
    j:=1;
    while (j<=K) and (FSzabad[j]>i) do Inc(j);
    Szabad:=j; {j az elso olyan fahaz, amely szabad az i. naptol}
  End{Szabad};

Procedure Beolv;
  Var Bef:Text;
    i,x:Integer;
  Begin
    Assign(Bef,'KEMPING'+c+'.BE'); Reset(Bef);
    ReadLn(Bef,K);
    ReadLn(Bef,M);
    ReadLn(Bef,N);
    For i:=1 To MaxN Do Igeny[i]:=0;
    For i:=1 To N Do Begin
      ReadLn(Bef,x);
      Inc(Igeny[x]);
    End;
    Close(Bef)
  End{Beolv};

Procedure KiIr;
  Var Kif:Text;
  Begin
    Assign(Kif,'KEMPING'+c+'.KI'); Rewrite(Kif);
    WriteLn(Kif,Megold); WriteLn(Megold);
    Close(Kif)
  End{KiIr};

Procedure Szamit;
  Var
    i,j:Integer;
  Begin
    Megold:=0;
    For i:=1 To MaxN Do Begin
      While Igeny[i]>0 Do Begin
        j:=Szabad(i);
        If j<=K Then Begin
          Inc(Megold);
          Dec(Igeny[i]);
          FSzabad[j]:=i+M;
        End Else
          Break;
      End{While};
    End{For};
  End;

begin
  clrscr; writeln('                         Kemping'); writeln;
  write('Feladatazonos¡t¢ karakter?'); readln(c); writeln;
  Beolv;
  Szamit;
  KiIr;
end.
