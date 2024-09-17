unit uContaModel;

interface

uses
  System.SysUtils, DmConexao, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, uGenericModel, Vcl.DBGrids, uMovimentoModel;


type
  TConta = class(TRepositorio<TConta>)

  private
    Fid_conta: Integer;
    Fid_cliente: Integer;
    FNome_banco: String;
    FConta: String;
    fativa: String;
    fNome_Cliente: String;

  public
    property id_conta: Integer read Fid_conta write Fid_conta;
    property id_cliente: Integer read FID_Cliente write Fid_Cliente;
    property Nome_banco: String read FNome_banco write FNome_banco;
    property Conta: String read FConta write FConta;
    property ativa: String read fativa write fativa;
    property Nome_cliente: String read FNome_cliente write FNome_Cliente;

    procedure Pesquisar(ATableName, AFiltro: String;  AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
    procedure CarregarConta(oConta: TConta; iCodigo: String; out sErro: String);
    function InserirConta(oConta: TConta; out  sErro: String): Boolean;
    function ExcluirConta(iCodigo: Integer; out  sErro: String): Boolean;
    function AlterarConta(oConta: TConta; out  sErro: String): Boolean;
    function ValidaConta(iCodigo: Integer): Boolean;
  end;

implementation

{ TConta }

function TConta.AlterarConta(oConta: TConta; out  sErro: String): Boolean;
var
  Repositorio: TRepositorio<TConta>;
  Campos: TArray<String>;
  Valores: TArray<Variant>;
begin
  Repositorio := TRepositorio<TConta>.Create(dmConexao.dmGeral.FDConnection);
  Campos := TArray<String>.Create('id_cliente', 'nome_banco', 'conta', 'ativa');
  Valores := TArray<Variant>.Create(INTTOSTR(oConta.id_cliente), oConta.nome_banco, oConta.conta, oConta.ativa	);
  Repositorio.Alterar('conta', 'id_conta', Campos, Valores, oConta.id_conta, sErro);
end;

function TConta.ExcluirConta(iCodigo: Integer; out  sErro: String): Boolean;
var
  Repositorio: TRepositorio<TConta>;
begin
  if ValidaConta(iCodigo) then
  begin
    Repositorio := TRepositorio<TConta>.Create(dmConexao.dmGeral.FDConnection);
    Repositorio.Excluir('conta', 'id_conta', iCodigo, sErro);
    Result:= True;
  end
  else
  sErro:= 'Conta já tem Movimento!!!';
end;

function TConta.InserirConta(oConta: TConta; out  sErro: String): Boolean;
var
  Repositorio: TRepositorio<TConta>;
  Campos: TArray<String>;
  Valores: TArray<Variant>;
begin
  Repositorio := TRepositorio<TConta>.Create(dmConexao.dmGeral.FDConnection);
  Campos := TArray<String>.Create('id_cliente', 'nome_banco', 'conta', 'ativa');
  Valores := TArray<Variant>.Create(INTTOSTR(oConta.id_cliente), oConta.nome_banco, oConta.conta, oConta.ativa	);
  Repositorio.Inserir('conta', Campos, Valores, sErro);
end;

procedure TConta.CarregarConta(oConta: TConta; iCodigo: String; out sErro: String);
var
  Repositorio: TRepositorio<TConta>;
  Campos: TArray<String>;
  ContaCarregada: TConta;
begin
  Repositorio := TRepositorio<TConta>.Create(dmConexao.dmGeral.FDConnection);
  try
    Campos := TArray<String>.Create('id_conta', 'id_cliente', 'Nome_banco', 'conta', 'ativa', 'nome_cliente');
    ContaCarregada := Repositorio.Carregar('vw_conta', 'id_conta', strtoint(iCodigo), Campos, sErro);
    if sErro = '' then
    begin
      oConta.fid_conta     := ContaCarregada.fid_conta;
      oConta.fid_cliente   := ContaCarregada.fid_cliente;
      oConta.fNome_banco   := ContaCarregada.fNome_banco;
      oConta.fconta        := ContaCarregada.fconta;
      oConta.fativa        := ContaCarregada.fativa;
      oConta.fNome_cliente := ContaCarregada.Nome_cliente;
    end;

    finally
    end;

end;

procedure TConta.Pesquisar(ATableName, AFiltro: String; AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
begin
    Consultar(ATableName, AFiltro, AQuery, ADataSource, ADBGrid);
end;

function TConta.ValidaConta(iCodigo: Integer): Boolean;
var
  Repositorio: TRepositorio<TMovimento>;
  Campos: TArray<String>;
  Movimento: TMovimento;
  id, sErro: String;

begin

  Repositorio := TRepositorio<TMovimento>.Create(dmConexao.dmGeral.FDConnection);
  try
    Campos    := TArray<String>.Create('id_movimento');
    Movimento := Repositorio.Carregar('movimento', 'id_conta', iCodigo, Campos, sErro);

    id:= IntToStr(Movimento.id_movimento);
    if id = '' then
      result:= True
    else
      result:= False;  
    
  except
    result:= True;
           
  end;

end;

end.
