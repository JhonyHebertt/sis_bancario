unit uMovimentoModel;

interface

uses
  System.SysUtils, DmConexao, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef;

  type
  TMovimento = class

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

    procedure Pesquisar(sCliente: String);
    procedure CarregarMovimento(oMovimento: TMovimento; iCodigo: String);
    function InserirMovimento(oMovimento: TMovimento; sErro: String): Boolean;
    function ExcluirMovimento(iCodigo: Integer; sErro: String): Boolean;
    function AlterarMovimento(oMovimento: TMovimento; sErro: String): Boolean;
  end;

implementation

{ TMovimento }

function TMovimento.AlterarMovimento(oMovimento: TMovimento; sErro: String): Boolean;
var
  qryAlterar : TFDQuery;
  tx :  TFDTransaction;
begin
  try
    Result := True;
    qryAlterar := TFDQuery.Create(nil);
    qryAlterar.Connection:= dmConexao.dmGeral.FDConnection;
    qryAlterar.SQL.Clear;
    qryAlterar.SQL.Add('UPDATE movimento SET id_conta = :id_conta,  tp_mov = :tp_mov, data = :data, valor = :valor');
    qryAlterar.SQL.Add(' WHERE id_movimento = :id_movimento');
    qryAlterar.ParamByName('id_conta')    .AsInteger :=  oMovimento.id_conta;
    qryAlterar.ParamByName('tp_mov')      .AsString  :=  oMovimento.tp_mov;
    qryAlterar.ParamByName('data')        .AsDate    :=  oMovimento.data;
    qryAlterar.ParamByName('valor')      .AsFloat   :=  oMovimento.valor;
    qryAlterar.ParamByName('id_movimento').AsInteger :=  oMovimento.id_movimento;
    tx := TFDTransaction.Create(nil);
    try
      tx.Connection := qryAlterar.Connection;
      tx.StartTransaction; // Iniciar a transa��o
      try
        qryAlterar.ExecSQL; // Executar a query
        tx.Commit; // Commitar a transa��o
        Result := True; // Se chegou at� aqui sem exce��o, opera��o foi bem sucedida
      except
        on E: Exception do
        begin
          sErro := E.Message; // Capturar mensagem de erro
          tx.Rollback; // Reverter a transa��o em caso de erro
        end;
      end;
    finally
      tx.Free; // Liberar a transa��o
    end;
  finally
    FreeAndNil(qryAlterar)
  end;

end;

procedure TMovimento.CarregarMovimento(oMovimento: TMovimento; iCodigo: String);
var
  qrySelect : TFDQuery;
  tx :  TFDTransaction;
begin
  qrySelect := TFDQuery.Create(nil);
  qrySelect.Connection:= dmConexao.dmGeral.FDConnection;
  qrySelect.SQL.Clear;
  qrySelect.SQL.Add('SELECT mv.*, co.conta, ci.nome as nome_cliente FROM movimento as mv left join conta as co on co.id_conta = mv.id_conta left join cliente as ci on ci.id_cliente = co.id_cliente where id_movimento = :iCodigo');
  qrySelect.ParamByName('iCodigo').AsString := iCodigo;
  tx := TFDTransaction.Create(nil);
    try
      tx.Connection := qrySelect.Connection;
      tx.StartTransaction; // Iniciar a transa��o
      tx := TFDTransaction.Create(nil);
      try
          tx.Connection := qrySelect.Connection;
          tx.StartTransaction; // Iniciar a transa��o
          try
            qrySelect.Open; // Abrir a consulta SQL
            if not qrySelect.IsEmpty then
              begin
                oMovimento.id_movimento := qrySelect.FieldByName('id_movimento').AsInteger;
                oMovimento.id_conta     := qrySelect.FieldByName('id_conta').AsInteger;
                oMovimento.tp_mov       := qrySelect.FieldByName('tp_mov').AsString;
                oMovimento.data         := strtodate(qrySelect.FieldByName('data').AsString);
                oMovimento.valor        := qrySelect.FieldByName('valor').AsFloat;
                oMovimento.conta        := qrySelect.FieldByName('conta').AsString;
                oMovimento.nome_cliente := qrySelect.FieldByName('nome_cliente').AsString;
              end;
              tx.Commit; // Commitar a transa��o
            except
              on E: Exception do
              begin
                tx.Rollback; // Reverter a transa��o em caso de erro
              end;
          end;
        finally
          tx.Free; // Liberar a transa��o
      end;
    finally
    end;

