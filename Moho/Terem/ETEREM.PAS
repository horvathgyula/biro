Program ETEREM;
{Ertekelo Pr. a  TEREM feladathoz }
{ ParancsSor: Tesztkonyvtar tesztesetekszama }
{ Output: TEREM.ERT fajlban 0/1 tesztesetenkent egy sorban }
Const
  FNev='TEREM';                 { Feladatnev }
  MaxTesz=15;                     { a tesztesetek max. szama }
  TeC:Array[1..15] of Char=('1','2','3','4','5','6','7','8','9','a','b','c','d','e','f');
Var
  TeK:String;                     { tesztkonyvtar=ParamStr(1) }
  Tesz:Word;                      { a tesztesetek szama=ParamStr(2) }
  TLim:Longint;                    { az idolomit=ParamStr(3) }
  IdoF,                           { futasi ido }
  Bef,                            { input file}
  Kif,                            { a korrekt output }
  VKif:Text;                      { a versenyzo outputja }
  Tf  :File Of Longint;           { idostempli }
  M1,T1:Longint;                  { futasi ido }
  FFNev:String;                   { kimeneti  llom nyn‚v }
  Pont:Array[1..MaxTesz,1..2] Of Byte; { a pont(0/1) per teszteset }
  t,i,j:Integer;

Const
  MaxN=1000;
  
Procedure KiIr;
Var i,j:Word;
  Ef:Text;
Begin
  Assign(Ef,FNev+'.ERT'); Rewrite(Ef);
   For j:=1 To 2 Do Begin
    For i:=1 To Tesz Do
      Write(Ef,Pont[i,j]:3);
    WriteLn(Ef);
  End;
  Close(Ef);
End (*KiIr*);

Procedure Ellen(t:Byte);
Var
  En,          { a korrekt eredmeny }
  Vn:Longint;  { a versenyzo eredmenye }
  x,Ar:Longint;
  N,M:Word;
  E,A,B:Array[1..MaxN] of integer;
  Be:Array[1..MaxN] of Boolean;
  Foglalt,i,j:Word;

Procedure Beolv;
{Global: N,M, A,B }
  Var
    Bef:Text;
    i,x:Word;
  Begin
    Assign(Bef,Tek+FNev+TeC[t]+'.BE');  Reset(Bef);
    ReadLn(Bef,N);
    For i:=1 To N Do Begin
      ReadLn(Bef, A[i],B[i]);
      Be[i]:=False;
    End;
    Close(Bef);
  End{Beolv};

Procedure Rendez;
{az esemenyek rendezese befejezesi ido szerint novekvore}
Var
  i,j,ii:Word;
Begin{Rendez}
  For i:=2 To M Do Begin
    ii:=E[i];
    j:=i-1;
    While (j>0)And(B[E[j]]>B[ii]) Do Begin
      E[j+1]:=E[j];
      Dec(j);
    End{while};
    E[j+1]:=ii;
  End{for i};
End{Rendez};

Begin{Ellen}
  Beolv;
  { korrekt output beolvasasa }
  Readln(Kif,En);
  {$I-}
    Read(VKif,Vn);
  {$I+}
  If (IOResult<>0) Or (En<>Vn) Or Not SeekEoLn(VKif) Then
    Exit;
  Pont[t,1]:=1;    {A reszfeladat OK }
  ReadLn(VKif);

  For i:=1 To EN Do Begin{terembeosztas ellenorzese}
    M:=0;
    While Not SeekEoln(VKif) Do Begin
    {$I-}
      Read(VKif,x);
    {$I+}
      If IOResult<>0 Then Exit;
      If (x<0) Or (x>N) Or Be[x] Then Exit;
      Be[x]:=True;
      Inc(M);
      E[M]:=x;
    End{while};
    Rendez;
    Foglalt:=0;
    For j:=1 To M Do Begin
      x:=E[j];
      If Foglalt<A[x] Then Begin
        Foglalt:=B[x];
      End Else Begin
        Exit;
      End;
    End{for j};
    ReadLn(VKiF);
  End{for i};

  For i:=1 To N Do If Not Be[x] Then Begin
    Exit;
  End;
  Pont[t,2]:=1;
End (*Ellen*);

Begin {Program}
  TeK:=ParamStr(1)+'\';
  Val(ParamStr(2),Tesz,i);

  For i:=1 To Tesz Do Begin
    Pont[i,1]:=0; Pont[i,2]:=0;
  End;

For t:=1 To Tesz Do Begin

    FFNev:=FNev+TeC[t]+'.KI';
    Assign(VKif,FFNev); { versenyzo outputja az aktualis konytarban!}
    {$I-}
      Reset(VKif);
    {$I+}
    If IOResult<>0 Then
      WriteLn(FFNev+'  llom ny nem tal lhat¢!')
    Else Begin
      Assign(Kif,TeK+FNev+TeC[t]+'.KI');
      Reset(Kif);

      Ellen(t);
      Close(Vkif);
      Close(Kif);
    End;

End{for t};

  KiIr;
End.
