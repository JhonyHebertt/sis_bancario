unit uContaController;

interface

uses
  uContaModel, System.SysUtils, FireDAC.Comp.Client, Data.DB, Vcl.DBGrids;

  type
  TContaController = class
  private
  public
    procedure Pesquisar(AFiltro: String; AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
    procedure CarregarConta(oConta: TConta; iCodigo: String; sErro: String);
    function InserirConta(oConta: TConta; sErro: String): Boolean;
    function ExcluirConta(iCodigo: Integer; out sErro: String): Boolean;
    function AlterarConta(oConta: TConta; sErro: String): Boolean;
  end;

implementation

{ TContaController }

function TContaController.AlterarConta(oConta: TConta; sErro: String): Boolean;
var
  oContas : TConta;
begin
   oContas := TConta.Create(Nil);
   try
     result:= oContas.AlterarConta(oConta, sErro );
   finally
     FreeAndNil(oContas);
   end;
end;

procedure TContaController.CarregarConta(oConta: TConta; iCodigo: String; sErro: String);
var
  oContas : TConta;
begin
   oContas := TConta.Create(Nil);
   try
   oContas.CarregarConta(oContas, iCodigo, sErro);
   if sErro = '' then
    begin
      oConta.id_conta     := oContas.id_conta;
      oConta.id_cliente   := oContas.id_cliente;
      oConta.Nome_banco   := oContas.Nome_banco;
      oConta.Conta        := oContas.Conta;
      oConta.ativa        := oContas.ativa;
      oConta.Nome_cliente := oContas.Nome_cliente;
    end;
   finally
     FreeAndNil(oContas);
   end;
end;

function TContaController.ExcluirConta(iCodigo: Integer; out  sErro: String): Boolean;
var
  oContas : TConta;
begin
   oContas := TConta.Create(Nil);
   try
     Result :=  oContas.ExcluirConta(iCodigo, sErro);
   finally
     FreeAndNil(oContas);
   end;

end;

function TContaController.InserirConta(oConta: TConta; sErro: String): Boolean;
var
  oContas : TConta;
begin
   oContas := TConta.Create(Nil);
   try
     Result := oContas.InserirConta(oConta, sErro);
   finally
     FreeAndNil(oContas);
   end;

end;

procedure TContaController.Pesquisar(AFiltro: String; AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
var
  oContas : TConta;
begin
   oContas := TConta.Create(Nil);
   try
     oContas.Pesquisar('vw_conta', AFiltro, AQuery, ADataSource, ADBGrid);
   finally
     FreeAndNil(oContas);
   end;

end;

end.
