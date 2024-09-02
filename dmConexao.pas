unit dmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  Data.SqlExpr, Data.DBXMySQL, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider,
  Data.DbxSqlite, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmGeral = class(TDataModule)
    FDConnection: TFDConnection;
    qCliente: TFDQuery;
    dsCliente: TDataSource;
    dsConta: TDataSource;
    qConta: TFDQuery;
    qListCli: TFDQuery;
    dsListCli: TDataSource;
    qBancos: TFDQuery;
    dsBancos: TDataSource;
    dsListConta: TDataSource;
    qListConta: TFDQuery;
    qMovimento: TFDQuery;
    dsMovimento: TDataSource;
    qMovimentoid_movimento: TFDAutoIncField;
    qMovimentoid_conta: TIntegerField;
    qMovimentotp_mov: TWideStringField;
    qMovimentodata: TDateField;
    qClienteid_cliente: TFDAutoIncField;
    qClientenome: TStringField;
    qClientedata_nascimento: TDateField;
    qClientedocumento: TStringField;
    qClientetelefone: TStringField;
    qClienteemail: TStringField;
    qContaid_conta: TFDAutoIncField;
    qContaid_cliente: TIntegerField;
    qContanome_banco: TWideStringField;
    qContaconta: TWideStringField;
    qContaativa: TWideStringField;
    qListCliid_cliente: TFDAutoIncField;
    qListClinome: TStringField;
    qListContaid_conta: TFDAutoIncField;
    qListContanome: TStringField;
    qListContanome_banco: TWideStringField;
    qListContaconta: TWideStringField;
    qMovimentovalor: TFloatField;
    qMovimentoconta: TWideStringField;
    qMovimentonome_cliente: TStringField;
    qContanome_cliente: TStringField;
    qRelConsolidado: TFDQuery;
    dsRelConsolidado: TDataSource;
    qRelAnalitico: TFDQuery;
    dsRelAnalitico: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGeral: TdmGeral;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmGeral.DataModuleCreate(Sender: TObject);
begin
// Busca arquivo BD na mesma pasta do EXE...
  dmconexao.dmGeral.FDConnection.Params.dataBase:= System.SysUtils.GetCurrentDir +'\sis_bancario.db';
  dmconexao.dmGeral.FDConnection.Connected:=True;
end;

procedure TdmGeral.DataModuleDestroy(Sender: TObject);
begin
  dmconexao.dmGeral.FDConnection.Connected:=False;
end;

end.
