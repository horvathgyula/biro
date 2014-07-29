Program ELADA;
{Ertekelo Pr. a  LADA feladathoz }
{ ParancsSor: Tesztkonyvtar tesztesetekszama }
{ Output: LADA.ERT fajlban 0/1 tesztesetenkent egy sorban }
Const
  FNev='LADA';                 { Feladatnev }
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
Const
  MaxN=10000;
Type Sor=Array[1..MaxN] of Word;{a ladasor}

Procedure Rendez(Var S:Sor; m:Word);
  Function Feloszt( Bal,Jobb : Word): Word ;
    Var
      Fe : Word;
      E:Integer;
      i,j : Word;
    Begin
      Fe := S[(Bal+Jobb) Div 2];
      i := Bal-1; j := Jobb+1;
      While True Do Begin
        Repeat
          Inc(i)
        Until (S[i]<=Fe);
        Repeat
          Dec(j)
        Until (Fe<=S[j]);
        If I < J  Then Begin
          E := S[i]; S[i] := S[j]; S[j] := E;
        End Else Begin
          Feloszt:= j;
          Exit
        End;
      End{while};
    End (* Feloszt *);

  Procedure GyorsRendez(bal,jobb : Word);
    Var
      kozep : Word;
    Begin
      kozep := Feloszt(bal, jobb);
      If bal < kozep Then
        GyorsRendez(bal, kozep);
      If kozep+1 < jobb Then
        GyorsRendez(kozep+1, jobb)
    End (* GyorsRendez *);
  Begin
    If m > 1 Then
      GyorsRendez(1, m);
  End (* Rendez *);

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
  MaxN=10000;  {a ladak max. szama}
Var
  N,       {a ladak szama}
  M:Word;  {a pakkok szama}

  En,          { a korrekt eredmeny }
  Vn,X,Y,P,OP:Longint;  { a versenyzo eredmenye }
  AE,AV:Sor;

Procedure Beolvas;
Var
  BeF:Text;
  i,X,Y,P:Integer;
Begin{Beolvas}
  Assign(Bef,Tek+FNev+TeC[t]+'.BE');  Reset(Bef);
  ReadLn(BeF,N);
  For i:=1 To N Do Begin
    Read(BeF,AE[i]);
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
  M:=0;
  For i:=1 To En Do Begin{egy sor beolvasasa}
    While Not SeekEoln(VKiF) Do Begin
      {$I-}
      Read(VKiF,x);
      {$I+}
      If IOResult<>0 Then Exit;
      Inc(M);
      If M>N Then Exit;
      AV[M]:=x;
    End;
    ReadLN(VKiF);
  End;
  Rendez(AE,N);
  Rendez(AV,N);
  i:=1;
  While (i<=N) And (AE[i]=AV[i]) Do Inc(i);
  If i>N Then
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