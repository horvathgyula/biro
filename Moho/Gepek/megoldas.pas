Program gepek;
  const teszt='';
        maxn=10000; maxm=100000;
  var f,g: text;
      n,m,s,sum: longint;
      i,a,b: longint;
      h: array[1..maxm] of longint;
      db,tol: array[1..maxn] of longint;
begin
  assign(f,'gepek.be'+teszt); reset(f);
  readln(f,n,m);
  for i:=1 to m do read(f,h[i]);
  close(f);
  for i:=1 to n do db[i]:=0;
  for i:=1 to m do db[h[i]]:=db[h[i]]+1;
  tol[1]:=1;
  for i:=2 to n do tol[i]:=tol[i-1]+db[i-1];
  s:=0; sum:=0;
  for i:=1 to n do
  begin
    sum:=sum+db[i];
    if (sum-1) div i+1>s then s:=(sum-1) div i+1;
  end;
  assign(g,'gepek.ki'+teszt); rewrite(g);
  writeln(g,s);
  for i:=1 to m do
  begin
    a:=(tol[h[i]]-1) div s+1; b:=(tol[h[i]]-1) mod s+1;
    writeln(g,a,' ',b);
    tol[h[i]]:=tol[h[i]]+1;
  end;
  close(g);
end.
