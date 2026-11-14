unit umatriz;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs, uvector;
const
  MAX_FILS=100;
  MAX_COLS=100;
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
      procedure sumaMatrices(A,B:TMatriz);
      procedure multiMatriz(A,B:TMatriz);
      function promedioTSI():real;
      function promedioTSD():real;
      function promedioTII():real;
      function promedioTID():real;
      function promedioDP():real;
      function promedioDS():real;
      function sumaCol(col:integer):integer;
      function sumaFil(fil:integer):integer;
      function sumaBloque():integer;
      function promMatriz():real;
      function promFila(fil:integer):real;
      function promColumna(col:integer):real;
      function repetidos():string;
      procedure Vector(V:Vector; fil,col:integer);
      function modaTSI():integer;
      function modaTID():integer;
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
   fils:=StrToInt(InputBox('Matriz','Cantidad de Filas : ', ''));
   cols:=StrToInt(InputBox('Matriz','Cantidad de Columnas : ', ''));
   for f:=1 to fils do
       for c:=1 to cols do
           elem[f,c]:=StrToInt(InputBox('Matriz', 'M [ '+IntToStr(f)+','+IntToStr(c)+' ] = ', ''));
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

procedure TMatriz.sumaMatrices(A, B: TMatriz);
var
  f,c:integer;
begin
  if (A.fils=B.fils) AND (A.cols=B.cols) then
  begin
    fils:=A.fils;
    cols:=A.cols;
    for f:=1 to fils do
      for c:=1 to cols do
        elem[f,c]:=A.elem[f,c]+B.elem[f,c];
  end
  else
    showMessage('Las matrices deben tener las mismas dimensiones');
end;

procedure TMatriz.multiMatriz(A, B: TMatriz);
var
  f,c,k:integer;
  suma:integer;
begin
  if A.cols=B.fils then
  begin
    fils:=A.fils;
    cols:=B.cols;
    for f:=1 to fils do
      for c:=1 to cols do
      begin
        suma:=0;
        for k:=1 to A.cols do
          suma:=suma+A.elem[f,k]*B.elem[k,c];
        elem[f,c]:=suma;
      end;
  end
  else
    showMessage('Las columnas de A deben ser iguales a las filas de B');
end;

function TMatriz.promedioTSI: real;
var
  f,c,cant,sum:integer;
begin
  sum:=0;
  cant:=0;
  for f:=1 to fils do
    for c:=1 to cols do
      if f+c<fils+1 then
      begin
        sum:=sum+elem[f,c];
        cant:=cant+1;
      end;
  if cant>0 then
    result:=sum/cant
  else
    result:=0;
end;

function TMatriz.promedioTSD: real;
var
  f,c,cant,sum:integer;
begin
  sum:=0;
  cant:=0;
  for f:=1 to fils do
    for c:=1 to cols do
      if c>f then
      begin
        sum:=sum+elem[f,c];
        cant:=cant+1;
      end;
  if cant>0 then
    result:=sum/cant
  else
    result:=0;
end;

function TMatriz.promedioTII: real;
var
  f,c,cant,sum:integer;
begin
  sum:=0;
  cant:=0;
  for f:=1 to fils do
    for c:=1 to cols do
      if f>c then
      begin
        sum:=sum+elem[f,c];
        cant:=cant+1;
      end;
  if cant>0 then
    result:=sum/cant
  else
    result:=0;
end;

function TMatriz.promedioTID: real;
var
  f,c,cant,sum:integer;
begin
  sum:=0;
  cant:=0;
  for f:=1 to fils do
    for c:=1 to cols do
      if f+c>fils+1 then
      begin
        sum:=sum+elem[f,c];
        cant:=cant+1;
      end;
  if cant>0 then
    result:=sum/cant
  else
    result:=0;
end;

function TMatriz.promedioDP: real;
var
  f,sum:integer;
begin
  sum:=0;
  for f:=1 to fils do
    sum:=sum+elem[f,f];
  if fils>0 then
    result:=sum/fils
  else
    result:=0;
end;

function TMatriz.promedioDS: real;
var
  f,c,sum:integer;
begin
  sum:=0;
  c:=cols;
  for f:=1 to fils do
  begin
    sum:=sum+elem[f,c];
    c:=c-1;
  end;
  if fils>0 then
    result:=sum/fils
  else
    result:=0;
end;

function TMatriz.sumaCol(col: integer): integer;
var
  f,sum:integer;
begin
   sum:=0;
  if (col>=1) AND (col<=cols) then
  begin
    for f:=1 to fils do
      sum:=sum+elem[f,col];
  end
  else
    showMessage('Columna Fuera de Rango . . .');
  result:=sum;
