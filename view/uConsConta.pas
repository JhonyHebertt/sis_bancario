unit uConsConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids , dmConexao, uContaController, uCadConta, uFuncoes;

type
  TfConsConta = class(TForm)
    Panel1: TPanel;
    edtPesquisa: TEdit;
    btnPesquisar: TBitBtn;
    dbgConta: TDBGrid;
    Panel2: TPanel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    Label1: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsConta: TfConsConta;

implementation

{$R *.dfm}

procedure TfConsConta.btnAlterarClick(Sender: TObject);
begin
  if dmconexao.dmGeral.qConta.IsEmpty then
    exit;

  uCadConta.FCadConta.EdtID.Text:= dbgConta.DataSource.DataSet.FieldByName('ID_CONTA').AsString;
  uCadConta.Tipo_Operacao:= 'A';

  FCadConta.ShowModal;
  btnPesquisarClick(Nil);
end;

procedure TfConsConta.btnExcluirClick(Sender: TObject);
var
 oContaController : TContaController;
 sErro: string;
begin
  if dmconexao.dmGeral.qConta.IsEmpty then
    exit;

   oContaController := TContaController.Create;

   if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = IDNO then
    Abort;
   if oContaController.ExcluirConta(dbgConta.DataSource.DataSet.FieldByName('ID_CONTA').AsInteger,sErro) = False then
     raise Exception.Create(sErro);

   FreeAndNil(oContaController);

   btnPesquisarClick(Nil);
end;

procedure TfConsConta.btnNovoClick(Sender: TObject);
begin
  edtPesquisa.Clear;
  uCadConta.Tipo_Operacao:= 'I';
  FCadConta.ShowModal;

  btnPesquisarClick(Nil);
end;

procedure TfConsConta.btnPesquisarClick(Sender: TObject);
var
 oContaController : TContaController;
 oFuncoes : TFuncoes;
 sErro: string;
 Filtro: string;
begin

    oContaController := TContaController.Create;
    try
       if edtPesquisa.Text <> '' then
       begin
        oFuncoes := TFuncoes.Create;
        edtPesquisa.Text := oFuncoes.RemoveSpecialChars(edtPesquisa.Text);
        edtPesquisa.Text := oFuncoes.RemoveAccents(edtPesquisa.Text);
        filtro:= 'where nome_cliente like ' + QuotedStr('%' + edtPesquisa.Text + '%');
       end;
       oContaController.Pesquisar(filtro, dmGeral.qConta, dmGeral.dsConta, dbgConta);
    finally
      FreeAndNil(oContaController);
    end;
end;

procedure TfConsConta.btnSairClick(Sender: TObject);
begin
  dmconexao.dmGeral.qConta.Close;
  edtPesquisa.Clear;
  Close;
end;

end.
