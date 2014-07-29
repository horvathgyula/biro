Program hatarido_generalo;
  Procedure gen(teszt: char; n,db: integer);
    var i: integer;
        f: text;
  begin
    assign(f,'hatarido.be'+teszt); rewrite(f);
    writeln(f,n);
    for i:=1 to n do writeln(f,1+random(n),' ',10+random(db));
    close(f);
  end;
begin
  gen('5',100,100);
{  gen('6',2000,100);
  gen('7',5000,100);
  gen('8',5000,1000);
  gen('9',10000,100);
  gen('a',10000,1000);}
end.
