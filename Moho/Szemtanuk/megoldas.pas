Program rkeres;
const
  MaxM=1000;
  MaxN=1000;
var
  m,n: word;
  A, B, E, V : array[0..Maxm] of word;
  KiF: text;
  i,j,Veg:word;

procedure Beolvas;
var   Bef: text;
  i:word;
begin
  assign(BeF,'rkeres.be'); reset(BeF);
  readln(BeF,m,n);
  for i:=1 to m do
    read(BeF, E[i]);
  readln(BeF);

  for i:=1 to n do
    readln(BeF, A[i], B[i]);
  close(Bef);
end{Beolvas};
var mego:word;
begin
  Beolvas;
  mego:=1;
  i:=1; j:=1;
  Veg:=0;
  while (i<=m)and(j<=n) do begin
     if A[j]<=E[i] then begin
      if Veg<B[j] then begin
        Veg:=B[j];
        V[mego]:=i;
      end;
      inc(j);
    end else begin
      if E[i]>Veg then break;
      inc(mego);
      while (i<=m)and(E[i]<=veg) do inc(i);
    end;
  end{while};
  if (i<m)or(E[i]>Veg) then 
    mego:=0;
  
  assign(kiF,'rkeres.ki'); rewrite(KiF);
  writeln(KiF,mego);
  for i:=1 to mego do
    write(KiF,V[i],' ');
  writeln(KiF);
  close(KiF);
end.

