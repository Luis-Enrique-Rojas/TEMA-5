unit uventana;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
const
  MAX_FILS=150;
  MAX_COLS=20;
type

  { TNotas }

  TNotas = class
    private
      elem:array[1..MAX_FILS,1..MAX_COLS]of integer;
      fils,cols: integer;
    public
      procedure cargar();
      procedure mostrar();
      procedure calcularNF();
      function promedio():integer;
      procedure mejorNF();
      procedure aprobados();
      procedure reprobados();
      PROCEDURE excelentes();
  end;

implementation

{ TNotas }

procedure TNotas.cargar();
var
  f,c:integer;
begin
  write('Cuantos Estudiantes: ');
  readln(fils);
  write('Cuantos Parciales: ');
  readln(cols);
  for f:=1 to fils do
  begin
    writeln('Estudiante No, ',f);
    for c:=1 to cols do
    begin
      write('Parcial [',f,',',c,']= ');
      readln(elem[f,c]);
    end;
  end;
end;

procedure TNotas.mostrar();
var
  f,c:integer;
begin
  writeln('Los Notas del Curso son : ');
  for f:=1 to fils do
  begin
    write('[');
    for c:=1 to cols do
       write(elem[f,c],#09#09);
       writeln(elem[f,c+1], ']');
  end;
end;

procedure TNotas.calcularNF();
var
  f,P1,P2,P3:integer;
begin
  for f:=1 to fils do
  begin
    P1:= (elem[f,1]*40)div 100;    //Nota [ f , 1 ]*0,40
    P2:= (elem[f,2]*30) div 100;   //Nota [ f , 2 ]*0,30
    P3:= (elem[f,3]*30) div 100;   //Nota [ f , 3 ]*0,30
    elem[ f, cols+1 ] := P1+P2+P3;
  end;
  writeln('Las Notas Finales son : ');
  for f:=1 to fils do
     writeln(f, '.- ',#09#09, elem[f, cols+1]);
end;

function TNotas.promedio(): integer;
var
  sum,f:integer;
begin
  sum:=0;
  for f:=1 to fils do
  begin
     sum:=sum+elem[f,cols+1];
  end;
  result:= sum div fils;
end;

procedure TNotas.mejorNF();
var
  may,f,posf:integer;
begin
   may:=elem[ 1, cols+1 ];
   for f:=2 to fils do
   begin
      if(elem[ f, cols+1] > may) then
               begin
               may:=elem[ f , cols+1 ];
               posf:=f;
               end;
   end;
   writeln('La Mejor Nota es : ', may, ' del estudiante ', posf);
end;

procedure TNotas.aprobados();
var
  f:integer;
begin
  writeln('Los Aprobados son : ');
  for f:=1 to fils do
  begin
    if(elem[f,cols+1]>=51) then
             writeln(f,'.-',#09#09, 'Aprobado => ', elem[f,cols+1]);
   end;
end;

procedure TNotas.reprobados();
var
  f:integer;
begin
  writeln('Los Reprobados son : ');
  for f:=1 to fils do
  begin
    if(elem[f,cols+1]<51) then
             writeln(f,'.-',#09#09, 'Reprobado => ', elem[f,cols+1]);
   end;
end;

procedure TNotas.excelentes();
var
  f:integer;
begin
  writeln('Los Excelentes son : ');
  for f:=1 to fils do
  begin
    if(elem[f,cols+1]>=90)AND(elem[f,cols+1]<=100) then
             writeln(f,'.-',#09#09, 'Excelente => ', elem[f,cols+1]);
   end;
end;

end.

