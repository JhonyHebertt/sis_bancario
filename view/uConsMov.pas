unit uConsMov;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, dmConexao, uCadMovimento, uMovimentoController, uFuncoes;

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
    dbgMovi: TDBGrid;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbgMoviDblClick(Sender: TObject);
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

  uCadMovimento.fCadMovimento.EdtID.Text:= dbgMovi.DataSource.DataSet.FieldByName('ID_MOVIMENTO').AsString;
  uCadMovimento.Tipo_Operacao:= 'A';

  fCadMovimento.ShowModal;
  btnPesquisarClick(Nil);
end;

procedure TfConsMov.btnExcluirClick(Sender: TObject);
var
 oContaController : TMovimentoController;
 sErro: string;
begin
  if dmconexao.dmGeral.qMovimento.IsEmpty then
    exit;

   oContaController := TMovimentoController.Create;

   if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = IDNO then
    Abort;
   if oContaController.ExcluirMovimento(dbgMovi.DataSource.DataSet.FieldByName('ID_MOVIMENTO').AsInteger,sErro) = False then
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
 oFuncoes : TFuncoes;
 sErro: string;
 Filtro: string;
begin

    oMovimentoController := TMovimentoController.Create;
    try
       if edtCliente.Text <> '' then
       begin
        oFuncoes := TFuncoes.Create;
        edtCliente.Text := oFuncoes.RemoveSpecialChars(edtCliente.Text);
        edtCliente.Text := oFuncoes.RemoveAccents(edtCliente.Text);
        filtro:= 'where nome_cliente like ' + QuotedStr('%' + edtCliente.Text + '%');
       end;
       oMovimentoController.Pesquisar(filtro, dmGeral.qMovimento, dmGeral.dsMovimento, dbgMovi);
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

procedure TfConsMov.dbgMoviDblClick(Sender: TObject);
begin
btnAlterarClick(Nil);
end;

end.
