Program mozi;
  const teszt='';
        maxn=10000;
  var f,g: text;
      n,m,k,l: integer;
      s,sor,er: array[1..maxn] of integer;
      i,j,x,min: integer;
  
begin
  assign(f,'mozi.be'+teszt); reset(f);
  readln(f,m,n,k);
  for i:=1 to m do er[i]:=0;
  for i:=1 to n do
  begin
    read(f,s[i]); sor[i]:=i;
  end;
  close(f);
  l:=0;
  for i:=1 to n-1 do
  begin
    min:=i;
    for j:=i+1 to n do
      if s[j]<s[min] then min:=j;
    x:=s[min]; s[min]:=s[i]; s[i]:=x;
    x:=sor[min]; sor[min]:=sor[i]; sor[i]:=x;
  end;
  x:=1; l:=0;
  for i:=1 to m do
  begin
    if s[x]<=i then
    begin
      while (x<=n) and (s[x]+k<i) do x:=x+1;
      if x<=n then
      begin
        if s[x]<=i then 
        begin
          er[i]:=x; l:=l+1;x:=x+1;
        end
      end 
      else break;
    end;
  end;
  assign(g,'mozi.ki'+teszt); rewrite(g);
  writeln(g,l);
  for i:=1 to m do
    if er[i]>0 then writeln(g,sor[er[i]],' ',i);
  close(g);
end.
