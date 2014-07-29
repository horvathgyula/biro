const
  maxN=1000000;
  maxAB=100000;
type
  Par=record a,b:longint end;
var
  P:array[1..maxN] of Par;
  Veg,Kezd :array[0..maxAB+1] of longint;
  N,x,y,i,M,max,maxi:longint;
  be,ki:Text; 
begin
	assign(be,'vendeg.be'); reset(be);
	assign(ki,'vendeg.ki'); rewrite(ki);
	for x:=0 to maxAB+1 do begin
	  Veg[x]:=0; Kezd[x]:=0;
	end;
	readln(be,N);
    for i:=1 to N do begin 
      readln(be, x,y);
      P[i].a:=x; P[i].b:=y; 
      inc(Kezd[x]); 
      inc(Veg[y]);
	end;
	close(be);
	for x:=1 to maxAB do 
	  Veg[x]:=Veg[x-1]+Veg[x];
	for x:=maxAB downto 1 do 
	  Kezd[x]:=Kezd[x]+Kezd[x+1];
	M:=0;
	for i:=1 to N do begin
	  max:=Veg[P[i].a-1]+Kezd[P[i].b+1];
	  if max>M then begin
	    M:=max; maxi:=i;
	  end;
	end;  
	writeln(ki,maxi,' ', N-M-1);
    close(ki);
end.
