Program vizirendor;
  const teszt='';
  const maxn=1000;
  var n,m,a,b,k: integer;
      t,v: array[1..maxn+1] of integer;
      i,j,e: integer;
      f,g: text;
      eleje: Boolean;
begin
  assign(f,'vizi.be'+teszt); reset(f);
  readln(f,n,a,b,k);
  t[1]:=0;
  for i:=2 to n do readln(f,t[i]);
  close(f);
  m:=0; e:=1; eleje:=true; t[n+1]:=t[n]+k*a;
  for i:=2 to n+1 do
  begin
    if eleje then
    begin
      if (t[i]-t[e])>b*k then
      begin
        m:=m+1; v[m]:=i-1; eleje:=false;
      end;
    end;
    if not eleje then if (t[i]-t[v[m]])>a*k then
    begin
      e:=i; eleje:=true
    end;
  end;
  assign(g,'vizi.ki'+teszt); rewrite(g);
  writeln(g,m);
  for i:=1 to m do write(g,v[i],' ');
  writeln(g);
  close(g);
end.
