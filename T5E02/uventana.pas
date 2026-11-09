unit uventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids, umatriz;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    FIL:Tedit;
    COL: TEdit;
    ELE: TEdit;
    Label1:Tlabel;
    SG: TStringGrid;
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
     M: TMatriz;
  public
    procedure updateSG();
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.updateSG();
var
  f,c:integer;
begin
  SG.RowCount:=M.getFils();
  SG.ColCount:=M.getcols();
  for f:=1 to M.getFils() do
  for C:=1 to M.getCols() do
  SG.Cells[c-1,f-1]:=IntToStr(M.getElem(f,c));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin                                      //BOTON CREAR
  M:=TMatriz.Crear();
  updateSG();
  showMessage('Matriz Creada . . .');
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin                                      //BOTON SET_FILS
  M.setFils(StrToInt(FIL.Text));
  updateSG();
  FIL.Text:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin                                     //BOTON SET_COLS
  M.setCols(StrToInt(COL.Text));
  updateSG();
  COL.Text:='';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin                                     //BOTON SET_ELEM
  M.setElem(StrToInt(FIL.Text),StrToInt(COL.Text),StrToInt(ELE.Text));
  updateSG();
  FIL.Text:='';
  COL.Text:='';
  ELE.Text:='';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin                                     //BOTON CARGAR
  M.cargar();
  updateSG();
end;

procedure TForm1.Button6Click(Sender: TObject);
begin                                     //BOTON GET_FILS
  FIL.Text:=IntToStr(M.getFils());
end;

procedure TForm1.Button7Click(Sender: TObject);
begin                                     //BOTON GET_COLS
  COL.Text:=IntTOStr(M.getCols());
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  ELE.Text:=IntToStr(M.getElem(StrToInt(FIL.Text),StrToInt(COL.Text)));
  FIL.Text:='';
  COL.Text:='';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin                                    //BOTON MOSTRAR
  M.mostrar();
end;

end.

