Program Pakol;
{}
Var
  N:Word;        { a l�d�ksz�ma }
  BeF,KiF:Text;  { Be-Ki �llomanyok }
  NB,            { NB db B l�da marad el } 
  NC,            { NC db C l�da marad el }
  NBC,           { NBC db BC l�da marad el }
  Pakol:Word;    { ennyit pakoltunk}  
  k,i:Word;
  X:Char;

Begin{}
  Assign(BeF, 'pakol.be'); Reset(BeF);
  Assign(Kif,'pakol.ki'); Rewrite(KiF);

  ReadLn(BeF,N);

  Pakol:=0;
  NB:=0; NC:=0; NBC:=0;
  For i:=1 To N Do Begin
    Read(BeF,X);
    Case X of
      'A':Begin
            If (NB>0)And(NC>0) Then Begin
              Dec(NB); Dec(NC);
              Inc(Pakol,2);
            End Else If NBC>0 Then Begin
              Dec(NBC);
              Inc(Pakol);
            End Else If NB>0 Then Begin
              Dec(NB);
              Inc(Pakol);
            End  Else If NC>0 Then Begin
              Dec(NC);
              Inc(Pakol);
            End;
          End;
      'B':Begin
            If NC>0 Then Begin
              Dec(NC);
              Inc(Pakol);
              Inc(NBC)
            End Else
              Inc(NB)
          End;
      'C':Begin
            Inc(NC)
          End
      End{Case};
  End{for i->N};

  WriteLn(KiF,N-Pakol);

  Close(BeF);
  Close(KiF);
End.

