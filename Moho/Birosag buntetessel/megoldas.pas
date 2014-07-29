Program hatarido;
  const maxn=10000; teszt='';
  type feladat=record ido: integer; bunt: integer; sor: integer end;
  var n: integer;
      utem: array[1..maxn] of feladat;

  Procedure beolvasas;
    var f: text;
        i: integer;
  begin
    assign(f,'hatarido.be'+teszt); reset(f);
    readln(f,n);
    for i:=1 to n do
    begin
      readln(f,utem[i].ido,utem[i].bunt); utem[i].sor:=i;
    end;
    close(f);
  end;

  Procedure elrendezes_kiiras;
    var g: text;
        i,j,ut: integer;
        b: longint;
        ered: array[0..maxn] of integer;
  begin
    for i:=0 to n do ered[i]:=0;
    ut:=n; b:=0;
    for i:=1 to n do
    begin
      j:=utem[i].ido;
      while ered[j]<>0 do dec(j);
      if j>0 then ered[j]:=utem[i].sor
             else
             begin
               while ered[ut]>0 do dec(ut);
               ered[ut]:=utem[i].sor; b:=b+utem[i].bunt;
             end;
    end;
    assign(g,'hatarido.ki'+teszt); rewrite(g);
    writeln(g,b);
    for i:=1 to n-1 do write(g,ered[i],' ');
    writeln(g,ered[n]);
    close(g);
  end;

  Procedure rendezes(e,u: integer);
    var i,j: integer;
        t: feladat;
  begin
    t:=utem[e]; i:=e; j:=u;
    while i<j do
    begin
      while (i<j) and (utem[j].bunt<t.bunt) do dec(j);
      if i<j then
      begin
        utem[i]:=utem[j]; inc(i);
        while (i<j) and (utem[i].bunt>t.bunt) do inc(i);
        if i<j then begin utem[j]:=utem[i]; dec(j); end;
      end;
    end;
    utem[i]:=t;
    if i-e>1 then rendezes(e,i-1);
    if u-i>1 then rendezes(i+1,u);
  end;

begin
  beolvasas;
  rendezes(1,n);
  elrendezes_kiiras;
end.
