Program asztalok;
  const maxn=500000;
        maxk=100;
  var n,k: longint;
      e,t,s,db,er,sor: array[1..maxn] of longint;
      m,i,j,su,c: longint;
      
  Procedure rendez(el,u: longint);
    var k,l: longint;
        y1,y2,y3: longint;
  begin
    k:=el; l:=u; y1:=e[el]; y2:=t[el]; y3:=s[el];
    while k<l do
    begin
      while (k<l) and not(e[l]<y1) do dec(l);
      if k<l then
      begin
        e[k]:=e[l]; t[k]:=t[l]; s[k]:=s[l]; k:=k+1;
        while (k<l) and (e[k]<y1) do inc(k);
        if k<l then 
        begin
          e[l]:=e[k]; t[l]:=t[k]; s[l]:=s[k]; l:=l-1;
        end;
      end;
    end;
    e[k]:=y1; t[k]:=y2; s[k]:=y3;
    if k-el>1 then rendez(el,k-1);
    if u-k>1 then rendez(k+1,u);
  end;
  
    Function kisebb(i,j: longint): longint;
    begin
      if (j>su) or (t[sor[i]]<=t[sor[j]]) then kisebb:=i else kisebb:=j;
    end;

    Procedure le(i: longint);
      var j,x: longint;
    begin
      if i<=su div 2 then
      begin
        j:=kisebb(2*i,2*i+1);
        if t[sor[i]]>t[sor[j]] then
        begin
          x:=sor[i]; sor[i]:=sor[j]; sor[j]:=x;
          Le(j);
        end;
      end;
    end;
    
    Procedure fel(i: longint);
      var x: longint;
    begin
      if i>1 then if t[sor[i]]<t[sor[i div 2]] then
      begin
          x:=sor[i]; sor[i]:=sor[i div 2]; sor[i div 2]:=x;
          fel(i div 2);
      end;
    end;
    
  
      
begin
  readln(n,k);
  for i:=1 to n do begin readln(e[i],t[i]); s[i]:=i; end;
  e[n+1]:=maxint;
  rendez(1,n);
  m:=0; su:=1; sor[1]:=1; i:=2; j:=0;
  while su>0 do
  begin
    while (su>0) and ((e[i]>t[sor[1]]) or (i>n)) do
    begin
      m:=m+1; db[m]:=0;
      while (su>0) and (db[m]<k) do
      begin
        j:=j+1; er[j]:=sor[1]; sor[1]:=sor[su]; su:=su-1; le(1); 
        db[m]:=db[m]+1;
      end;
      if m>1 then db[m]:=db[m]+db[m-1];
    end;
    if i<n+1 then 
    begin 
      su:=su+1; sor[su]:=i; fel(su); i:=i+1; 
    end;
  end;
  writeln(m); j:=1;
  for i:=1 to n do
  begin
    write(s[er[i]],' ');
    if i=db[j] then begin writeln; j:=j+1 end;
  end;
end.
