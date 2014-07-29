Program taxi;
  const teszt='';
  const maxn=1000; maxk=100;
  var n,k,db,m: integer;
      f,g:  text;
      t: array[1..maxn,1..maxk] of integer;
      i,j,l: integer;
      ig: array[1..maxk] of integer;

  Procedure Beolvasas;
    var i,j,c,d: integer;
  begin
    assign(f,'taxi.be'+teszt); reset(f);
    readln(f,k,n,m);
    for i:=1 to n do for j:=1 to k do t[i,j]:=0;
    for c:=1 to m do
    begin
      readln(f,i,j);
      d:=k-1;
      if i>t[j,k] then
      begin
        while (d>0) and (i>t[j,d]) do
        begin
          t[j,d+1]:=t[j,d]; dec(d);
        end;
        t[j,d+1]:=i;
      end;
    end;
    close(f);
  end;

  Procedure rendez_ig;
    var i,j,min: integer;
  begin
    for i:=1 to k-1 do
    begin
      min:=i;
      for j:=i+1 to k do if ig[j]<ig[min] then min:=j;
      j:=ig[i]; ig[i]:=ig[min]; ig[min]:=j;
    end;
  end;

begin
  Beolvasas;
  for i:=1 to k do ig[i]:=0;
  db:=0;
  for i:=1 to n do
  begin
    j:=1;
    while (j<=k) and (t[i,j]>0) do
    begin
      l:=k;
      while (l>0) and (ig[l]>t[i,j]) do dec(l);
      if l>0 then
      begin
        inc(db); ig[l]:=i;
          rendez_ig;
      end;
      inc(j);
    end;

  end;
  assign(g,'taxi.ki'+teszt); rewrite(g);
  writeln(g,db);
  close(g);
end.
