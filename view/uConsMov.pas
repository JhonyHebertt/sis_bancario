unit uConsMov;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, dmConexao, uCadMovimento, uMovimentoController;

type
  TfConsMov = class(TForm)
    Panel1: TPanel;
    btnPesquisar: TBitBtn;
    Panel2: TPanel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    Label2: TLabel;
    edtCliente: TEdit;
    DBGrid1: TDBGrid;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsMov: TfConsMov;

implementation

{$R *.dfm}

procedure TfConsMov.btnAlterarClick(Sender: TObject);
begin
  if dmconexao.dmGeral.qMovimento.IsEmpty then
    exit;

  uCadMovimento.fCadMovimento.EdtID.Text:= DBGrid1.DataSource.DataSet.FieldByName('ID_MOVIMENTO').AsString;
  uCadMovimento.Tipo_Operacao:= 'A';

  fCadMovimento.ShowModal;
  btnPesquisarClick(Nil);
end;

procedure TfConsMov.btnExcluirClick(Sender: TObject);
var
 oContaController : TMovimentoController;
 sErro: string;
begin
  if dmconexao.dmGeral.qConta.IsEmpty then
    exit;

   oContaController := TMovimentoController.Create;

   if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = IDNO then
    Abort;
   if oContaController.ExcluirMovimento(DBGrid1.DataSource.DataSet.FieldByName('ID_MOVIMENTO').AsInteger,sErro) = False then
     raise Exception.Create(sErro);

   FreeAndNil(oContaController);

   btnPesquisarClick(Nil);

end;

procedure TfConsMov.btnNovoClick(Sender: TObject);
begin
  edtCliente.Clear;
  uCadMovimento.Tipo_Operacao:= 'I';
  FCadMovimento.ShowModal;

  btnPesquisarClick(Nil);
end;

procedure TfConsMov.btnPesquisarClick(Sender: TObject);
var
 oMovimentoController : TMovimentoController;
 sErro: string;
begin

    oMovimentoController := TMovimentoController.Create;
    try
       oMovimentoController.Pesquisar(edtCliente.Text);
    finally
      FreeAndNil(oMovimentoController);
    end;

end;

procedure TfConsMov.btnSairClick(Sender: TObject);
begin
  dmconexao.dmGeral.qMovimento.Close;
  edtCliente.Clear;
  Close;
end;

end.
