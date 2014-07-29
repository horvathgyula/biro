Program Valid;
{Validalo Pr. }
{ Hasznalat: >VAL Fn Te; }
{ Fn: a feladat neve, Te: a teszteset sorszama }
Const
  TKc='C:\TESZT\';
  OKc='C:\IOIV98\';
Var
  TK,       { Tesztkonyvtar }
  Fn,       { Feladatnev }
  Te:String;{ Teszteset }
  Bef,      { input file}
  Kif,      { a koorekt output file }
  Outf,     { output file }
  VKif:Text;{ a versenyzo output fileja }
  OK:Boolean;

Procedure WriteOut;
Begin
  Close(VKiF);
  Assign(Outf,OKc+Fn+'\TESZT\stp.'+Te);
  append(Outf);
  If OK Then
    WriteLn(Outf,'1':1)
  Else
    WriteLn(Outf,'0':1);
  close(Outf);
End (* WriteOut*);

Procedure Init;
  Begin
    Fn:=ParamStr(1); { A feladat neve }
    Te:=ParamStr(2); { A teszteset sorszama }
    TK:=TKc+Fn+'\';
    Assign(VKif,Fn+'.ki'+Te);
    {$I-}
      Reset(VKif);
    {$I+}
    If IOResult<>0 Then OK:=False;
  End (*Init*);

Procedure Ellen;
Var
  EN,         { Az elvart eredmeny }
  N :Longint; { A versenyzo eredmenye }
  Vege:Boolean;
Begin
  OK:=True;
  Init;
  If Not OK Then Exit;
  Assign(Kif,TK+Fn+'.ki'+Te);
  Reset(Kif);
  ReadLn(Kif,EN);
  Close(Kif);

  {$I-}
    Read(VKif,N);
  {$I+}
  If IOResult<>0 Then
    OK:=False
  Else Begin
    OK:=SeekEoLn(VKiF);
    OK:=OK And SeekEof(VKif) And (EN=N);
  End;
End (*Ellen*);

Begin {Program}
  Init;
  Ellen;
  WriteOut;
End.