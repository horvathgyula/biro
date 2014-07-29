Program Robot;
Uses Crt;
Const
  MaxMN=100;
Var
  T:Array[1..MaxMN,1..MaxMN] Of 0..1;
  M,N:Word;
  Megold:Word;
  c: char;

Procedure BeOlv;
  Var Fin:Text;
    i,j:Word;
  Begin
    Assign(Fin,'ROBOT'+c+'.BE'); Reset(Fin);
    ReadLn(Fin,M,N);
    For i:=1 To M Do Begin
      For j:=1 To N Do
        Read(Fin,T[i,j]);
      ReadLn(Fin);
    End;
    Close(Fin);
  End{BeOlv};

Procedure KiIr;
  Var Fout:Text;
  Begin
    Assign(Fout,'ROBOT'+c+'.KI'); Rewrite(Fout);
    WriteLn(Fout,Megold);
    Close(Fout);
  End{KiIr};

Procedure Szamol;
  Var i,ii,j:Word;
    U:Array[0..MaxMN] Of Word;
  Begin
    For i:=2 To M Do U[i]:=0;
    U[1]:=1;
    For j:=1 To N Do Begin
      i:=M+1; U[0]:=1;
      While i>0 Do Begin
        Repeat
          Dec(i);
        Until (i=0) Or (T[i,j]=1);
        If i=0 Then Break;
        ii:=i;
        While U[ii]=0 Do Dec(ii);
        U[ii]:=0; U[i]:=1;
        i:=ii;
      End{While};
    End{For j};

    Megold:=0;
    For i:=1 To M Do Megold:=Megold+U[i];
  End{Szamol};

Begin
  clrscr; writeln('                         Robotok'); writeln;
  write('Feladatazonos¡t¢ karakter?'); readln(c); writeln;
  BeOlv;
  Szamol;
  KiIr;
End.