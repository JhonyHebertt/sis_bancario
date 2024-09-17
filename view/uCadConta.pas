unit uCadConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, dmConexao, uContaModel, uContaController, uListCliente,
  System.ImageList, Vcl.ImgList;

type
  TfCadConta = class(TForm)
    Panel1: TPanel;
    EdtConta: TLabeledEdit;
    edtID: TEdit;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnSair: TBitBtn;
    EdtCliente: TLabeledEdit;
    BtnPesqClient: TButton;
    ImageList1: TImageList;
    edtIDCliente: TEdit;
    Label1: TLabel;
    dbBancos: TDBLookupComboBox;
    dbAtivo: TDBCheckBox;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BtnPesqClientClick(Sender: TObject);

  private
    { Private declarations }
    procedure Gravar;
    procedure CarregarConta;
    procedure Limpar;
    function ValidaCampos():Boolean;
  public
    { Public declarations }
  end;

var
  fCadConta: TfCadConta;
  Tipo_Operacao :String;

implementation

{$R *.dfm}

procedure TfCadConta.BtnPesqClientClick(Sender: TObject);
begin
  uListCliente.edtIDCliente:= '';
  uListCliente.EdtCliente:= '';

  fListCliente.ShowModal;
  edtIDCliente.Text:= uListCliente.edtIDCliente;
  EdtCliente  .Text:= uListCliente.EdtCliente;
end;

procedure TfCadConta.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadConta.btnSalvarClick(Sender: TObject);
begin

  if ValidaCampos then
  begin
    Gravar
  end;

  btnSairClick(nil);
end;

procedure TfCadConta.CarregarConta;
var
  oConta : TConta;
  oContaController : TContaController;
  sErro: string;
begin
    oConta := TConta.Create(Nil);
    oContaController := TContaController.Create;
    try
       oContaController.CarregarConta(oConta, EdtID.Text, sErro );
       with oConta do
       begin
         EdtID        .Text := ID_Conta  .ToString;
         edtIDCliente .Text := ID_Cliente.ToString;
         if ativa = 'S' then
          dbAtivo      .Checked := True
         else
           dbAtivo      .Checked := false;
         EdtCliente   .Text := Nome_cliente;
         EdtConta     .Text := Conta;
       end;
  finally
    FreeAndNil(oContaController);
    FreeAndNil(oConta);
  end;

end;

procedure TfCadConta.FormShow(Sender: TObject);
begin
   if Tipo_Operacao = 'I' then
     Limpar
   else
     CarregarConta;

    dmconexao.dmGeral.qConta.Active := True;
    dmconexao.dmGeral.qBancos.Active := True;
    dmconexao.dmGeral.qListCli.Open;
end;

procedure TfCadConta.Gravar;
var
  oConta : TConta;
  oContaController : TContaController;
  sErro: string;
begin
  oConta := TConta.Create(Nil);
  oContaController := TContaController.Create;
  try
    with oConta do
    begin
     id_cliente := strtoint(edtIDCliente.Text);
     nome_banco := dbBancos.Text;
     conta      := EdtConta.Text;
     if dbAtivo.Checked then
      ativa      := dbAtivo.ValueChecked
     else
      ativa      := dbAtivo.ValueUnchecked;
     if Tipo_Operacao = 'A' then
      ID_Conta  := strtoint(EdtID.Text);
    end;

    if Tipo_Operacao = 'I' then
      oContaController.InserirConta(oConta,sErro)
    else
      oContaController.AlterarConta(oConta,sErro);
  finally
    FreeAndNil(oContaController);
    FreeAndNil(oConta);
  end;

end;

procedure TfCadConta.Limpar;
begin
  edtIDCliente.clear;
  edtID.clear;
  EdtCliente.Clear;
  dbAtivo.Checked;
  EdtConta.clear;
end;

function TfCadConta.ValidaCampos: Boolean;
begin
   Result := False;
  if dbBancos.Text = '' then
    begin
       ShowMessage('Banco obrigatório');
       Exit;
    end;

    if EdtConta.Text = '' then
    begin
       ShowMessage('Conta obrigatória');
       Exit;
    end;

  Result := True;
end;

end.
