unit uConsAnalitico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Mask, dmConexao, uRelAnalitico,
  uListConta;

type
  TfConsAnalitico = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    btnPesquisar: TBitBtn;
    ImageList1: TImageList;
    EdtConta: TLabeledEdit;
    BtnPesqClient: TButton;
    EdtIDConta: TEdit;
    edtData: TMaskEdit;
    procedure btnPesquisarClick(Sender: TObject);
    procedure BtnPesqClientClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsAnalitico: TfConsAnalitico;

implementation

{$R *.dfm}

procedure TfConsAnalitico.BtnPesqClientClick(Sender: TObject);
begin
  uListConta.edtIDConta:= '';
  uListConta.EdtConta:= '';
  uListConta.EdtCliente:= '';

  FListConta.ShowModal;
  EdtidConta.Text:= uListConta.edtIDConta;
  EdtConta.Text:= uListConta.edtConta;
end;

procedure TfConsAnalitico.btnPesquisarClick(Sender: TObject);
begin
  if EdtidConta.Text = '' then
  begin
    ShowMessage('Favor informar uma conta');
    exit;
  end;

  dmConexao.dmGeral.qRelAnalitico.Close;

  dmConexao.dmGeral.qRelAnalitico.ParamByName('CONTA').Value:= EdtidConta.Text;

  if edtData.Text <> '' then
    dmConexao.dmGeral.qRelAnalitico.ParamByName('DATAB').Value:= Copy(edtData.Text,5,4)+'-'+Copy(edtData.Text,3,2)+'-'+Copy(edtData.Text,1,2)
  else
    dmConexao.dmGeral.qRelAnalitico.ParamByName('DATAB').Value:= '2024-01-01';
  dmConexao.dmGeral.qRelAnalitico.Open();
  fRelAnalitico.RLReport1.Preview()
end;

procedure TfConsAnalitico.FormShow(Sender: TObject);
begin
  dmconexao.dmGeral.qListConta.Active := True;
end;

end.
