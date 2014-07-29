Program Fenykep;
(*
Input : Intervallumok {[e1,t1],...,[en,tn]} halmaza.
Output: Legkevesebb elemszamu olyan H halmaz, hogy minden
        intervallumba esik H-nak legalabb egy eleme.
*)
Const
  MaxN=3000;                        { az intervallumok max. szama  }
  MinE=1;
  MaxT=1000;
Var
  N    :Word;                       { az intervallumok szama }
  Int  :Array[1..MaxT] of Word;     { az intervallumok: [Int[t],i), ha Int[t]>0 }
  M:Word;                           { a megoldas intervallumainak szama}
  Mego:Array[1..MaxN] of Word;      { a megoldás halmaz}
  i,x:Integer;
  Utolso:Integer;

Procedure Beolvas;
{Global:N, Int}
  Var
    Bef:Text;
    i,e,t:Word;
  Begin
    For i:=1 To MaxT Do Int[i]:=0;
    Assign(Bef,'fenykep.be0'); Reset(Bef);
    ReadLn(Bef,N);
    For i:=1 To N Do Begin
      ReadLn(Bef,e,t);
      If e>Int[t] Then Int[t]:=e;
    End;
    Close(Bef);
  End{Beolvas};

Procedure KiIr;
{Global: M, Mego }
  Var
    Kif:Text;
    i:Word;
  Begin
    Assign(KiF,'fenykep.ki'); Rewrite(KiF);
    WriteLn(Kif,M);

    For i:=1 To M Do
      Write(Kif,Mego[i],' ');

    WriteLn(Kif);

    Close(KiF);
  End{KiIr};

Begin{Program}
  Beolvas;

  Utolso:=0;{az utolso bevalasztott pont}
  M:=0;     {a bevalasztott pontok szama}
  For x:=1 To MaxT Do
    If (Int[x]>0)And(Utolso<Int[x]) Then Begin
      Utolso:=x-1;
      Inc(M);
      Mego[M]:=Utolso;
    End;
  {for i};

  KiIr;
End.

