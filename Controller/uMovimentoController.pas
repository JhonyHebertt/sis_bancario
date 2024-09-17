unit uMovimentoController;

interface

uses
  uMovimentoModel, System.SysUtils,  FireDAC.Comp.Client, Data.DB, Vcl.DBGrids;

  type
  TMovimentoController = class
  private
  public
    procedure Pesquisar(AFiltro: String; AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
    procedure CarregarMovimento(oMovimento: TMovimento; iCodigo: String; sErro: String);
    function InserirMovimento(oMovimento: TMovimento; sErro: String): Boolean;
    function ExcluirMovimento(iCodigo: Integer; sErro: String): Boolean;
    function AlterarMovimento(oMovimento: TMovimento; sErro: String): Boolean;
  end;
implementation

{ TMovimentoController }

function TMovimentoController.AlterarMovimento(oMovimento: TMovimento;
  sErro: String): Boolean;
var
  oMovimentos : TMovimento;
begin
   oMovimentos := TMovimento.Create(Nil);
   try
     result:= oMovimentos.AlterarMovimento(oMovimento, sErro );
   finally
     FreeAndNil(oMovimentos);
   end;

end;

procedure TMovimentoController.CarregarMovimento(oMovimento: TMovimento;  iCodigo: String; sErro: String);
var
  oMovimentos : TMovimento;
begin
   oMovimentos := TMovimento.Create(Nil);
   try
     oMovimentos.CarregarMovimento(oMovimentos, iCodigo, sErro );
     if sErro = '' then
     begin
       oMovimento.id_movimento := oMovimentos.id_movimento;
       oMovimento.id_conta     := oMovimentos.id_conta;
       oMovimento.tp_mov       := oMovimentos.tp_mov;
       oMovimento.data         := oMovimentos.data;
       oMovimento.valor	       := oMovimentos.valor;
       oMovimento.conta        := oMovimentos.conta;
       oMovimento.Nome_cliente := oMovimentos.Nome_cliente;
     end;
   finally
     FreeAndNil(oMovimentos);
   end;

end;

function TMovimentoController.ExcluirMovimento(iCodigo: Integer;
  sErro: String): Boolean;
var
  oMovimentos : TMovimento;
begin
   oMovimentos := TMovimento.Create(Nil);
   try
     Result :=  oMovimentos.ExcluirMovimento(iCodigo, sErro);
   finally
     FreeAndNil(oMovimentos);
   end;

end;

function TMovimentoController.InserirMovimento(oMovimento: TMovimento;
  sErro: String): Boolean;
var
  oMovimentos : TMovimento;
begin
   oMovimentos := TMovimento.Create(Nil);
   try
     Result := oMovimentos.InserirMovimento(oMovimento, sErro);
   finally
     FreeAndNil(oMovimentos);
   end;

end;

procedure TMovimentoController.Pesquisar(AFiltro: String; AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
var
  oMovimentos : TMovimento;
begin
   oMovimentos := TMovimento.Create(Nil);
   try
     oMovimentos.Pesquisar('vw_movimento', AFiltro, AQuery, ADataSource, ADBGrid);
   finally
     FreeAndNil(oMovimentos);
   end;

end;

end.
