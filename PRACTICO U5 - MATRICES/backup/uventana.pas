unit uventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  umatriz, uvector;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button3: TButton;
    Button30: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    FIL: TEdit;
    COL: TEdit;
    ELE: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SG1: TStringGrid;
    SG2: TStringGrid;
    SG3: TStringGrid;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
  M1,M2,M3: TMatriz;
  V: Vector;
  public
  procedure updateSG();
  procedure updateSG(Mat:TMatriz; Grilla:TStringGrid);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin                                 //BOTON CREAR
  M1:=TMatriz.crear();
  M2:=TMatriz.crear();
  M3:=TMatriz.crear();
  updateSG(M1,SG1);
  updateSG(M2,SG2);
  updateSG(M3,SG3);
  V:=Vector.crear();
  showMessage('Matrices Creadas . . .');
end;

procedure TForm1.Button20Click(Sender: TObject);
begin                                //BOTON SUMA COLUMNA
  ELE.Text:=IntToStr(M1.sumaCol(StrToInt(COL.Text)));
end;

procedure TForm1.Button21Click(Sender: TObject);
begin                                //BOTON DE SUMA FILA
  ELE.Text:=IntToStr(M1.sumaFil(StrToInt(FIL.Text)));
end;

procedure TForm1.Button22Click(Sender: TObject);
begin                                //BOTON SUMA BLOQUE
  ELE.Text := IntToStr(M1.sumaBloque);
end;

procedure TForm1.Button23Click(Sender: TObject);
begin                                 //BOTON PROMEDIO MATRIZ
  ELE.Text:=FloatToStr(M1.promMatriz());
end;

procedure TForm1.Button24Click(Sender: TObject);
begin                                 //BOTON PROMEDIO FILA
  ELE.Text:=FloatToStr(M1.promFila(StrToInt(FIL.Text)));
end;

procedure TForm1.Button25Click(Sender: TObject);
begin                                //PROMEDIO COLUMNA
  ELE.Text:=FloatToStr(M1.promColumna(StrToInt(COL.Text)));
end;

procedure TForm1.Button26Click(Sender: TObject);
begin                               //BOTON ELEMENTOS REPETIDOS
  ELE.Text:=M1.repetidos();
end;

procedure TForm1.Button27Click(Sender: TObject);
var
  filS,colS:integer;
begin                               //BOTON VECTOR == > MATRIZ
  V.cargar();
  showMessage('La cantidad de elmentos debe ser igual al rango de una matriz cuadrada');
  filS:=StrToInt(InputBox('Matriz','Cantidad de filas :',''));
  colS:=StrToInt(InputBox('Matriz','Cantidad de columnas :',''));
  M1.Vector(V,filS,colS);
  updateSG(M1,SG1);
end;

procedure TForm1.Button28Click(Sender: TObject);
begin                                //ELEMENTO MODA TSI
  ELE.Text:=IntToStr(M1.modaTSI())
end;

procedure TForm1.Button29Click(Sender: TObject);
begin                                //ELEMENTO MODA TID
  ELE.Text:=IntToStr(M1.modaTID());
end;

procedure TForm1.Button10Click(Sender: TObject);
begin                                //BOTON SALIR
   Close;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin                                //BOTON SUMA MATRICES
  M3.sumaMatrices(M1,M2);
  updateSG(M3,SG3);
end;

procedure TForm1.Button12Click(Sender: TObject);
begin                                //BOTON LIMPIAR
  FIL.Clear;
  COL.Clear;
  ELE.Clear;
  SG1.Clear;
  SG2.Clear;
  SG3.Clear;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin                               //MULTIPLICAR MATRICES
  M3.multiMatriz(M1,M2);
  updateSG(M3,SG3);
end;

procedure TForm1.Button14Click(Sender: TObject);
begin                              //BOTON PROMEDIO TSI
  ELE.Text:=FloatToStr(M1.promedioTSI());
end;

procedure TForm1.Button15Click(Sender: TObject);
begin                              //BOTON PROMEDIO TSD
  ELE.Text:=FloatToStr(M1.promedioTSD());
end;

procedure TForm1.Button16Click(Sender: TObject);
begin                              //BOTON PROMEDIO TII
  ELE.Text:=FloatToStr(M1.promedioTII());
end;

procedure TForm1.Button17Click(Sender: TObject);
begin                               //BOTON PROMEDIO TID
  ELE.Text:=FloatToStr(M1.promedioTID());
end;

procedure TForm1.Button18Click(Sender: TObject);
begin                               //BOTON PROMEDIO DP
  ELE.Text:=FloatToStr(M1.promedioDP());
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
   ELE.Text:=FloatToStr(M1.promedioDS());
end;

procedure TForm1.Button2Click(Sender: TObject);
begin                               //BOTON SET_FILS
   M1.setFils(StrToInt(FIL.Text));
   updateSG();
   FIL.Text:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin                              //BOTON GET_FILS
   FIL.Text:=IntToStr(M1.getFils());
end;

procedure TForm1.Button4Click(Sender: TObject);
begin                              //BOTON SET_COLS
  M1.setCols(StrToInt(COL.Text));
  updateSG();
  COL.Text:='';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin                              //BOTON GET_COLS
  COL.Text:=IntTOStr(M1.getCols());
end;

procedure TForm1.Button6Click(Sender: TObject);
begin                              //BOTON SET_ELEM
  M1.setElem(StrToInt(FIL.Text),StrToInt(COL.Text),StrToInt(ELE.Text));
  updateSG();
  FIL.Text:='';
  COL.Text:='';
  ELE.Text:='';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin                               //BOTON GET_ELEM
  ELE.Text:=IntToStr(M1.getElem(StrToInt(FIL.Text),StrToInt(COL.Text)));
  FIL.Text:='';
  COL.Text:='';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin                               //BOTON CARGAR MATRIZ B
  M2.cargar();
  updateSG(M2,SG2);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin                               //BOTON CARGAR MATRIZ A
  M1.cargar();
  updateSG(M1,SG1);
end;

procedure TForm1.updateSG(Mat: TMatriz; Grilla: TStringGrid);
var                                 //UPDATE DE LAS 3 MATRICES
  f,c:integer;
begin
   Grilla.RowCount:=Mat.getFils();
  Grilla.ColCount:=Mat.getCols();
  if Grilla.RowCount<1 then
    Grilla.RowCount:=1;
  if Grilla.ColCount<1 then
    Grilla.ColCount:=1;
  for f:=1 to Mat.getFils() do
    for c:=1 to Mat.getCols() do
      Grilla.Cells[c-1,f-1]:=IntToStr(Mat.getElem(f,c));
end;

procedure TForm1.updateSG;
var
  f,c:integer;
begin
  SG1.RowCount:=M1.getFils();
  SG1.ColCount:=M1.getcols();
  for f:=1 to M1.getFils() do
  for C:=1 to M1.getCols() do
  SG1.Cells[c-1,f-1]:=IntToStr(M1.getElem(f,c));
end;

end.

