const
  maxN=100000;
  maxB=20000;
type
  Par=record e,t,az, parja:longint end;
var
  P,Pr:array[1..maxN] of Par;
  N,K, m,x,y,i,ii:longint;
  Szaml:array[0..maxB] of longint;
  be,ki:Text; 
begin
	assign(be,'parok.be'); reset(be);
	assign(ki,'parok.ki'); rewrite(ki);
	readln(be,N);
    for i:=1 to N do begin 
      readln(be, x,y);
      P[i].e:=x; P[i].t:=y; P[i].az:=i; P[i].parja:=0;
	end;
	close(be);
{rendez}
	for x:=0 to maxB do Szaml[x]:=0;
	for i:=1 to N do
	  inc(Szaml[P[i].t]);
	for x:=1 to maxB do
	  Szaml[x]:=Szaml[x-1]+Szaml[x];
	for i:=1 to N do begin
	  Pr[Szaml[P[i].t]]:=P[i];
	  dec(Szaml[P[i].t]);
	end;

	m:=0; 
	for i:=2 to N do begin
		for ii:=1 to i-1 do
		 if (Pr[ii].parja=0)and(Pr[i].e<Pr[ii].t) then begin
		   Pr[ii].parja:=i;
		   Pr[i].parja:=ii;
		   inc(m);
		   break;
		 end{for ii};
	end{for i};

	writeln(ki,m);
	for i:=1 to N do 
	  if (i<Pr[i].parja) then
		writeln(ki, Pr[i].az,' ',Pr[Pr[i].parja].az);
	
	writeln(ki);
    close(ki);
end.
