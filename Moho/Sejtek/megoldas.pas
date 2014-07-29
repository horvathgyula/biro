Program SEjtek;
Const
  MaxN=50000;
  maxM=30000;
Type
  Lista=^Cell;
  Cell=Record x:integer; csat:Lista End;
  Par=record a,b:integer end;
Var
  N,M,K:longint;
  Kezd,Veg:Array[1..MaxN] Of Lista;
  KiF:Text;
  p0,q0:integer;
procedure Beolvas;
var BeF:Text;
  Guv,Gvu:Lista;
  u,v,i:longint;
begin
  assign(BeF,'sejtek.be'); reset(BeF);
  readln(BeF,K,M,N);
  For u:=1 To M Do Begin
    Kezd[u]:=Nil;
    Veg[u]:=nil;
  End;

  For i:=1 To N Do Begin
    ReadLn(BeF, u,v);
    New(Guv);
    Guv^.x:=v; Guv^.csat:=Veg[u];
    Veg[u]:=Guv;

    New(Gvu);
    Gvu^.x:=u; Gvu^.csat:=Kezd[v];
    Kezd[v]:=Gvu;
  End{for i};
  close(BeF);
end{Beolvas};
var
  jo,a,b,ma,mb:integer;
  p:Lista;
Begin{Prog}
  Beolvas;
  jo:=0; ma:=0; mb:=M;
  a:=1; b:=0;
  while a<=M do begin
      while (b<m)and(jo<K) do begin
         inc(b);
         p:=Kezd[b];
         while (p<>nil) do begin
           if a<=p^.x then inc(jo);
           p:=p^.csat;
         end;
      end;
      if (jo>=K)and(b-a<mb-ma) then begin
        ma:=a; mb:=b;
      end;
      if b>M then break;
      p:=Veg[a];
      while p<>nil do begin
        if p^.x<=b then dec(jo);
        p:=p^.csat;
      end;
      inc(a);
  end;
  
  assign(KiF,'sejtek.ki'); rewrite(KiF);
  writeln(KiF,ma,' ',mb);
  close(KiF);
End.
