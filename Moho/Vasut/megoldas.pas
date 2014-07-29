Program vasut;
  uses crt;
  const maxn=100;
  var n,k: integer;
      t: array[1..maxn] of integer;
      max: integer;
      hol: array[1..maxn] of integer;
      i: integer;
begin
  clrscr; writeln('           Vonatok meg ll sa'); writeln;
  write('Az  llom sok sz ma:'); readln(n);
  write('A minim lis t vols g:'); readln(k);
  t[1]:=0;
  for i:=2 to n do
  begin
    write('Az ',i,'-edik  llom s t vols ga az indul¢  llom st¢l:');
    readln(t[i]);
  end;
  max:=1; hol[max]:=1;
  for i:=2 to n do
  begin
    if t[i]-t[hol[max]]>=k then
    begin
      max:=max+1; hol[max]:=i
    end;
  end;
  if hol[max]<>n then hol[max]:=n;
  writeln;
  writeln('Meg ll sok maxim lis sz ma: ',max);
  write('Meg ll sok helye:');
  for i:=1 to max do write(' ',hol[i]);
  writeln;
  readkey;
end.
