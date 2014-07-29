Program hangos;
  const teszt='';
  const max=1000; 
  var n,k,l: integer;
      m,d: array[1..max] of longint;
	  kezd,veg: array[1..max,1..max] of integer;
	  f,g: text;
	  i,j,u,un,lm: integer;
	  db,p: longint;
begin
  assign(f,'hangos.be'+teszt); reset(f);
  readln(f,n,k,l);
  for i:=1 to n do
  begin
    read(f,m[i]); 
	for j:=1 to m[i] do read(f,kezd[i,j],veg[i,j]);
	readln(f);
  end;
  close(f);
  d[1]:=1; u:=1;
  for j:=2 to m[1] do
	if kezd[1,j]>=veg[1,u] then
	begin
	  d[1]:=d[1]+1; u:=i;
	end;
  db:=1; p:=d[1]*l;	un:=1; lm:=1; writeln(d[1]);
  for i:=2 to n-1 do 
  begin
    p:=p-k; if p<0 then break;
    if m[i]>0 then 
    begin
      d[i]:=1; u:=1;
	  for j:=2 to m[i] do
	    if kezd[i,j]>=veg[i,u] then
	    begin
	      d[i]:=d[i]+1; u:=i;
  	    end;
    end
    else d[i]:=0;
    if i+(d[i]*l+p) div k>lm+(d[lm]*l+p) div k then lm:=i;
	if un+(d[un]*l+p) div k<i+1 then
	begin
	  db:=db+1; p:=p+d[lm]*l; un:=lm;
	end;
	writeln(d[i]);
  end;
  p:=p-k;
  assign(g,'hangos.ki'+teszt); rewrite(g);
  if p>=0 then begin writeln(g,db); writeln(g,p); end
          else begin writeln(g,-1); writeln(i); end;
  close(g);
end.
