program stafeta;
const
  maxK=1000;
  maxN=20000;
var
  bef,kif: text;
  K,N,H,M:integer;
  U1,U2,i,x,y:integer;
  Int:array[0..maxK] of record veg,az: integer end;
begin
  assign(bef,'stafeta.be');
  reset(bef);
  readln(bef,K, N);
  for i:=0 to K do Int[i].az:=0;

  for i:=1 to N do begin
    readln(bef,x,y);
    if (Int[x].az=0) or (Int[x].veg<y) then begin
       Int[x].veg:=y;
       Int[x].az:=i;
    end;  
  end;
  close(bef);

  assign(kif,'stafeta.ki');
  rewrite(kif);
  M:=1;
  U1:=Int[0].veg;
  Int[0].az:=-Int[0].az;
for x:=1 to K do
  if Int[x].az>0 then begin
    if x<=U1 then begin
      if (Int[U2].veg < Int[x].veg) then 
        U2:=x
    end else begin
      inc(M);
      Int[U2].az:=-Int[U2].az;
      U1:=Int[U2].veg;
      U2:=x;
    end; 
  end;
if U1<K then begin
  inc(M);
  Int[U2].az:=-Int[U2].az;
end;

writeln(kif,M);
for x:=0 to K do
  if Int[x].az<0 then
    write(kif,-Int[x].az,' ');

close(kif);
end.
