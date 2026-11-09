unit umatriz;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;
const
  MAX_FILS=5000;
  MAX_COLS=5000;
type

  { TMatriz }

  TMatriz=Class
    private
      elem:array[1..MAX_FILS,1..MAX_COLS]of integer;
      fils,cols:integer;
    public
      constructor crear();
      procedure setFils(fil:integer);
      function getFils():integer;
      procedure setCols(col:integer);
      function getCols():integer;
      procedure setElem(fil,col,ele:integer);
      function getElem(fil,col:integer):integer;
      procedure cargar();
      procedure mostrar();           //CTRL+SHIFT+C
      procedure busqSec(ele:integer; var fil,col:integer);
      procedure ord_Inter();
      function sumDP():integer;
      function sumTSD():integer;
      function sumTII():integer;
  end;

implementation

{ TMatriz }

constructor TMatriz.crear;
var
  f,c:integer;
begin
  fils:=0;
  cols:=0;
  for f:=1 to MAX_FILS do
      for c:=1 to MAX_COLS do
          elem[f,c]:=0;
end;

procedure TMatriz.setFils(fil: integer);
begin
   if(fil>=0)AND(fil<=MAX_FILS)then
       fils:=fil
   else
     showMessage('Columna Fuera de Rango . . .');
end;

function TMatriz.getFils: integer;
begin
   result:=fils;
end;

procedure TMatriz.setCols(col: integer);
begin
   if(col>=0)AND(col<=MAX_COLS)then
       cols:=col
   else
     showMessage('Columna Fuera de Rango . . .');
end;

function TMatriz.getCols: integer;
begin
  result:=cols;
end;

procedure TMatriz.setElem(fil, col, ele: integer);
begin
   if(fil>=1)AND(fils=fils)then
       begin
         if(col>=1)AND(col<=cols)then
             elem[fil,col]:=ele
         else
           showMessage('Columna Fuera de Rango . . .');
         end
         else
         showMessage('Fila Fuera de Rango . . .');
end;

function TMatriz.getElem(fil, col: integer): integer;
begin
    if(fil>=1)AND(fil<=fils)then
        begin
          if(col>=1)AND(col<=cols)then
              result:=elem[fil,col]
          else
            result:=-999;
        end
        else
            result:=-999;
end;

procedure TMatriz.cargar;
var
  f,c:integer;
begin
   fils:=StrToInt(InputBox('Matriz','Cantidad de Filas : ','3'));
   cols:=StrToInt(InputBox('Matriz','Cantidad de Columnas : ','3'));
   for f:=1 to fils do
       for c:=1 to cols do
           elem[f,c]:=StrToInt(InputBox('Matriz', 'M [ '+IntToStr(f)+','+IntToStr(c)+' ] = ', '3'));
end;

procedure TMatriz.mostrar;
var
  f,c:integer;
  cad:string;
begin
  cad:='';
  for f:=1 to fils do
      begin
        cad:=cad+ '[ ';
        for c:=1 to cols-1 do
            cad:=cad+IntToStr(elem[f,c])+ #09;
        cad:=cad+IntToStr(elem[f,cols]);
        cad:=cad+ ' ]'+#10#13;
      end;
  showMessage(cad);
end;

procedure TMatriz.busqSec(ele: integer; var fil, col: integer);
var
  i,dim:integer;
  sw:boolean;
begin
  i:=1;
  sw:=false;
  dim:=fils*cols;
  while(i<=dim)AND(NOT sw)do
    begin
      fil:=((i-1) DIV cols)+1;
      col:=((i-1) MOD cols)+1;
      if(ele=elem[fil,col])then
          sw:=true
      else
        i:=i+1;
    end;
  if(sw=false)then
      begin
        fil:=-1;
        col:=-1;
      end;
end;

procedure TMatriz.ord_Inter;
var
  dim,p,d,fp,cp,fd,cd,aux:integer;
begin
  dim:=fils*cols;
  for p:=1 to dim-1 do
      begin
        fp:=((p-1) DIV cols)+1;
        cp:=((p-1) MOD cols)+1;
        fd:=((d-1) DIV cols)+1;
        cd:=((d-1) MOD cols)+1;
        if(elem[fd,cd]<elem[fp,cp])then
            begin
              aux:=elem[fd,cd];
              elem[fd,cd]:=elem[fp,cp];
              elem[fp,cp]:=aux;
            end;
      end;
end;

function TMatriz.sumDP: integer;
var
  sum,f:integer;
begin
   sum:=0;
   for f:=1 to fils do
       sum:=sum+elem[f,f];
   result:=sum;
end;

function TMatriz.sumTSD: integer;
var
  sum,f,c:integer;
begin
  sum:=0;
  for f:=1 to fils-1 do
      for c:=f+1 to cols do
          sum:=sum+elem[f,c];
  result:=sum;
end;

function TMatriz.sumTII: integer;
var
  sum,f,c:integer;
begin
  sum:=0;
  for f:=2 to fils do
      for c:=1 to f-1 do
          sum:=sum+elem[f,c];
  result:=sum;
end;

end.

