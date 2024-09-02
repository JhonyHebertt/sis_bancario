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
    Lan�amentos: TMenuItem;
    Relatorios: TMenuItem;
    Clientes: TMenuItem;
    Movimenta��o: TMenuItem;
    Consolidado: TMenuItem;
    Anal�tico: TMenuItem;
    Contas1: TMenuItem;
    procedure ClientesClick(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure Movimenta��oClick(Sender: TObject);
    procedure ConsolidadoClick(Sender: TObject);
    procedure Anal�ticoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

{$R *.dfm}

procedure TfmPrincipal.Anal�ticoClick(Sender: TObject);
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

procedure TfmPrincipal.Movimenta��oClick(Sender: TObject);
begin
   fConsMov.showModal;
end;

end.
