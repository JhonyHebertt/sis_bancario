unit uConsConsolidado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls, dmConexao, Vcl.ComCtrls, uRelConsolidado, Vcl.Mask;

type
  TfConsConsolidado = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    btnPesquisar: TBitBtn;
    edtCliente: TEdit;
    Label1: TLabel;
    dbBancos: TDBLookupComboBox;
    Label3: TLabel;
    edtData: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbBancosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsConsolidado: TfConsConsolidado;

implementation

{$R *.dfm}

procedure TfConsConsolidado.btnPesquisarClick(Sender: TObject);
begin
  dmConexao.dmGeral.qRelConsolidado.Close;

  if edtCliente.Text <> ''	 then
  dmConexao.dmGeral.qRelConsolidado.ParamByName('CLIENTE').Value:= '%' + edtCliente.Text + '%'
  else
  dmConexao.dmGeral.qRelConsolidado.ParamByName('CLIENTE').Value:= '%';

  if dbBancos.Text <> '' then
   dmConexao.dmGeral.qRelConsolidado.ParamByName('BANCO').Value:= dbBancos.Text
  else
    dmConexao.dmGeral.qRelConsolidado.ParamByName('BANCO').Value:= '%';

  if edtData.Text <> '' then
    dmConexao.dmGeral.qRelConsolidado.ParamByName('DATA').Value:= '20'+Copy(edtData.Text,5,2)+'-'+Copy(edtData.Text,3,2)+'-'+Copy(edtData.Text,1,2)
  else
    dmConexao.dmGeral.qRelConsolidado.ParamByName('DATA').Value:= '2024-01-01';

  dmConexao.dmGeral.qRelConsolidado.Open();
  fRelConsolidado.RLReport1.Preview()
end;

procedure TfConsConsolidado.dbBancosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_DELETE then
  begin
    dbBancos.KeyValue := null; // ou 0, dependendo do tipo de dado
  end;
end;

procedure TfConsConsolidado.FormShow(Sender: TObject);
begin
    dmconexao.dmGeral.qBancos.Active := True;
     dbBancos.KeyValue:= null;
     edtCliente.Clear;
     edtData.Clear;
end;

end.
