unit uMovimentoModel;

interface

uses
  System.SysUtils, DmConexao, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, uGenericModel, Vcl.DBGrids;

  type
  TMovimento = class(TRepositorio<TMovimento>)

  private
    Fid_movimento: Integer;
    Fid_conta: Integer;
    Ftp_mov: String;
    Fdata: TDate;
    Fvalor: Double;
    Fconta: String;
    Fnome_cliente:string;

  public
    property id_movimento: Integer read Fid_movimento write Fid_movimento;
    property id_conta: Integer read Fid_conta write Fid_conta;
    property tp_mov: String read Ftp_mov write Ftp_mov;
    property data: tDate read Fdata write Fdata;
    property valor: Double read Fvalor write Fvalor;
    property conta: String read Fconta write Fconta;
    property nome_cliente: String read Fnome_cliente write Fnome_cliente;

    procedure Pesquisar(ATableName, AFiltro: String; AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
    procedure CarregarMovimento(oMovimento: TMovimento; iCodigo: String; out sErro: String);
    function InserirMovimento(oMovimento: TMovimento; sErro: String): Boolean;
    function ExcluirMovimento(iCodigo: Integer; sErro: String): Boolean;
    function AlterarMovimento(oMovimento: TMovimento; sErro: String): Boolean;
  end;

implementation

{ TMovimento }

function TMovimento.AlterarMovimento(oMovimento: TMovimento; sErro: String): Boolean;
var
  Repositorio: TRepositorio<TMovimento>;
  Campos: TArray<String>;
  Valores: TArray<Variant>;
begin
  Repositorio := TRepositorio<TMovimento>.Create(dmConexao.dmGeral.FDConnection);
  Campos := TArray<String>.Create('id_movimento', 'id_conta', 'tp_mov', 'data', 'valor');
  Valores := TArray<Variant>.Create(INTTOSTR(oMovimento.id_movimento), INTTOSTR(oMovimento.id_conta), oMovimento.tp_mov, oMovimento.data, StringReplace(FLOATTOSTR(oMovimento.valor),',','.', [rfReplaceAll]));
  Repositorio.Alterar('movimento', 'id_movimento', Campos, Valores, oMovimento.id_movimento, sErro);
end;

function TMovimento.ExcluirMovimento(iCodigo: Integer; sErro: String): Boolean;
var
  Repositorio: TRepositorio<TMovimento>;
begin
  Repositorio := TRepositorio<TMovimento>.Create(dmConexao.dmGeral.FDConnection);
  Repositorio.Excluir('movimento', 'id_movimento', iCodigo, sErro);
  if sErro <> '' then
    result:= False
  else
  result:= True;
end;

function TMovimento.InserirMovimento(oMovimento: TMovimento; sErro: String): Boolean;
var
  Repositorio: TRepositorio<TMovimento>;
  Campos: TArray<String>;
  Valores: TArray<Variant>;
begin
  Repositorio := TRepositorio<TMovimento>.Create(dmConexao.dmGeral.FDConnection);
  Campos := TArray<String>.Create('id_movimento', 'id_conta', 'tp_mov', 'data', 'valor');
  Valores := TArray<Variant>.Create(INTTOSTR(oMovimento.id_movimento), INTTOSTR(oMovimento.id_conta), oMovimento.tp_mov, oMovimento.data, StringReplace(FLOATTOSTR(oMovimento.valor),',','.', [rfReplaceAll]));
  Repositorio.Inserir('movimento', Campos, Valores, sErro);
end;

procedure TMovimento.CarregarMovimento(oMovimento: TMovimento; iCodigo: String; out sErro: String);
var
  Repositorio: TRepositorio<TMovimento>;
  Campos: TArray<String>;
  MovimentoCarregado: TMovimento;
begin
  Repositorio := TRepositorio<TMovimento>.Create(dmConexao.dmGeral.FDConnection);
  try
    Campos := TArray<String>.Create('id_movimento', 'id_conta', 'tp_mov', 'data', 'valor', 'conta', 'nome_cliente');
    MovimentoCarregado := Repositorio.Carregar('vw_movimento', 'id_movimento', strtoint(iCodigo), Campos, sErro);
    if sErro = '' then
    begin
      oMovimento.fid_movimento := MovimentoCarregado.fid_movimento;
      oMovimento.fid_conta     := MovimentoCarregado.fid_conta;
      oMovimento.ftp_mov       := MovimentoCarregado.ftp_mov;
      oMovimento.fdata         := MovimentoCarregado.fdata;
      oMovimento.fvalor        := MovimentoCarregado.fvalor;
      oMovimento.fconta        := MovimentoCarregado.fconta;
      oMovimento.fnome_cliente := MovimentoCarregado.fnome_cliente;
    end;
    finally
    end;
end;

procedure TMovimento.Pesquisar(ATableName, AFiltro: String; AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
begin
    Consultar(ATableName, AFiltro, AQuery, ADataSource, ADBGrid);
end;

end.
