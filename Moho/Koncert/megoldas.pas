program Koncert;
const
  MaxM=200000;
  MaxN=100000;
type
  Rek=record a,b,az:longint end;
  Elemtip=longint;
var
  m,n:longint;
  Be : array[1..MaxN] of Rek;
  B: array[1..MaxN] of longint;
  S : array[0..MaxM] of longint;
  Eszam: longint;
  Beoszt : array[0..MaxM] of longint;
  mego:longint;
  BeF,KiF:Text;
procedure Emel(i:longint);
var
  apa,fiu:longint; x:Elemtip;
begin{Emel}
  x:=S[i];
  fiu:=i;
  apa:=fiu shr 1;
  while (apa>0) and (Be[x].b<Be[S[apa]].b) do begin
    S[fiu]:=S[apa];
    fiu:=apa; apa:=fiu shr 1;
  end{while};
  S[fiu]:=X;
end{Emel};

procedure Sullyeszt(i:longint);
var
  apa,fiu:longint; X:Elemtip;
begin{Sullyeszt}
  X:=S[i]; apa:=i; fiu:=apa shl 1;
  while (fiu<=Eszam) do begin
    if (Be[S[fiu+1]].b<Be[S[fiu]].b) then Inc(fiu);
    if (Be[S[fiu]].b>= Be[x].b) then Break;
    S[apa]:=S[fiu];
    apa:=fiu; fiu:=apa shl 1;
  end{while};
  S[apa]:=X;
end{Sullyeszt};

procedure SorBa(x : Elemtip);
begin
  Inc(Eszam);
  S[Eszam]:=x;
  if Eszam>1 then Emel(Eszam);
end (* SorBa *) ;

function SorBol : Elemtip;
begin
  SorBol:=S[1];
  S[1]:=S[Eszam];
  Dec(Eszam);
  if Eszam>1 then Sullyeszt(1);
end (* SorBol *) ;

function NemUres:boolean;
begin
  NemUres:=Eszam>0;
end;

var
  i,x,y,k,ai,az:longint;
begin{prog}
  assign(BeF,'koncert.be');reset(BeF);
  assign(KiF,'koncert.ki');rewrite(KiF);
  readln(BeF,m,n);
  for i:=1 to n do begin 
    readln(BeF,x, y);
    Be[i].a:=x; Be[i].b:=y; Be[i].az:=i;
  end;
  close(BeF);
//rendezés a-szerint
  for i:=0 to m do begin
    S[i]:=0;
    Beoszt[i]:=0;
  end;
  for i:=1 to n do
    inc(S[Be[i].a]);
  for i:=1 to m do S[i]:=S[i]+S[i-1];
  for i:=1 to n do begin
    k:=S[Be[i].a];
    B[k]:=Be[i].az;
    dec(S[Be[i].a]);
  end;
  ai:=1;
  mego:=0;
  Eszam:=0;
  for x:=1 to m do begin
     while (ai<=n)and(Be[B[ai]].a=x) do begin
       SorBa(B[ai]);
       inc(ai);
     end;
     az:=0;
     while (NemUres) do begin
        az:=SorBol;
        if x<=Be[az].b then break;
     end;
     if az>0 then begin
        Beoszt[x]:=az;
        inc(mego);
     end;    
  end{for x:1->m};
  writelN(KiF, mego);
  for x:=1 to m do
    if Beoszt[x]>0 then 
      writeln(Kif, Beoszt[x],' ',x);
  close(KiF);
end.
