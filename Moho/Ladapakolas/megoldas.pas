const
  maxN=30001;
  maxK=20000;
var
  N,m,x,i,j,b,bb,t:longint;
  a:array[1..maxN] of integer;
  be,ki:Text;
begin
	assign(be,'pakol.be'); reset(be);
	assign(ki,'pakol.ki'); rewrite(ki);
	readln(be,N);
	for i:=1 to N do 
	  read(be,a[i]);
	close(be);
	m:=0; i:=1;
	a[n+1]:=0;
	repeat
	  b:=i;
	  while (i<n)and (a[i]<a[i+1]) do inc(i);
	  bb:=i-1; j:=i+1; t:=a[i];
	  while (b<=bb) do begin
	    if (a[j]<t)and(a[bb]<a[j]) then begin
	      t:=a[j]; inc(j);
	    end else begin
	      t:=a[bb]; dec(bb);
	    end;
	  end{while};
	  while (j<=n)and(t>a[j]) do begin
	    t:=a[j]; inc(j);
	  end;
	  inc(m);
	  i:=j;
	until i>n;
	writeln(ki,m);
    close(ki);
end.

