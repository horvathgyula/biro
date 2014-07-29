Program fenykep;
  const teszt='';
  const maxn=100000;
        maxk=100;
   var n,k,f: integer;
       e,t,sor,x: array[1..maxn] of integer;
       s,i,j,ido: integer;
       h,g: text;
       
   Procedure Felcsusztat(i: integer);
     var j: integer;
   begin
     if i>1 then
        if t[sor[i]]<t[sor[i div 2]]then 
        begin
          j:=sor[i]; sor[i]:=sor[i div 2]; sor[i div 2]:=j;
          Felcsusztat(i div 2);
        end;
   end;

   Procedure PrSorba(i: integer);
   begin
      s:=s+1; sor[s]:=i; Felcsusztat(s);
   end;
   
   Procedure Lecsusztat(i: integer);
     var j,k: integer;
     
     Function kisebb(j,k: integer): integer;
     begin
       if (k>s) or (t[sor[j]]<=t[sor[k]]) then kisebb:=j
										  else kisebb:=k;
     end;
     
   begin
     if i<=s div 2 then
     begin
       j:=kisebb(2*i,2*i+1);
       if t[sor[i]]>t[sor[j]] then
       begin
         k:=sor[i]; sor[i]:=sor[j]; sor[j]:=k;
         Lecsusztat(j);
       end;
     end;
   end;
   
   Procedure PrSorbol(var i: integer);
   begin
     i:=sor[1]; sor[1]:=sor[s];
     s:=s-1; Lecsusztat(1);
   end;
   
   Function PrSorelso: integer;
   begin
     PrSorelso:=sor[1];
   end;
   
begin
  assign(h,'fenykep.be'+teszt); reset(h);
  readln(h,n,k);
  for i:=1 to n do readln(h,e[i],t[i]);
  close(h);
  assign(g,'fenykep.ki'+teszt); rewrite(g);
  s:=0; f:=0; 
  e[n+1]:=t[1];
  for i:=2 to n do if t[i]>e[n+1] then e[n+1]:=t[i];
  i:=1;
  for ido:=e[1] to e[n+1] do
  begin
    while (s>0) and (t[PrSorelso]<ido) do
    begin
      PrSorbol(j);
    end; {az ido előtt elmenők kiléptek}
    while (i<=n) and (e[i]=ido) do 
    begin
      PrSorba(i);
      i:=i+1; {az i-edik be a sorba}
    end;
    if s>=k then {legalább K elem van a sorban}
    begin
      for j:=1 to k do PrSorbol(x[f*k+j]);
      f:=f+1;
    end;  
  end;
  writeln(g,f);
  for i:=1 to f do
  begin
    for j:=1 to k-1 do write(g,x[(i-1)*k+j],' ');
    writeln(g,x[i*k]);
  end;
  close(g);
end.
