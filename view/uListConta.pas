unit uListConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, dmConexao;

type
  TfListConta = class(TForm)
    Panel2: TPanel;
    btnSelecionar: TBitBtn;
    btnSair: TBitBtn;
    DBGrid1: TDBGrid;
    procedure btnSairClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fListConta: TfListConta;
   edtIDConta: string;
   EdtConta:   string;
   EdtCliente: String;

implementation

{$R *.dfm}

procedure TfListConta.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfListConta.btnSelecionarClick(Sender: TObject);
begin
  edtIDConta:= DBGrid1.DataSource.DataSet.FieldByName('ID_CONTA').AsString;
  EdtConta  := DBGrid1.DataSource.DataSet.FieldByName('CONTA')   .AsString;
  EdtCliente:= DBGrid1.DataSource.DataSet.FieldByName('NOME')    .AsString;

  close;
end;

end.
