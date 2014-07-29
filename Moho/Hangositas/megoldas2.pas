program hangos;
const
	maxN=1000;
var
	N,K,R,L,i:integer;
function Sor:longint;
var
	m,x,y,opt,i,ig:integer;
begin
	opt:=0; ig:=0;
	read(m);
	for i:=1 to m do begin
		read(x,y);
		if ig<x then begin
			opt:=opt+L;
			ig:=y;
		end;
	end{for i};
	Sor:=opt;
	readln;
end;
var
	s,penz,hanyszor,x:longint;
BEGIN
	readln(N,K,R,L);
	hanyszor:=0;
	penz:=Sor;
	i:=1;
	while (penz>=K+R)and(i<N) do begin
		x:=(penz-K) div R;
		if i+x>N then
			x:=N-i;
		penz:=penz-(K+x*R);
		inc(hanyszor);
		i:=i+x;
		while (x>0) do begin
			s:=Sor;
			penz:=penz+s;
			dec(x);
		end;
	end;
	writeln(penz);
	writeln(hanyszor);
END.

