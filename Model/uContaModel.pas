unit uContaModel;

interface

uses
  System.SysUtils, DmConexao, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef;


type
  TConta = class

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

    procedure Pesquisar(sPesquisa: String);
    procedure CarregarConta(oConta: TConta; iCodigo: String);
    function InserirConta(oConta: TConta; sErro: String): Boolean;
    function ExcluirConta(iCodigo: Integer; sErro: String): Boolean;
    function AlterarConta(oConta: TConta; sErro: String): Boolean;
    function ValidaConta(iCodigo: Integer): Boolean;
  end;

implementation

{ TConta }

function TConta.AlterarConta(oConta: TConta; sErro: String): Boolean;
var
  qryAlterar : TFDQuery;
  tx :  TFDTransaction;
begin
  try
    Result := True;
    qryAlterar := TFDQuery.Create(nil);
    qryAlterar.Connection:= dmConexao.dmGeral.FDConnection;
    qryAlterar.SQL.Clear;
    qryAlterar.SQL.Add('UPDATE conta SET id_cliente = :id_cliente, nome_banco = :nome_banco, conta = :conta, ativa = :ativa');
    qryAlterar.SQL.Add(' WHERE id_conta = :id_conta');
    qryAlterar.ParamByName('id_cliente').AsInteger :=  oConta.id_cliente;
    qryAlterar.ParamByName('nome_banco').AsString  :=  oConta.nome_banco;
    qryAlterar.ParamByName('conta')     .AsString  :=  oConta.conta;
    qryAlterar.ParamByName('ativa')     .AsString  :=  oConta.ativa;
    qryAlterar.ParamByName('id_conta')  .AsInteger :=  oConta.id_conta;
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

procedure TConta.CarregarConta(oConta: TConta; iCodigo: String);
var
  qrySelect : TFDQuery;
  tx :  TFDTransaction;
begin
  qrySelect := TFDQuery.Create(nil);
  qrySelect.Connection:= dmConexao.dmGeral.FDConnection;
  qrySelect.SQL.Clear;
  qrySelect.SQL.Add('Select con.*, cli.nome as nome_cliente from conta as con inner join cliente as cli on cli.id_cliente = con.id_cliente where id_conta = :iCodigo');
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
                oConta.id_conta     := qrySelect.FieldByName('id_conta').AsInteger;
                oConta.id_cliente   := qrySelect.FieldByName('id_cliente').AsInteger;
                oConta.Nome_banco   := qrySelect.FieldByName('Nome_banco').AsString;
                oConta.Nome_cliente := qrySelect.FieldByName('Nome_cliente').AsString;
                oConta.conta        := qrySelect.FieldByName('conta').AsString;
                oConta.ativa        := qrySelect.FieldByName('ativa').AsString;
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

function TConta.ExcluirConta(iCodigo: Integer; sErro: String): Boolean;
var
  qryDelete : TFDQuery;
  tx :  TFDTransaction;
begin
  if ValidaConta(iCodigo) then
  begin
     try
        if dmconexao.dmGeral.qConta.Active then
          dmconexao.dmGeral.qConta.Active := false;

        Result := True;
        qryDelete := TFDQuery.Create(nil);
        qryDelete.Connection:= dmConexao.dmGeral.FDConnection;
        qryDelete.SQL.Clear;
        qryDelete.SQL.Add('DELETE From conta Where id_conta = :iCodigo');
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
  end
  else
    sErro := 'Conta possui movimenta��o';

end;

function TConta.InserirConta(oConta: TConta; sErro: String): Boolean;
  var
  qryInsert : TFDQuery;
  tx :  TFDTransaction;
begin
  try
    Result := True;

    if dmconexao.dmGeral.qConta.Active then
      dmconexao.dmGeral.qConta.Active := false;
    qryInsert := TFDQuery.Create(nil);
    qryInsert.Connection:= dmConexao.dmGeral.FDConnection;
    qryInsert.SQL.Clear;
    qryInsert.SQL.Add('INSERT INTO conta ( id_cliente, nome_banco, conta, ativa )');
    qryInsert.SQL.Add(' VALUES ( :id_cliente, :nome_banco, :conta, :ativa );');
    qryInsert.ParamByName('id_cliente').AsInteger := oConta.id_cliente;
    qryInsert.ParamByName('nome_banco').AsString := oConta.nome_banco;
    qryInsert.ParamByName('conta')     .AsString := oConta.conta;
    qryInsert.ParamByName('ativa')     .AsString := oConta.ativa;
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
    if not dmconexao.dmGeral.qConta.Active then
      dmconexao.dmGeral.qConta.Active := true;
  end;

end;

procedure TConta.Pesquisar(sPesquisa: String);
begin
    if not dmconexao.dmGeral.qConta.Active then
      dmconexao.dmGeral.qConta.Active := true;

    if sPesquisa	 <> '' then
      dmconexao.dmGeral.qConta.SQL.Text:= 'Select con.*, cli.nome as nome_cliente from conta as con inner join cliente as cli on cli.id_cliente = con.id_cliente where cli.nome like ' + QuotedStr('%' + sPesquisa + '%') + ' order by 1'
    else
      dmconexao.dmGeral.qConta.SQL.Text:= 'Select con.*, cli.nome as nome_cliente from conta as con inner join cliente as cli on cli.id_cliente = con.id_cliente order by 1';

    dmconexao.dmGeral.qConta.Active := false;
    dmconexao.dmGeral.qConta.Open;
end;

function TConta.ValidaConta(iCodigo: Integer): Boolean;
var
  qrySelect : TFDQuery;
  tx :  TFDTransaction;
begin
  qrySelect := TFDQuery.Create(nil);
  qrySelect.Connection:= dmConexao.dmGeral.FDConnection;
  qrySelect.SQL.Clear;
  qrySelect.SQL.Add('Select * from movimento as mov where id_conta = :iCodigo');
  qrySelect.ParamByName('iCodigo').AsString := inttostr(iCodigo);
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
              result:= False
            else
               result:= True;

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

end.
