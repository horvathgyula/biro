const
  maxb=20000;
var
  N,K, m,x,y,i,veg:longint;
  Kezd,Mego:array[1..maxb] of longint;
  be,ki:Text; 
begin
	assign(be,'fenykep.be'); reset(be);
	assign(ki,'fenykep.ki'); rewrite(ki);
	readln(be,N, K);
	for x:=1 to Maxb do Kezd[x]:=0;
    for i:=1 to N do begin 
      readln(be, x,y);
      if Kezd[y]<x then Kezd[y]:=x;
	end;
	close(be);
	m:=0; veg:=0;
	for x:=1 to Maxb do
	  if (Kezd[x]>0) and (Kezd[x]>=veg) then begin
	    inc(m); Mego[m]:=x;
	    veg:=x+K;
	  end;
	writeln(ki, m);
	For i:=1 to m-1 do write(ki, Mego[i],' ');
	writeln(ki,Mego[m]);
    close(ki);
end.
