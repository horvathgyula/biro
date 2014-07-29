Program EDARABOL;
{Ertekelo Pr. a  DARABOL feladathoz }
{ ParancsSor: Tesztkonyvtar tesztesetekszama }
{ Output: DARABOL.ERT fajlban 0/1 tesztesetenkent egy sorban }
Const
  FNev='DARABOL';                 { Feladatnev }
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
  MaxN=1000;  {a vagasok max. szama}
Var
  N,EH,VT,V1,V2:Longint;
  D,Dv:Array[1..MaxN] Of Longint;
  Db:Word;
  En,          { a korrekt eredmeny }
  Vn:Longint;  { a versenyzo eredmenye }
  OK:Boolean;

Procedure Beolvas;
Var
  BeF:Text;
  i:Integer;
Begin{Beolvas}
  Assign(Bef,Tek+FNev+TeC[t]+'.BE');  Reset(Bef);
  EH:=0;
  ReadLn(BeF,N);
  For i:=1 To N Do Begin
    Read(BeF,D[i]);
    EH:=EH+D[i];
  End;

  Close(BeF);
End{Beolvas};

Begin{Ellen}
  { korrekt output beolvasasa }
  Readln(Kif,En);
  {$I-}
    Read(VKif,Vn);
  {$I+}
  If (IOResult<>0) Or (En<>Vn) OR Not SeekEoLn(VKif) Then Exit;
  ReadLn(VKif);
  Pont[t,1]:=1;    {A reszfeladat OK }
{B reszfekadat:}
  Beolvas;

  VT:=0;  Db:=1;
  Dv[1]:=EH;
  For i:=1 To N-1 Do Begin
    {$I-}
      ReadLn(VKif,V1,V2);
    {$I+}
    If (IOResult<>0) Then Exit;
    j:=1;
    While (j<=Db)And(V1<>Dv[j]) Do Inc(j);
    If j>Db Then Exit;
    VT:=VT+V1;
    Dv[j]:=V1-V2;
    Inc(Db); Dv[Db]:=V2;
  End{for i};

  If VT<>EN Then Exit;
  For i:=1 To N Do Begin
    OK:=False;
    For j:=1 To N Do
      If D[j]=Dv[i] Then Begin
        D[j]:=0;
        OK:=True;
        Break
      End;
    If Not OK Then Exit;
  End{for i};

  Pont[t,2]:=1;
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