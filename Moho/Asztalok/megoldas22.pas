Program asztalok;
  const maxn=500000;
        maxk=100;
        maxido=100000;
  var n,k: longint;
      e,t,s,db,er,sor: array[1..maxn] of longint;
      ee,tt,ss: array[1..maxn] of longint;
      m,i,j,su: longint;
      
  Procedure rendez(u: longint);
    var i: longint;
        db,elso: array[1..maxido] of longint;
  begin
    for i:=1 to maxido do db[i]:=0;
    for i:=1 to n do db[ee[i]]:=db[ee[i]]+1;
    elso[1]:=1;
    for i:=2 to maxido do elso[i]:=elso[i-1]+db[i-1];
    for i:=1 to n do
    begin
      e[elso[ee[i]]]:=ee[i]; t[elso[ee[i]]]:=tt[i];
      s[elso[ee[i]]]:=ss[i];
      inc(elso[ee[i]]);
    end;
  end;
  
    Function kisebb(i: longint): longint;
    begin
      if (i+1>su) or (t[sor[i]]<=t[sor[i+1]]) then kisebb:=i else kisebb:=i+1;
    end;

    Procedure le(i: longint);
      var j,x: longint;
    begin
      if i<=su div 2 then
      begin
        j:=kisebb(2*i);
        if t[sor[i]]>t[sor[j]] then
        begin
          x:=sor[i]; sor[i]:=sor[j]; sor[j]:=x;
          Le(j);
        end;
      end;
    end;
    
    Procedure fel(i: longint);
      var x: longint;
          j: longint;
    begin
      j:=i div 2;
      if i>1 then if t[sor[i]]<t[sor[j]] then
      begin
          x:=sor[i]; sor[i]:=sor[j]; sor[j]:=x;
          fel(i div 2);
      end;
    end;
      
begin
  readln(n,k);
  for i:=1 to n do begin readln(ee[i],tt[i]); ss[i]:=i; end;
  e[n+1]:=maxint;
  rendez(n);
  m:=0; su:=1; sor[1]:=1; i:=2; j:=0;
  while su>0 do
  begin
    while (su>0) and ((e[i]>t[sor[1]]) or (i>n))  do
    begin
{    if i>=n then writeln(i,' ',e[i],' ',t[sor[1]]);}
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
