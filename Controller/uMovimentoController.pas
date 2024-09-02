unit uMovimentoController;

interface

uses
  uMovimentoModel, System.SysUtils;

  type
  TMovimentoController = class
  private
  public
    procedure Pesquisar(sCliente: String);
    procedure CarregarMovimento(oMovimento: TMovimento; iCodigo: String);
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
   oMovimentos := TMovimento.Create;
   try
     result:= oMovimentos.AlterarMovimento(oMovimento, sErro );
   finally
     FreeAndNil(oMovimentos);
   end;

end;

procedure TMovimentoController.CarregarMovimento(oMovimento: TMovimento;  iCodigo: String);
var
  oMovimentos : TMovimento;
begin
   oMovimentos := TMovimento.Create;
   try
     oMovimentos.CarregarMovimento(oMovimento, iCodigo );
   finally
     FreeAndNil(oMovimentos);
   end;

end;

function TMovimentoController.ExcluirMovimento(iCodigo: Integer;
  sErro: String): Boolean;
var
  oMovimentos : TMovimento;
begin
   oMovimentos := TMovimento.Create;
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
   oMovimentos := TMovimento.Create;
   try
     Result := oMovimentos.InserirMovimento(oMovimento, sErro);
   finally
     FreeAndNil(oMovimentos);
   end;

end;

procedure TMovimentoController.Pesquisar(sCliente: String);
var
  oMovimentos : TMovimento;
begin
   oMovimentos := TMovimento.Create;
   try
     oMovimentos.Pesquisar(sCliente);
   finally
     FreeAndNil(oMovimentos);
   end;

end;

end.