end;

function TMatriz.sumaFil(fil: integer): integer;
var
  c,sum:integer;
begin
  sum:=0;
  if (fil>=1) AND (fil<=fils) then
  begin
    for c:=1 to cols do
      sum:=sum+elem[fil,c];
  end
  else
    showMessage('Fila Fuera de Rango . . .');
  result:=sum;
end;

function TMatriz.sumaBloque: integer;
var
  fi,ci,ff,cf,f,c,sum:integer;
begin
  fi:=StrToInt(InputBox('Bloque','Fila inicial :',''));
  ci:=StrToInt(InputBox('Bloque','Columna inicial :',''));
  ff:=StrToInt(InputBox('Bloque','Fila final :',''));
  cf:=StrToInt(InputBox('Bloque','Columna final :',''));
  sum:=0;
  if (fi>=1) AND (fi<=ff) AND (ff<=fils) AND
     (ci>=1) AND (ci<=cf) AND (cf<=cols) then
  begin
    for f:=fi to ff do
      for c:=ci to cf do
        sum:=sum+elem[f,c];
  end
  else
    showMessage('Limites del Bloque Fuera de Rango . . . .');
  result:=sum;
end;

function TMatriz.promMatriz: real;
var
  f,c,sum:integer;
begin
  sum:=0;
  for f:=1 to fils do
    for c:=1 to cols do
      sum:=sum+elem[f,c];
  if (fils*cols)>0 then
    result:=sum/(fils*cols)
  else
    result:=0;
end;

function TMatriz.promFila(fil: integer): real;
begin
   if (fil>=1) AND (fil<=fils) then
    result:=sumaFil(fil)/cols
  else
    result:=0;
end;

function TMatriz.promColumna(col: integer): real;
begin
   if (col>=1) AND (col<=cols) then
    result:=sumaCol(col)/fils
  else
    result:=0;
end;

function TMatriz.repetidos: string;
var
  f,c,i,j,veces:integer;
  resultado:string;
  sw:boolean;
begin
  resultado:='';
  for f:=1 to fils do
    for c:=1 to cols do
    begin
      veces:=0;
      sw:=false;
      for i:=1 to fils do
        for j:=1 to cols do
        begin
          if elem[f,c]=elem[i,j] then
            veces:=veces+1;
          if (i<f) OR ((i=f) AND (j<c)) then
            if elem[f,c]=elem[i,j] then
              sw:=true;
        end;
      if (veces>1) AND (not sw) then
      begin
        if resultado<>'' then
          resultado:=resultado+', ';
        resultado:=resultado+IntToStr(elem[f,c]);
      end;
    end;
  if resultado='' then
    resultado:='No hay elementos repetidos . . .';
  result:=resultado;
end;

procedure TMatriz.Vector(V: Vector; fil, col: integer);
var
  f,c,pos:integer;
begin
  if (fil*col=V.getDim()) AND
     (fil>=1) AND (col>=1) AND
     (fil<=MAX_FILS) AND (col<=MAX_COLS) then
  begin
    fils:=fil;
    cols:=col;
    pos:=1;
    for f:=1 to fils do
      for c:=1 to cols do
      begin
        elem[f,c]:=V.getElem(pos);
        pos:=pos+1;
      end;
  end
  else
    showMessage('Dimensiones Fuera de Rango . . .');
end;

function TMatriz.modaTSI: integer;
var
  f,c,i,j,veces,mayor:integer;
begin
   result:=-999;
  mayor:=0;
  for f:=1 to fils do
    for c:=1 to cols do
      if f+c<fils+1 then
      begin
        veces:=0;
        for i:=1 to fils do
          for j:=1 to cols do
            if (i+j<fils+1) AND (elem[i,j]=elem[f,c]) then
              veces:=veces+1;
        if veces>mayor then
        begin
          mayor:=veces;
          result:=elem[f,c];
        end;
      end;
end;

function TMatriz.modaTID: integer;
var
  f,c,i,j,veces,mayor:integer;
begin
  result:=-999;
  mayor:=0;
  for f:=1 to fils do
    for c:=1 to cols do
      if f+c>fils+1 then
      begin
        veces:=0;
        for i:=1 to fils do
          for j:=1 to cols do
            if (i+j>fils+1) AND (elem[i,j]=elem[f,c]) then
              veces:=veces+1;
        if veces>mayor then
        begin
          mayor:=veces;
          result:=elem[f,c];
        end;
      end;
end;

end.

