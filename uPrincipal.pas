unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ActnMenus, Vcl.Menus, dmConexao, uConsCliente, uConsConta, uConsMov, uConsConsolidado,
  uConsAnalitico;

type
  TfmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro: TMenuItem;
    Lançamentos: TMenuItem;
    Relatorios: TMenuItem;
    Clientes: TMenuItem;
    Movimentação: TMenuItem;
    Consolidado: TMenuItem;
    Analítico: TMenuItem;
    Contas1: TMenuItem;
    procedure ClientesClick(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure MovimentaçãoClick(Sender: TObject);
    procedure ConsolidadoClick(Sender: TObject);
    procedure AnalíticoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

{$R *.dfm}

procedure TfmPrincipal.AnalíticoClick(Sender: TObject);
begin
 fConsAnalitico.ShowModal;
end;

procedure TfmPrincipal.ClientesClick(Sender: TObject);
begin
  fConsCliente.ShowModal;
end;

procedure TfmPrincipal.ConsolidadoClick(Sender: TObject);
begin
   fConsConsolidado.showmodal;
end;

procedure TfmPrincipal.Contas1Click(Sender: TObject);
begin
 fConsConta.showModal;
end;

procedure TfmPrincipal.MovimentaçãoClick(Sender: TObject);
begin
   fConsMov.showModal;
end;

end.
