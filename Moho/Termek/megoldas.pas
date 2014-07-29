Program Termek;
Const
  MaxN=200;
  M=500;
Type
  Par=record b,az:integer end;
Var
  N:longint;
  TVeg:Array[1..M] Of integer;
  TV:array[1..M,1..maxN] of Par;
  Bef, KiF:Text;
  i,a,b,x,y,t,tt,tb:integer;
  szep:string;
Begin{Prog}
  assign(BeF,'termek.be'); reset(BeF);
  readln(BeF,N);
  for x:=1 to M do TVeg[x]:=0;
  for x:=1 to M do TV[x,0].b:=0;
  t:=0; 
  for i:=1 to N do begin
    readln(Bef,a,b);
    tt:=0; tb:=0;
    for x:=1 to t do
      if (TV[x,TVeg[x]].b<=a)and(TV[x,TVeg[x]].b>tb) then begin
          tt:=x; tb:=TV[a,TVeg[x]].b; 
      end;  
    if tt=0 then begin 
      inc(t); tt:=t; 
    end;
    inc(TVeg[tt]);
    TV[tt,TVeg[tt]].b:=b;
    TV[tt,TVeg[tt]].az:=i;
  end{for i};
  close(Bef);
  
  assign(KiF,'termek.ki'); rewrite(KiF);
  writeln(KiF,t);
  for x:=1 to t do begin
    szep:='';
    for y:=1 to TVeg[x] do begin
       write(Kif, szep,TV[x,y].az);
       szep:=' ';
    end;
    writeln(Kif);
  end;
  close(KiF);
End.
