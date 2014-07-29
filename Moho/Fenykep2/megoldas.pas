Program Fenykep;
const
  MaxN=200000;                    { az intervallumok max. száma  }
  MaxT=20000;
var
  N,T,D    :longint;              { az intervallumok száma }
  Int  :array[1..MaxT] of longint;{ az intervallumok: [Int[t],t), ha Int[t]>0 }
  K:longint;                      { a megoldás elemszáma}
  M:array[0..2*MaxT] of longint;  { a megoldás halmaz}
  ii,x,Elso,Utolso,hany:longint;

Procedure Beolvas;
{Global:N, T,D, Int}
  var
    Bef:Text;
    i,e,u:longint;
  begin
    for i:=1 to MaxT do Int[i]:=0;
    Assign(Bef,'fenykep.be'); Reset(Bef);
    ReadLn(Bef,N,T,D);
    for i:=1 to N do begin
      ReadLn(Bef,e,u);
      if e>Int[u] then Int[u]:=e;
    end;
    Close(Bef);
  end{Beolvas};

Procedure KiIr;
{Global: k, M }
  var
    Kif:Text;
    i,ii:longint;
  begin
    Assign(KiF,'fenykep.ki'); Rewrite(KiF);
    WriteLn(Kif,K);
    ii:=1;
    for i:=1 to K do begin
		repeat
			Write(Kif,' ',M[ii]);
			inc(ii);
		until M[ii]=0;
		WriteLn(Kif);
		inc(ii);
	end;
    Close(KiF);
  end{KiIr};

begin{Program}
  Beolvas;
  Utolso:=0;{az utolsó fényképezési idõpont}
  Elso:=1;	{az alkalom elsõ f. idõpontja}
  K:=0;     {a megoldás elemszáma}
  hany:=D;
  ii:=0;
  for x:=1 to MaxT do
    if (Int[x]>0) and (Utolso<Int[x]) then begin
		if hany=D then begin
			inc(K);
			M[ii]:=0;
			inc(ii);
			M[ii]:=x-1;
			Elso:=x-1; Utolso:=x-1;
			hany:=1;
			inc(ii);
		end else begin
			if (x<=Elso+T) then begin
				Utolso:=x-1;
				M[ii]:=Utolso;
				inc(ii);
				inc(hany);
			end else begin
				if Int[x]<Elso+T then begin
					Utolso:=Elso+T-1;
					M[ii]:=Utolso;
					inc(ii);
					inc(hany);
				end else begin
					M[ii]:=0;
					inc(ii);
					inc(K);
					Utolso:=x-1;
					M[ii]:=Utolso;
					Elso:=Utolso;
					hany:=1;
					inc(ii);
				end;		
			end;
		end;
		writeln(Elso,' ',Utolso);
    end;
    M[ii]:=0;
  {for i};

  KiIr;
end.


