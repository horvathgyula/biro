Program hatarido;
  const maxn=10000; teszt='a';
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
        i,j,ut,b: integer;
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

  Procedure rendezes;
    var i,j: integer;
        t: feladat;
  begin
    for i:=2 to n do
    begin
      j:=i-1; t:=utem[i];
      while (j>0) and (utem[j].bunt<t.bunt) do
      begin
        utem[j+1]:=utem[j]; j:=j-1;
      end;
      utem[j+1]:=t;
    end;
  end;

begin
  beolvasas;
  rendezes;
  elrendezes_kiiras;
end.
