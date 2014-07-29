Program tavasz;
  const teszt='';
  const maxm=100000;
        maxk=1000;
        type tomb=array[0..maxm] of longint;
  var f,g: text;
      n,m,k: longint;
      kezd,t,maxt,ind: tomb;
      i,db,e,u,max: longint;
      
  Function hossz(a,b: integer): integer;
  begin
    if a<=b then hossz:=b-a else hossz:=b+m-a;
  end;
  
  Procedure moho(i: longint; var db: longint; var t: tomb);
    var j,veg: longint;
  begin
    j:=i; db:=0; veg:=(m-1+i) mod m;
    repeat
      if kezd[j]>=0 then 
        if (kezd[j]<=j) and ((veg<kezd[j]) or (veg>j)) or
           (kezd[j]>j) and ((veg<kezd[j]) and (veg>j))then 
        begin
          db:=db+1; t[db]:=j; veg:=j; {writeln(j,' ',db); readln;}
        end;
      if j<m-1 then j:=j+1 else j:=0;
    until (j=i) or ((db>0) and (j=kezd[t[1]]));
  end;
  
begin
  assign(f,'tavasz.be'+teszt); reset(f);
  readln(f,n,m,k);
  for i:=0 to m-1 do kezd[i]:=-1; 
  for i:=1 to n do
  begin
    readln(f,e,u);
    if kezd[u]=-1 then begin kezd[u]:=e; ind[u]:=i; end
    else if hossz(kezd[u],u)>hossz(e,u) then begin kezd[u]:=e;ind[u]:=i; end;
  end;
  {for i:=0 to m-1 do write(kezd[i],' '); writeln; }
  close(f);
  max:=0;
  for i:=0 to k do
  begin
    moho(i,db,t); {writeln(db,' ',ind[t[1]],' ',ind[t[2]]);}
    if db>max then begin max:=db; maxt:=t; end;
  end;
  assign(g,'tavasz.ki'+teszt); rewrite(g);
  writeln(g,max);
  for i:=1 to max-1 do write(g,ind[maxt[i]],' ');
  writeln(g,ind[maxt[max]]);
  close(g);
end.