end;

function TMovimento.ExcluirMovimento(iCodigo: Integer; sErro: String): Boolean;
var
  qryDelete : TFDQuery;
  tx :  TFDTransaction;
begin
   try
   if dmconexao.dmGeral.qConta.Active then
    dmconexao.dmGeral.qConta.Active := false;
    Result := True;
    qryDelete := TFDQuery.Create(nil);
    qryDelete.Connection:= dmConexao.dmGeral.FDConnection;
    qryDelete.SQL.Clear;
    qryDelete.SQL.Add('DELETE From movimento Where id_movimento = :iCodigo');
    qryDelete.ParamByName('iCodigo').AsInteger := iCodigo;
    tx := TFDTransaction.Create(nil);
    try
      tx.Connection := qryDelete.Connection;
      tx.StartTransaction; // Iniciar a transa��o
      try
        qryDelete.ExecSQL; // Executar a query
        tx.Commit; // Commitar a transa��o
        Result := True; // Se chegou at� aqui sem exce��o, opera��o foi bem sucedida
      except
        on E: Exception do
        begin
          sErro := E.Message; // Capturar mensagem de erro
          tx.Rollback; // Reverter a transa��o em caso de erro
        end;
      end;
    finally
      tx.Free; // Liberar a transa��o
    end;
  finally
    FreeAndNil(qryDelete)
  end;

end;

function TMovimento.InserirMovimento(oMovimento: TMovimento; sErro: String): Boolean;
var
  qryInsert : TFDQuery;
  tx :  TFDTransaction;
begin
  try
    Result := True;

    if dmconexao.dmGeral.qMovimento.Active then
      dmconexao.dmGeral.qMovimento.Active := false;
    if dmconexao.dmGeral.qListConta.Active then
      dmconexao.dmGeral.qListConta.Active:=False;

    qryInsert := TFDQuery.Create(nil);
    qryInsert.Connection:= dmConexao.dmGeral.FDConnection;
    qryInsert.SQL.Clear;
    qryInsert.SQL.Add('INSERT INTO movimento ( id_conta, tp_mov, data, valor )');
    qryInsert.SQL.Add(' VALUES ( :id_conta, :tp_mov, :data, :valor );');
    qryInsert.ParamByName('id_conta').AsInteger:= oMovimento.id_conta;
    qryInsert.ParamByName('tp_mov')  .AsString := oMovimento.tp_mov;
    qryInsert.ParamByName('data')    .Asdate   := oMovimento.data;
    qryInsert.ParamByName('valor')   .AsFloat  := oMovimento.valor;
    tx := TFDTransaction.Create(nil);
    try
      tx.Connection := qryInsert.Connection;
      tx.StartTransaction; // Iniciar a transa��o
      try
        qryInsert.ExecSQL; // Executar a query
        tx.Commit; // Commitar a transa��o
        Result := True; // Se chegou at� aqui sem exce��o, opera��o foi bem sucedida
      except
        on E: Exception do
        begin
          sErro := E.Message; // Capturar mensagem de erro
          tx.Rollback; // Reverter a transa��o em caso de erro
          Result := False;
        end;
      end;
    finally
      tx.Free; // Liberar a transa��o
    end;
  finally
    FreeAndNil(qryInsert);
    if not dmconexao.dmGeral.qMovimento.Active then
      dmconexao.dmGeral.qMovimento.Active := true;
  end;

end;

procedure TMovimento.Pesquisar(sCliente: String);
begin
  if not dmconexao.dmGeral.qMovimento	.Active then
    dmconexao.dmGeral.qMovimento.Active := true;

    if sCliente	 <> '' then
      dmconexao.dmGeral.qMovimento.SQL.Text:= 'SELECT mv.*, co.conta, ci.nome as nome_cliente  FROM movimento as mv left join conta as co on co.id_conta = mv.id_conta left join cliente as ci on ci.id_cliente = co.id_cliente where ci.nome like ' + QuotedStr('%' + sCliente + '%') + ' order by 1'
    else
      dmconexao.dmGeral.qMovimento.SQL.Text:= 'SELECT mv.*, co.conta, ci.nome as nome_cliente FROM movimento as mv left join conta as co on co.id_conta = mv.id_conta left join cliente as ci on ci.id_cliente = co.id_cliente order by 1';

    dmconexao.dmGeral.qMovimento.Active := false;
    dmconexao.dmGeral.qMovimento.Open;
end;

end.
