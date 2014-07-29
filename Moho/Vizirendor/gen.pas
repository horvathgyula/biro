Program vizi_generalo;
  Procedure gen(c: char;n: integer;k: integer);
    var i,j: integer;
        f: text;
    const a=20; b=10;
  begin
    assign(f,'vizi.be'+c); rewrite(f);
    writeln(f,n,' ',a,' ',b,' ',k);
    j:=0;
    for i:=1 to n do
    begin
      j:=j+random(10)+1; writeln(f,j);
    end;
    close(f);
  end;
begin
  gen('6',100,1);
  gen('7',500,2);
  gen('8',1000,3);
end.
