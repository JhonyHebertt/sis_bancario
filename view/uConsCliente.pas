unit uConsCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, dmConexao, uCadCliente, uClienteController;

type
  TFConsCliente = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnPesquisar: TBitBtn;
    Panel2: TPanel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    edtPesquisa: TEdit;
    Label1: TLabel;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsCliente: TFConsCliente;

implementation

{$R *.dfm}

procedure TFConsCliente.btnAlterarClick(Sender: TObject);
begin
  if dmconexao.dmGeral.qCliente.IsEmpty then
    exit;

  uCadCliente.FCadCliente.EdtID.Text:= DBGrid1.DataSource.DataSet.FieldByName('ID_CLIENTE').AsString;
  uCadCliente.Tipo_Operacao:= 'A';

  FCadCliente.ShowModal;
  btnPesquisarClick(Nil);
end;

procedure TFConsCliente.btnExcluirClick(Sender: TObject);
var
 oClienteController : TClienteController;
 sErro: string;
begin
  if dmconexao.dmGeral.qCliente.IsEmpty then
    exit;
   oClienteController := TClienteController.Create;
   if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = IDNO then
    Abort;
   if oClienteController.ExcluirCliente(DBGrid1.DataSource.DataSet.FieldByName('ID_CLIENTE').AsInteger,sErro) = False then
     raise Exception.Create(sErro);

   FreeAndNil(oClienteController);

   btnPesquisarClick(Nil);
end;

procedure TFConsCliente.btnNovoClick(Sender: TObject);
begin
  edtPesquisa.Clear;
  uCadCliente.Tipo_Operacao:= 'I';
  FCadCliente.ShowModal;

  btnPesquisarClick(Nil);
end;

procedure TFConsCliente.btnPesquisarClick(Sender: TObject);
var
 oClienteController : TClienteController;
 sErro: string;
begin

    oClienteController := TClienteController.Create;
    try
       oClienteController.Pesquisar(edtPesquisa.Text);
    finally
      FreeAndNil(oClienteController);
    end;
end;

procedure TFConsCliente.btnSairClick(Sender: TObject);
begin
  dmconexao.dmGeral.qCliente.Close;
  edtPesquisa.Clear;
  Close;
end;

end.