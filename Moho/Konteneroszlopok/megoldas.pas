program Raktar;
const
  MaxK=10000;
  MaxN=2000000;
var
  n,k:longint;
  LMRU, Hol:array[1..MaxK] of longint;
  B:array[1..MaxK] of boolean;
  P: array[1..MaxN] of integer;
  BeF,KiF:Text;
  i,x,m,bal,jobb,koz:longint;
begin{prog}
  assign(BeF,'raktar.be');reset(BeF);
  assign(KiF,'raktar.ki');rewrite(KiF);
  readln(BeF,n, k);
  for i:=1 to k do
    B[i]:=false;
  read(BeF,x);
  m:=1;
  B[x]:=true;
  LMRU[1]:=x;
  Hol[x]:=1;
  P[1]:=1;
  for i:=2 to n do begin
//writeln(i,': ',x);
    read(BeF,x);
    if B[x] then begin
      P[i]:=Hol[x];
    end else begin
      if x>LMRU[m] then begin
        inc(m);
        LMRU[m]:=x;
        B[x]:=true;
        Hol[x]:=m;
        P[i]:=m;
      end else begin //bináris keresés
        bal:=1; jobb:=m;
        while (bal<jobb) do begin
          koz:=(bal+jobb) div 2;
          if x<LMRU[koz] then
            jobb:=koz
          else
            bal:=koz+1;
        end{while};
        B[LMRU[bal]]:=false;
        LMRU[bal]:=x;
        Hol[x]:=bal;
        B[x]:=true;
        P[i]:=bal;
      end;
    end;
  end{for i->n};
  writeln(KiF,m);
  for i:=1 to n-1 do
    write(KiF,P[i],' ');
  writeln(KiF,P[n]);
  close(KiF);
end.
