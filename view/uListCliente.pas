unit uListCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, dmConexao;

type
  TfListCliente = class(TForm)
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnSelecionar: TBitBtn;
    btnSair: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fListCliente: TfListCliente;
   edtIDCliente: string;
   EdtCliente: string;

implementation

{$R *.dfm}

procedure TfListCliente.btnSelecionarClick(Sender: TObject);
begin
  edtIDCliente:= DBGrid1.DataSource.DataSet.FieldByName('ID_CLIENTE').AsString;
  EdtCliente  := DBGrid1.DataSource.DataSet.FieldByName('NOME')      .AsString;

  close;
end;

procedure TfListCliente.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
