unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uClienteModel, uClienteController, Vcl.Mask, Vcl.ComCtrls, uFuncoes;

type
  TFCadCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnSair: TBitBtn;
    EdtEmail: TLabeledEdit;
    EdtNome: TLabeledEdit;
    EdtDocumento: TLabeledEdit;
    edtTel: TLabeledEdit;
    edtID: TEdit;
    edtDatNasc: TDateTimePicker;
    Label1: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Gravar;
    procedure CarregarCliente;
    procedure Limpar;
  public
    { Public declarations }
    function ValidaCampos():Boolean;
  end;

var
  FCadCliente: TFCadCliente;
  Tipo_Operacao :String;

implementation

{$R *.dfm}

procedure TFCadCliente.FormShow(Sender: TObject);
begin
   if Tipo_Operacao = 'I' then
     Limpar
   else
     CarregarCliente;
end;

procedure TFCadCliente.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFCadCliente.btnSalvarClick(Sender: TObject);
begin

  if ValidaCampos then
  begin
    Gravar
  end;

  btnSairClick(nil);
end;

function TFCadCliente.ValidaCampos: Boolean;
begin
  Result := False;
  if EdtNome.Text = '' then
    begin
       ShowMessage('Nome obrigatório');
       Exit;
    end;
  Result := True;
end;

procedure TFCadCliente.Gravar;
var
  oCliente : TCliente;
  oClienteController : TClienteController;
  oFuncoes : TFuncoes;
  sErro: string;
begin
  oCliente := TCliente.Create;
  oClienteController := TClienteController.Create;
  oFuncoes := TFuncoes.Create;
  try
    with oCliente do
    begin
     EdtNome.Text:= oFuncoes.RemoveSpecialChars(EdtNome.Text);
     EdtNome.Text:= oFuncoes.RemoveAccents(EdtNome.Text);

     Nome            := EdtNome.Text;
     Data_nascimento := edtDatNasc.Date;
     Documento       := EdtDocumento.Text;
     Telefone        := edtTel.Text;
     Email           := EdtEmail.Text;
     if Tipo_Operacao = 'A' then
      ID_CLIENTE      := strtoint(EdtID.Text);
    end;

    if Tipo_Operacao = 'I' then
      oClienteController.InserirCliente(oCliente,sErro)
    else
      oClienteController.AlterarCliente(oCliente,sErro);
  finally
    FreeAndNil(oClienteController);
    FreeAndNil(oCliente);
  end;
end;


procedure TFCadCliente.Limpar;
begin
    EdtNome.Clear;
    edtDatNasc.Date:=now;
    EdtDocumento.Clear;
    edtTel.Clear;
    EdtEmail.Clear;
end;

procedure TFCadCliente.CarregarCliente;
var
  oCliente : TCliente;
  oClienteController : TClienteController;
  sErro: string;
begin
    oCliente := TCliente.Create;
    oClienteController := TClienteController.Create;
    try
       oClienteController.CarregarCliente(oCliente, EdtID.Text );
       with oCliente do
       begin
         EdtID       .Text := ID_CLIENTE.ToString;
         EdtNome     .Text := Nome;
         edtDatNasc  .Date := Data_nascimento;
         EdtDocumento.Text := Documento;
         edtTel      .Text := Telefone;
         EdtEmail    .Text := Email;
       end;
  finally
    FreeAndNil(oClienteController);
    FreeAndNil(oCliente);
  end;
end;


end.
