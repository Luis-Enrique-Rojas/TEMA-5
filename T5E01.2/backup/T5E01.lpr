program T5E01;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, uventana
  { you can add units after this };
var
  M:TNotas;
begin
  M:=TNotas.create();//inicializar objeto
  M.cargar();
  M.mostrar();
  M.ca.cularNF();
  writeln('El promedio del curso es ',M.promedio());
  M.mejorNF();
  M.aprobados();
  M.excelentes();
  M.reprobados();
  readln();
end.

