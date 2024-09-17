unit uCadMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Mask, System.ImageList, Vcl.ImgList, uListConta, dmConexao,
  Vcl.ComCtrls, uMovimentoModel, uMovimentoController;

type
  TfCadMovimento = class(TForm)
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnSair: TBitBtn;
    Panel1: TPanel;
    edtID: TEdit;
    EdtConta: TLabeledEdit;
    edtIDConta: TEdit;
    ImageList1: TImageList;
    BtnPesqClient: TButton;
    dbTPMov: TDBRadioGroup;
    dtLcto: TDateTimePicker;
    Label1: TLabel;
    edtCliente: TLabeledEdit;
    Label2: TLabel;
    edtValor: TEdit;
    procedure BtnPesqClientClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Gravar;
    procedure CarregarMov;
    procedure Limpar;
    function ValidaCampos():Boolean;
  public
    { Public declarations }
  end;

var
  fCadMovimento: TfCadMovimento;
  Tipo_Operacao :String;

implementation

{$R *.dfm}

procedure TfCadMovimento.BtnPesqClientClick(Sender: TObject);
begin
  uListConta.edtIDConta:= '';
  uListConta.EdtConta:= '';
  uListConta.EdtCliente:= '';

  FListConta.ShowModal;
  edtIDConta.Text:= uListConta.edtIDConta;
  EdtConta  .Text:= uListConta.EdtConta;
  EdtCliente.Text:= uListConta.EdtCliente;

end;

procedure TfCadMovimento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadMovimento.btnSalvarClick(Sender: TObject);
begin

  if ValidaCampos then
  begin
    Gravar
  end;

  btnSairClick(nil);
end;

procedure TfCadMovimento.CarregarMov;
var
  oMovimento : TMovimento;
  oMovimentoController : TMovimentoController;
  sErro: string;
begin
    oMovimento := TMovimento.Create(Nil);
    oMovimentoController := TMovimentoController.Create;
    try
       oMovimentoController.CarregarMovimento(oMovimento, EdtID.Text, sErro );
       with oMovimento do
       begin
         EdtID     .Text   := ID_Movimento  .ToString;
         edtIDConta.Text   := ID_Conta.ToString;
         EdtConta  .Text   := conta;
         EdtCliente  .Text := nome_cliente;
         dbTPMov   .Value  := tp_mov;
         dtLcto    .Date   := data;
         edtValor  .text   := floattostr(valor);
       end;
  finally
    FreeAndNil(oMovimentoController);
    FreeAndNil(oMovimento);
  end;

end;

procedure TfCadMovimento.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(8), ',']) then
    Key := #0;
end;

procedure TfCadMovimento.FormShow(Sender: TObject);
begin
   if Tipo_Operacao = 'I' then
     Limpar
   else
     CarregarMov;

   dmconexao.dmGeral.qListConta.Active := True;
   dmconexao.dmGeral.qMovimento.Active := True;
end;

procedure TfCadMovimento.Gravar;
var
  oMovimento : TMovimento;
  oMovimentoController : TMovimentoController;
  sErro: string;
begin
  oMovimento := TMovimento.Create(Nil);
  oMovimentoController := TMovimentoController.Create;
  try
    with oMovimento do
    begin
     id_conta := strtoint(edtIDConta.Text);
     tp_mov   := dbTPMov.Value;
     data     := dtLcto.Date;
     valor    := StrToFloat(edtValor.Text);
     if Tipo_Operacao = 'A' then
      id_movimento := strtoint(EdtID.Text);
    end;

    if Tipo_Operacao = 'I' then
      oMovimentoController.InserirMovimento(oMovimento,sErro)
    else
      oMovimentoController.AlterarMovimento(oMovimento,sErro);
  finally
    FreeAndNil(oMovimentoController);
    FreeAndNil(oMovimento);

  end;
end;

procedure TfCadMovimento.Limpar;
begin
  edtIDConta.clear;
  edtID     .clear;
  EdtConta  .Clear;
  EdtCliente.Clear;
  edtValor  .clear;
  dbTPMov   .Value:= 'D';
  dtLcto    .Date:=now;

end;

function TfCadMovimento.ValidaCampos: Boolean;
begin
   Result := False;
  if EdtConta.Text = '' then
    begin
       ShowMessage('Conta obrigatória');
       Exit;
    end;

    if edtValor.Text = '' then
    begin
       ShowMessage('Valor obrigatório');
       Exit;
    end;

  Result := True;
end;

end.
