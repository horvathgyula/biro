program utemez;
const
  maxN=30000;
var
  bef,kif: text;
  N,i:longint;
  E,V,P:array[1..maxN] of longint;
  
Function RendRel(i,j:integer):Boolean;
{}
var
	xi,xj:longint;
Begin
	xi:=E[i]+V[i];
	if xi<E[i]+E[j]+V[j] then
		xi:=E[i]+E[j]+V[j];
	xj:=E[j]+V[j];
	if xj<E[i]+E[j]+V[i] then
		xi:=E[i]+E[j]+V[i];	
  RendRel:=xi<xj;
End{RendRel};

procedure Rendez();
Var
    i,E : longint;
  Procedure Sullyeszt(K,L : integer );
  {Input : P[K+1..L] kupac,  Output: P[K..L] kupac   }
    Var  Apa,Fiu,E: integer;
    Begin{Sullyeszt}
      E:=P[K]; Apa:=K; Fiu:=2*Apa;
      While (Fiu <= L) Do Begin
        If (Fiu < L) And RendRel(P[Fiu],P[Fiu+1]) Then
          Fiu := Fiu+1;
        If Not RendRel(E, P[Fiu]) Then
          Break
        Else Begin
          P[Apa]:=P[Fiu];
          Apa:=Fiu; Fiu:=2*Apa
        End
      End{while};
      P[Apa] := E
    End{Sullyeszt};

  Begin{Rendez}
    for i:=1 to N do P[i]:=i;
    For i :=N Div 2 Downto 1 Do  Sullyeszt(i, N);{Kupacépít}
    For i := N Downto 2 Do Begin
      E:=P[i]; P[i]:=P[1]; P[1]:=E;
      Sullyeszt(1,i-1)
    End{for i};
End{Rendez};
var
  et,vt:longint;
begin
  assign(bef,'munka.be');
  reset(bef);
  readln(bef,N);
  for i:=1 to N do
    read(Bef, E[i]);
  readln(Bef);
  for i:=1 to N do
    read(Bef, V[i]);
  readln(Bef);  
  close(bef);
  Rendez();
  et:=0; vt:=0;
  for i:=1 to N do begin
    et:=et+e[P[i]];
    if vt<et+V[P[i]] then vt:=et+V[P[i]];
  end;
  assign(kif,'munka.ki');
  rewrite(kif);
  writeln(Kif, vt);
  for i:=1 to N do write(kif,P[i],' '); writeln(kif);
 
  close(kif);
end.
