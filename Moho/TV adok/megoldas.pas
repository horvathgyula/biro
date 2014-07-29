Program TV_adok;
  uses crt;
  const maxn=1000;
  type ado=array[1..5] of byte;
       segedtipus=array [1..maxn] of integer;
  var t: array [1..maxn] of ado;
      ered,seged: segedtipus;
      i,j,n,sor,ereddb: integer;
      c,ch: char;
      g: text;

  Procedure Adatbeolvasas;
    var f: text;
        i: integer;
  begin
    Write('Melyik  llom nyb¢l?'); Readln(c);
    assign(f,'tv'+c+'.be'); reset(f);
    n:=0;
    while not eof(f) do
    begin
      n:=n+1;
      for j:=1 to 5 do read(f,t[n,j]);
      readln(f);
    end;
    close(f);
  end;

  Procedure Output(var g: text;betu: char);
  begin
    assign(g,'tv'+c+'.ki'+betu); rewrite(g);
  end;

  Procedure Rendezes;
    var i,j,min: integer;
        a: ado;
  begin
    for i:=1 to n-1 do
    begin
      min:=i;
      for j:=i+1 to n do
        if (t[j,2]<t[min,2]) or (t[j,2]=t[min,2]) and (t[j,3]<t[min,3])
          then min:=j;
      a:=t[i]; t[i]:=t[min]; t[min]:=a;
    end;
  end;

  Procedure Afeladat;
    var uj: array [0..maxn] of ado;
        i,j: integer;
  begin
    Output(g,'a');
    uj[1]:=t[1];
    for i:=2 to n do
    begin
      j:=i-1;
      while (j>0) and ( (t[i,1]<uj[j,1]) or (t[i,1]=uj[j,1]) and
            ( (t[i,2]<uj[j,2]) or (t[i,2]=uj[j,2]) and (t[i,3]<uj[j,3]) ) )
        do begin uj[j+1]:=uj[j]; j:=j-1; end;
      uj[j+1]:=t[i];
    end;
    for i:=1 to n do
    begin
      for j:=1 to 5 do begin write(uj[i,j],' '); write(g,uj[i,j],' '); end;
      writeln; writeln(g);
    end;
    close(g);
  end;

  Procedure Kereses(e,u,edb: integer);
    var i,j: integer;

    Function Hossz(tomb: segedtipus; db: integer): Integer;
      var i,s: integer;
    begin
      s:=0;
      for i:=1 to db do
        s:=s+(t[tomb[i],4]-t[tomb[i],2])*60+(t[tomb[i],5]-t[tomb[i],3]);
      Hossz:=s;
    end;

  begin
    i:=e;
    For i:=e to u do
    begin
      edb:=edb+1; seged[edb]:=i; j:=i+1;
      While (j<=u) and ( (t[i,4]>t[j,2]) or (t[i,4]=t[j,2]) and
            (t[i,5]>t[j,3]) ) do j:=j+1;
      if (j<=u) and (edb+u-j+1>=ereddb) then Kereses(j,u,edb)
              else
              begin
                if (edb>ereddb) or
                   (edb=ereddb) and (hossz(seged,edb)>hossz(ered,ereddb)) then
                begin
                  for j:=1 to edb do ered[j]:=seged[j];
                  ereddb:=edb;
                end;
              end;
      edb:=edb-1;
    end;
  end;

  Procedure Bfeladat;
    var i,j,edb,e,u,v1,v2: integer;
  begin
    Output(g,'b');
    e:=1;
    while e<=n do
    begin
      u:=e+1; ereddb:=0; edb:=0; v1:=t[e,4]; v2:=t[e,5];
      while (u<=n) and ( (v1>t[u,2]) or (v1=t[u,2]) and
            (v2>t[u,3]) ) do
      begin
        if (v1<t[u,4]) or (v1=t[u,4]) and (v2<t[u,5])
           then begin v1:=t[u,4]; v2:=t[u,5] end;
        u:=u+1;
      end;
      Kereses(e,u-1,edb);
      for i:=1 to ereddb do
      begin
        for j:=1 to 5 do
        begin
          write(t[ered[i],j],' '); write(g,t[ered[i],j],' ');
        end;
        writeln; writeln(g);
      end;
      e:=u;
    end;
    close(g);
  end;

  Procedure Cfeladat;
  begin
    Output(g,'c');

  end;

  Procedure Dfeladat;
  begin
    Output(g,'d');

  end;

begin
  clrscr; writeln('              TV-ad¢k'); writeln;
  Adatbeolvasas; Rendezes;
  Repeat
    clrscr; writeln('              TV-ad¢k'); writeln;
    Writeln('Lehet“s‚gek:'); Writeln;
    Writeln('  1. Rendez‚s'); Writeln;
    Writeln('  2. B r‚szfeladat'); Writeln;
    Writeln('  3. C r‚szfeladat'); Writeln;
    Writeln('  4. D r‚szfeladat'); Writeln;
    Writeln('  5. Befejez‚s'); Writeln;
    Write('Melyiket v lasztod?'); Readln(sor);
    clrscr; writeln('              TV-ad¢k'); writeln;
    case sor of
      1: Afeladat;
      2: Bfeladat;
      3: Cfeladat;
      4: Dfeladat;
    end;
    if sor<5 then ch:=readkey;
  Until sor=5;
end.

