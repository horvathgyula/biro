Program EDomino;
{Ertekelo Pr. az Arany feladathoz }
Const
  FNev='DOMINO';                   { Feladatnev }
  MaxTesz=15;                     { a tesztesetek max. szama }
  TeC:Array[1..15] of Char=('1','2','3','4','5','6','7','8','9','a','b','c','d','e','f');

Var
  TeK:String;                     { tesztkonyvtar=ParamStr(1) }
  Tesz:Word;                      { a tesztesetek szama=ParamStr(2) }
  Bef,                            { input file}
  Kif,                            { a korrekt output }
  VKif:Text;                      { a versenyzo outputja }
  FFNev:String;                   { kimeneti  llom nyn‚v }
  Pont:Array[1..MaxTesz] Of Byte; { a pont(0/1) per teszteset }
  i:Integer;

Const
  MaxN=1000;
Var
  N:Longint;     { a dominok szama }
  E,V:Longint;

Procedure KiIr;
Var i:Word;
  Ef:Text;
Begin
  Assign(Ef,FNev+'.ERT'); Rewrite(Ef);
  For i:=1 to Tesz Do
    Write(Ef,Pont[i]:3);

  WriteLn(Ef);
  Close(Ef);
End (*KiIr*);

Function Ellen(t:Byte):Byte;
Var
  E,          { Az elvart eredmeny }
  V: Longint; { A versenyzo eredmenye }
  i:Word;
Begin
  Ellen:=0;

  FFNev:=FNev+'.KI'+TeC[t];
  Assign(VKif,FFNev); { versenyzo outputja az aktualis konytarban!}
  {$I-}
    Reset(VKif);
  {$I+}
  If IOResult<>0 Then Begin
    WriteLn(FFNev+'  llom ny nem tal lhat¢!');
    Exit;
  End;
{
  Assign(Bef,TeK+FNev+'.BE'+TeC[t]);
  Reset(Bef);
  ReadLn(Bef,N);
  Close(BeF);
}
  Assign(Kif,TeK+FNev+'.KI'+TeC[t]);
  Reset(Kif);
  ReadLn(Kif,E);
  Close(Kif);

    {$I-}
      ReadLn(VKif,V);
    {$I+}
    If (IOResult<>0) Then Begin
      Close(VKif);
      Exit;
    End;

  If Not EoF(VKif) Then
  If Not SeekEoLn(VKif) Then Begin
    Close(VKif);
    Exit;
  End;
  Close(VKif);

  If (E<>V) Then
    Ellen:=0
  Else
    Ellen:=1;
End (*Ellen*);

Begin {Program}
  TeK:=ParamStr(1)+'\';
  Val(ParamStr(2),Tesz,i);

  For i:=1 To Tesz Do
    Pont[i]:=Ellen(i);

  KiIr;
End.