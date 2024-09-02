unit uContaController;

interface

uses
  uContaModel, System.SysUtils;

  type
  TContaController = class
  private
  public
    procedure Pesquisar(sPesquisa: String);
    procedure CarregarConta(oConta: TConta; iCodigo: String);
    function InserirConta(oConta: TConta; sErro: String): Boolean;
    function ExcluirConta(iCodigo: Integer; sErro: String): Boolean;
    function AlterarConta(oConta: TConta; sErro: String): Boolean;
  end;

implementation

{ TContaController }

function TContaController.AlterarConta(oConta: TConta; sErro: String): Boolean;
var
  oContas : TConta;
begin
   oContas := TConta.Create;
   try
     result:= oContas.AlterarConta(oConta, sErro );
   finally
     FreeAndNil(oContas);
   end;
end;

procedure TContaController.CarregarConta(oConta: TConta; iCodigo: String);
var
  oContas : TConta;
begin
   oContas := TConta.Create;
   try
     oContas.CarregarConta(oConta, iCodigo );
   finally
     FreeAndNil(oContas);
   end;
end;

function TContaController.ExcluirConta(iCodigo: Integer; sErro: String): Boolean;
var
  oContas : TConta;
begin
   oContas := TConta.Create;
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
   oContas := TConta.Create;
   try
     Result := oContas.InserirConta(oConta, sErro);
   finally
     FreeAndNil(oContas);
   end;

end;

procedure TContaController.Pesquisar(sPesquisa: String);
var
  oContas : TConta;
begin
   oContas := TConta.Create;
   try
     oContas.Pesquisar(sPesquisa);
   finally
     FreeAndNil(oContas);
   end;

end;

end.
