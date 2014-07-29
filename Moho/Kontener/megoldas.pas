program kontener;
const
  Maxn=10000;
  Maxk=1000;
var
  n,k,m:integer;
  A:array[1..Maxn] of integer;   {bemeni sorozat}
  Kov:array[1..Maxn] of integer; {az azonos méretüek lánca}
  Elso:array[1..Maxk] of integer;{a láncfejek}
  i,ii,x,y,maxi:integer;
  kif:Text;
procedure Beolvas;
  var
    bef:Text;
    i,x:integer;
begin
  assign(bef,'kontener.be'); reset(bef);
  readln(bef,n,k);
  for i:=1 to n do begin
    read(bef,x);
    A[i]:=x;
    Kov[i]:=0;
  end;
  close(bef);
end{Beolvas};

begin{program}
  Beolvas;
  maxi:=0;
  for i:=1 to k do Elso[i]:=0;
  for i:=n downto 1 do begin
    x:=A[i];
    Kov[i]:=Elso[x];
    Elso[x]:=i;
    if x>maxi then maxi:=x;
  end;

  m:=0;
  while maxi>0 do begin
    i:=Elso[maxi];
    for y:=maxi-1 downto 1 do begin
       if (Elso[y]>0)and(Elso[y]<i) then begin
         inc(m);
         ii:=Elso[y];
         Elso[y]:=Kov[ii];
       end;
    end{for};
    Elso[maxi]:=Kov[Elso[maxi]];
    while (maxi>0)and(Elso[maxi]=0) do dec(maxi);
  end{while};

  assign(kif,'kontener.ki');rewrite(kif);
  writeln(kif,m);
  close(kif);
end.
