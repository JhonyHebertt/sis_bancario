program Sis_Bancario;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fmPrincipal},
  dmConexao in 'dmConexao.pas' {dmGeral: TDataModule},
  uClienteController in 'Controller\uClienteController.pas',
  uCadCliente in 'view\uCadCliente.pas' {FCadCliente},
  uConsCliente in 'view\uConsCliente.pas' {FConsCliente},
  uContaModel in 'Model\uContaModel.pas',
  uContaController in 'Controller\uContaController.pas',
  uConsConta in 'view\uConsConta.pas' {fConsConta},
  uCadConta in 'view\uCadConta.pas' {fCadConta},
  uListCliente in 'view\uListCliente.pas' {fListCliente},
  uConsMov in 'view\uConsMov.pas' {fConsMov},
  uMovimentoModel in 'Model\uMovimentoModel.pas',
  uMovimentoController in 'Controller\uMovimentoController.pas',
  uCadMovimento in 'view\uCadMovimento.pas' {fCadMovimento},
  uListConta in 'view\uListConta.pas' {fListConta},
  uConsConsolidado in 'view\uConsConsolidado.pas' {fConsConsolidado},
  uRelConsolidado in 'view\uRelConsolidado.pas' {fRelConsolidado},
  uFuncoes in 'uFuncoes.pas',
  uConsAnalitico in 'view\uConsAnalitico.pas' {fConsAnalitico},
  uRelAnalitico in 'view\uRelAnalitico.pas' {fRelAnalitico},
  uGenericModel in 'Model\uGenericModel.pas',
  uClienteModel in 'Model\uClienteModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.CreateForm(TdmGeral, dmGeral);
  Application.CreateForm(TFCadCliente, FCadCliente);
  Application.CreateForm(TFConsCliente, FConsCliente);
  Application.CreateForm(TfConsConta, fConsConta);
  Application.CreateForm(TfCadConta, fCadConta);
  Application.CreateForm(TfListCliente, fListCliente);
  Application.CreateForm(TfConsMov, fConsMov);
  Application.CreateForm(TfCadMovimento, fCadMovimento);
  Application.CreateForm(TfListConta, fListConta);
  Application.CreateForm(TfConsConsolidado, fConsConsolidado);
  Application.CreateForm(TfRelConsolidado, fRelConsolidado);
  Application.CreateForm(TfConsAnalitico, fConsAnalitico);
  Application.CreateForm(TfRelAnalitico, fRelAnalitico);
  Application.Run;
end.
