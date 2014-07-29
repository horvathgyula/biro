program lang;
const
  maxK=10000;
  maxN=30000;
var
  bef,kif: text;
  K,N,H,M:integer;
  U1,U2,i,x:integer;
  Int:array[0..maxK] of integer;
begin
  assign(bef,'lang.be');
  reset(bef);
  readln(bef,K, N, H);
  for i:=0 to K do Int[i]:=0;

  for i:=1 to N do begin
    readln(bef,x);
    Int[x]:=i;
  end;
  close(bef);

  assign(kif,'lang.ki');
  rewrite(kif);
  M:=1;
  U1:=H;
  Int[0]:=-Int[0];
for x:=1 to K do
  if Int[x]>0 then begin
    if x<=U1 then 
      U2:=x
    else begin
      inc(M);
      Int[U2]:=-Int[U2];
      U1:=U2+H;
      U2:=x;
    end; 
  end;
if U1<K then begin
  inc(M);
  Int[U2]:=-Int[U2];
end;

writeln(kif,M);
for x:=0 to K do
  if Int[x]<0 then
    write(kif,-Int[x],' ');

close(kif);
end.
