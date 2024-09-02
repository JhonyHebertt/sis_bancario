unit uClienteController;

interface

uses
uClienteModel, System.SysUtils;

type
  TClienteController = class
  private
  public
    procedure Pesquisar(sNome: String);
    procedure CarregarCliente(oCliente: TCliente; iCodigo: String);
    function InserirCliente(oCliente: TCliente; sErro: String): Boolean;
    function ExcluirCliente(iCodigo: Integer; sErro: String): Boolean;
    function AlterarCliente(oCliente: TCliente; sErro: String): Boolean;
  end;

implementation

procedure TClienteController.CarregarCliente(oCliente: TCliente; iCodigo: String);
var
  oClientes : TCliente;
begin
   oClientes := TCliente.Create;
   try
     oClientes.CarregarCliente(oCliente, iCodigo );
   finally
     FreeAndNil(oClientes);
   end;
end;

function TClienteController.InserirCliente(oCliente: TCliente;sErro: String): Boolean;
var
  oClientes : TCliente;
begin
   oClientes := TCliente.Create;
   try
     Result := oclientes.InserirCliente(oCliente, sErro);
   finally
     FreeAndNil(oClientes);
   end;
end;

procedure TClienteController.Pesquisar(sNome: String);
var
  oClientes : TCliente;
begin
   oClientes := TCliente.Create;
   try
     oclientes.Pesquisar(snome);
   finally
     FreeAndNil(oClientes);
   end;
end;

function TClienteController.ExcluirCliente(iCodigo: Integer;sErro: String): Boolean;
var
  oClientes : TCliente;
begin
   oClientes := TCliente.Create;
   try
     Result :=  oclientes.ExcluirCliente(iCodigo, sErro);
   finally
     FreeAndNil(oClientes);
   end;
end;

function TClienteController.AlterarCliente(oCliente: TCliente;sErro: String): Boolean;
var
  oClientes : TCliente;
begin
   oClientes := TCliente.Create;
   try
     result:= oClientes.AlterarCliente(oCliente, sErro );
   finally
     FreeAndNil(oClientes);
   end;
end;

end.
