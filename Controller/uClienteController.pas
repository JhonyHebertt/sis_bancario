unit uClienteController;

interface

uses
  uClienteModel, System.SysUtils, Vcl.DBGrids,  FireDAC.Comp.Client, Data.DB;

type
  TClienteController = class
  private
  public
    procedure Pesquisar(AFiltro: String; AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
    procedure CarregarCliente(oCliente: TClienteRepositorio; iCodigo: Integer; sErro: String);
    function InserirCliente(oCliente: TClienteRepositorio; sErro: String): Boolean;
    function ExcluirCliente(iCodigo: Integer; sErro: String): Boolean;
    function AlterarCliente(oCliente: TClienteRepositorio; sErro: String): Boolean;
  end;

implementation

procedure TClienteController.CarregarCliente(oCliente: TClienteRepositorio; iCodigo: integer; sErro: String);
var
  oClientes : TClienteRepositorio;
begin
   oClientes := TClienteRepositorio.Create(nil);
   oClientes.CarregarCliente(oClientes, iCodigo, sErro);
   if sErro = '' then
    begin
      oCliente.ID_Cliente      := oClientes.ID_cliente;
      oCliente.Nome            := oClientes.Nome;
      oCliente.Data_nascimento := oClientes.Data_nascimento;
      oCliente.Documento       := oClientes.Documento;
      oCliente.Telefone        := oClientes.Telefone;
      oCliente.Email           := oClientes.Email;
    end;
end;

function TClienteController.InserirCliente(oCliente: TClienteRepositorio;sErro: String): Boolean;
var
  oClientes : TClienteRepositorio;
begin
   oClientes := TClienteRepositorio.Create(Nil);
   try
     Result := oclientes.InserirCliente(oCliente, sErro);
   finally
     FreeAndNil(oClientes);
   end;
end;

procedure TClienteController.Pesquisar(AFiltro: String; AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
var
  oClientes : TClienteRepositorio;
begin
   oClientes := TClienteRepositorio.Create(Nil);
   try
     oclientes.PesquisarCliente('cliente', AFiltro, AQuery, ADataSource, ADBGrid);
   finally
     FreeAndNil(oClientes);
   end;
end;

function TClienteController.ExcluirCliente(iCodigo: Integer;sErro: String): Boolean;
var
  oClientes : TClienteRepositorio;
begin
   oClientes := TClienteRepositorio.Create(nil);
   try
     Result :=  oclientes.ExcluirCliente(iCodigo, sErro);
   finally
     FreeAndNil(oClientes);
   end;
end;

function TClienteController.AlterarCliente(oCliente: TClienteRepositorio;sErro: String): Boolean;
var
  oClientes : TClienteRepositorio;
begin
   oClientes := TClienteRepositorio.Create(Nil);
   try
     result:= oClientes.AlterarCliente(oCliente, sErro );
   finally
     FreeAndNil(oClientes);
   end;
end;

end.
