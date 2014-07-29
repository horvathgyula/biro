var X,Y : array[1..10000] of word;
    I : array[1..10000] of word;
    v,w : word;
    f,g : text;
    N : word;
    kov:word;
    max, ind : word;
    db :word;

function kellmeg : boolean;
var poz:word;
begin
 poz:=kov;
 while (I[poz]>1) and (poz<N+1) do inc(poz);
 if poz=N+1 then kellmeg:=false
 else begin
  kov:=poz;
  kellmeg:=true;
 end;
end;

procedure QS(p,r:word);
var ert,i,j,tar,q : word;
begin
 if p<r then begin
  ert:=Y[p];
  i:=p-1;
  j:=r+1;
  while true do begin
   repeat inc(i) until Y[i]>=ert;
   repeat dec(j) until Y[j]<=ert;
   if i<j
    then begin
     tar:=Y[i];
     Y[i]:=Y[j];
     Y[j]:=tar;
     tar:=X[i];
     X[i]:=X[j];
     X[j]:=tar;
    end
    else begin
     q:=j;
     Break;
    end;
   end;
  QS(p,q);
  QS(q+1,r);
 end;
end;

begin
 kov:=1;
 FillChar(I,sizeof(I),0);
 Assign(f,'inter.be');
 Reset(f);
 Readln(f,N);
 for w:=1 to N do Readln(f,X[w],Y[w]);
 Close(f);

 QS(1,N);

 db:=0;
 while kellmeg do
  begin
   max:=0;
   ind:=kov;
   for v:=1 to N do
    if ((X[v]<=Y[kov]) and (Y[v]>=Y[kov]))
     then if Y[v]-Y[kov]>max then
      begin
       max:=Y[v]-X[v];
       ind:=v;
      end;
   for v:=1 to N do
    if ((X[v]>=X[ind]) and (X[v]<=Y[ind])) or ((Y[v]>=X[ind]) and (Y[v]<=Y[ind]))
     then I[v]:=2;
   I[ind]:=3;
   inc(db);
  end;

 Assign(g,'inter.ki');
 Rewrite(g);
 Writeln(g,db);
 for v:=1 to N do if I[v]=3 then Writeln(g,X[v],' ',Y[v]);
 Close(g);
end.