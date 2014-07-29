Program pakol;
{négyzetes (O(K*N)) futási idejû megoldás, lineáris memóriával}
const
  maxn=10000;
//  maxk=100;
var
  N: longint;
  KiF:  text;
  BeF:Text;
  A,F,Kov,Poz: array[0..maxn] of longint;
  Mozg:array[1..Maxn] of record tol, ra:longint end;
Procedure Beolvas;
  var
    i,x:longint;
begin
  for i:=1 to N do begin
    read(BeF, x);
    A[i]:=x; F[i]:=x;
    Kov[i]:=i+1;
    Poz[i]:=i;
  end;
  Kov[n]:=0;
end;
var
  i,ii,m:longint;
  volt:boolean;
begin{prog}
  assign(BeF,'pakol.be'); reset(beF);
  readln(Bef,N);
  assign(KiF,'pakol.ki'); rewrite(Kif);

//  for i:=1 to K do begin
    Beolvas;
    m:=0;
    while (m<n-1) do begin
      volt:=false;
      i:=1; ii:=Kov[1];
      while ii>0 do begin
        if (A[i]+1=F[ii]) then begin
          volt:=true;
          inc(m);
          Mozg[m].tol:=Poz[i];
          Mozg[m].ra:=Poz[ii];
          Poz[i]:=Poz[ii];
          A[i]:=A[ii];
          Kov[i]:=Kov[ii];
        end else if (F[i]+1=A[ii]) then begin
          volt:=true;
          inc(m);
          Mozg[m].tol:=Poz[ii];
          Mozg[m].ra:=Poz[i];
          F[i]:=F[ii];
          Kov[i]:=Kov[ii];
        end;
        i:=Kov[i]; ii:=Kov[i];
      end{while ii};
      if not volt then begin
        writeln(Kif,'0 0');
        break;
      end;
    end{while};
//    writeln(Kif,'IGEN');
    for ii:=1 to m do
      writeln(Kif,Mozg[ii].tol,' ',Mozg[ii].ra);
//  end{for};
  close(bef);
  close(Kif);
end.
