Program EUTEMEZ;
{Ertekelo Pr. a  UTEMEZ feladathoz }
{ ParancsSor: Tesztkonyvtar tesztesetekszama }
{ Output: UTEMEZ.ERT fajlban 0/1 tesztesetenkent egy sorban }
Const
  FNev='UTEMEZ';                 { Feladatnev }
  MaxTesz=15;                     { a tesztesetek max. szama }
  TeC:Array[1..15] of Char=('1','2','3','4','5','6','7','8','9','a','b','c','d','e','f');
Var
  TeK:String;                     { tesztkonyvtar=ParamStr(1) }
  Tesz:Word;                      { a tesztesetek szama=ParamStr(2) }
  TLim:Longint;                   { az idolomit=ParamStr(3) }
  IdoF,                           { futasi ido }
  Bef,                            { input file}
  Kif,                            { a korrekt output }
  VKif:Text;                      { a versenyzo outputja }
  Tf  :File Of Longint;           { idostempli }
  M1,T1:Longint;                  { futasi ido }
  FFNev:String;                   { kimeneti  llom nyn‚v }
  Pont:Array[1..MaxTesz,1..2] Of Byte; { a pont(0/1) per teszteset }
  t,i,j:Integer;


  H,P:Array[1..10000] Of Word;

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
Const
  MaxN=10000;
Var
  En1,En2,          { a korrekt eredmeny }
  Vn1,Vn2:Longint;  { a versenyzo eredmenye }

  S:Array[1..10000] Of Boolean;

  x,E:Longint;
  N:Longint;

Procedure Beolvas;
Var
  BeF:Text;
  i:Integer;
Begin{Beolvas}
  Assign(Bef,Tek+FNev+TeC[t]+'.BE');  Reset(Bef);
  ReadLn(BeF,N);
  For i:=1 To N Do Begin
    ReadLn(BeF, H[i],P[i]);
  End;

  Close(BeF);
End{Beolvas};

Begin{Ellen}
  Beolvas;
  For i:=1 To N Do S[i]:=False;
  { korrekt output beolvasasa }
  Readln(Kif,En1);
  {$I-}
    ReadLn(VKif,Vn1);
  {$I+}
  If (IOResult<>0) Or (En1<>Vn1) Then Exit;
  Pont[t,1]:=1;    {A reszfeladat OK }
  E:=0;i:=1;
  While Not SeekEoLn(VKiF) Do Begin
  {$I-}
    Read(VKiF, x);
  {$I+}
    If (IOResult<>0)Or(x<0)Or(x>N)Or(S[x]) Then Exit;
    S[x]:=True;
    If H[x]<i Then Exit;
    E:=E+P[x];
    Inc(i);
  End;
  If E<>En1 Then Exit;

  Pont[t,2]:=1;    {A reszfeladat OK }
End (*Ellen*);

Begin {Program}
  TeK:=ParamStr(1)+'\';
  Val(ParamStr(2),Tesz,i);
  Val(ParamStr(3),TLim,i);

  For i:=1 To Tesz Do Begin
    Pont[i,1]:=0; Pont[i,2]:=0;
  End;

For t:=1 To Tesz Do Begin
  Assign(Tf,FNev+TeC[t]+'.STP');
  Reset(Tf);
  Read(Tf,T1,M1);
  Close(Tf);

  Assign(IdoF,FNev+TeC[t]+'.IDO');
  Rewrite(IdoF);

  If (M1=-1) Then  { idolimit tullepes }
    WriteLn(IdoF,' Megszakitva, Idolimit tullepes miatt! ')
  Else If (T1>TLim) Then
      WriteLn(IdoF,'Futasi ido: ',T1/10.0:6:2,' mp',' Idolimit tullepes! ')
  Else Begin
    WriteLn(IdoF,'Futasi ido: ',T1/10.0:6:2,' mp');

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

  End;
  Close(IdoF);
End{for t};
  KiIr;
End.