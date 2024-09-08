unit uClienteModel;

interface

uses
  uGenericModel, dmconexao, System.SysUtils, FireDAC.Comp.Client, Data.DB, Vcl.DBGrids;

type
  TClienteRepositorio = class(TRepositorio<TClienteRepositorio>)
  private
    FID_Cliente: Integer;
    FNome: String;
    FData_nascimento: tDate;
    FDocumento: String;
    FTelefone: String;
    FEmail: String;
  public
    property ID_cliente: Integer read FID_Cliente write FID_Cliente;
    property Nome: String read FNome write FNome;
    property Data_nascimento: tDate read FData_nascimento write FData_nascimento;
    property Documento: String read FDocumento write FDocumento;
    property Telefone: String read FTelefone write FTelefone;
    property Email: String read FEmail write FEmail;

    function InserirCliente(const ACliente: TClienteRepositorio; out sErro: String): Boolean;
    function AlterarCliente(const ACliente: TClienteRepositorio; out sErro: String): Boolean;
    function ExcluirCliente(const AId: Integer; out sErro: String): Boolean;
    procedure CarregarCliente(oCliente: TClienteRepositorio; iCodigo: Integer; out sErro: String);
    procedure PesquisarCliente(ATableName, AFiltro: String;  AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
  end;

implementation

function TClienteRepositorio.InserirCliente(const ACliente: TClienteRepositorio; out sErro: String): Boolean;
var
  Repositorio: TRepositorio<TClienteRepositorio>;
  Campos: TArray<String>;
  Valores: TArray<Variant>;
begin
  Repositorio := TRepositorio<TClienteRepositorio>.Create(dmConexao.dmGeral.FDConnection);
  Campos := TArray<String>.Create('nome', 'data_nascimento', 'documento', 'telefone', 'email');
  Valores := TArray<Variant>.Create(ACliente.Nome, ACliente.Data_nascimento, ACliente.Documento, ACliente.Telefone , ACliente.Email	);
  Repositorio.Inserir('Cliente', Campos, Valores, sErro);
end;

function TClienteRepositorio.ExcluirCliente(const AId: Integer; out sErro: String): Boolean;
var
  Repositorio: TRepositorio<TClienteRepositorio>;
begin
  Repositorio := TRepositorio<TClienteRepositorio>.Create(dmConexao.dmGeral.FDConnection);
  Repositorio.Excluir('cliente', 'id_cliente', AId, sErro);
end;

function TClienteRepositorio.AlterarCliente(const ACliente: TClienteRepositorio; out sErro: String): Boolean;
var
  Repositorio: TRepositorio<TClienteRepositorio>;
  Campos: TArray<String>;
  Valores: TArray<Variant>;
begin
  Repositorio := TRepositorio<TClienteRepositorio>.Create(dmConexao.dmGeral.FDConnection);
  Campos := TArray<String>.Create('nome', 'data_nascimento', 'documento', 'telefone', 'email');
  Valores := TArray<Variant>.Create(ACliente.Nome, ACliente.Data_nascimento, ACliente.Documento, ACliente.Telefone , ACliente.Email	);
  Repositorio.Alterar('Cliente', 'id_cliente', Campos, Valores, ACliente.ID_cliente, sErro);
end;

procedure TClienteRepositorio.CarregarCliente(oCliente: TClienteRepositorio; iCodigo: Integer; out sErro: String);
var
  Repositorio: TRepositorio<TClienteRepositorio>;
  Campos: TArray<String>;
  ClienteCarregado: TClienteRepositorio;
begin
  Repositorio := TRepositorio<TClienteRepositorio>.Create(dmConexao.dmGeral.FDConnection);
  try
    Campos := TArray<String>.Create('Nome', 'Data_nascimento', 'Documento', 'Telefone', 'Email');
    ClienteCarregado := Repositorio.Carregar('Cliente', 'id_cliente', iCodigo, Campos, sErro);
    if sErro = '' then
    begin
      oCliente.fID_Cliente := iCodigo;
      oCliente.FNome := ClienteCarregado.FNome;
      oCliente.FData_nascimento := ClienteCarregado.FData_nascimento;
      oCliente.FDocumento := ClienteCarregado.FDocumento;
      oCliente.FTelefone := ClienteCarregado.FTelefone;
      oCliente.FEmail := ClienteCarregado.FEmail;
    end;
  finally
    Repositorio.Free;
  end;
end;


procedure TClienteRepositorio.PesquisarCliente(ATableName, AFiltro: String; AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
begin
    Consultar(ATableName, AFiltro, AQuery, ADataSource, ADBGrid);
end;

end.
