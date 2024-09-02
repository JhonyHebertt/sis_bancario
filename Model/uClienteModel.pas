unit uClienteModel;

interface

uses
  System.SysUtils, DmConexao, Data.DB, Data.SqlExpr, FireDAC.Phys.PGDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, Data.DbxSqlite, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Datasnap.DBClient, Datasnap.Provider, uFuncoes;

type
  TCliente = class
  private
    FID_Cliente: Integer;
    FNome: String;
    FData_nascimento: tDate;
    FDocumento: String;
    FTelefone: String;
    FEmail: String;
  public
    procedure Pesquisar(sNome: String);
    procedure CarregarCliente(oCliente: TCliente; iCodigo: String);
    function InserirCliente(oCliente: TCliente; sErro: String): Boolean;
    function ExcluirCliente(iCodigo: Integer; sErro: String): Boolean;
    function AlterarCliente(oCliente: TCliente; sErro: String): Boolean;
    function  ValidaCliente(iCodigo: Integer): Boolean;

    property ID_CLIENTE: Integer read FID_Cliente write FID_Cliente;
    property Nome: String read FNome write FNome;
    property Data_nascimento: tDate read FData_nascimento write FData_nascimento;
    property Documento: String read FDocumento write FDocumento;
    property Telefone: String read FTelefone write FTelefone;
    property Email: String read FEmail write FEmail;
  end;
implementation
{ TCliente }

function TCliente.AlterarCliente(oCliente: TCliente; sErro: String): Boolean;
var
  qryAlterar : TFDQuery;
  tx :  TFDTransaction;
begin
  try
    Result := True;
    qryAlterar := TFDQuery.Create(nil);
    qryAlterar.Connection:= dmConexao.dmGeral.FDConnection;
    qryAlterar.SQL.Clear;
    qryAlterar.SQL.Add('UPDATE Cliente SET Nome = :Nome, Documento = :Documento, Email = :Email, data_nascimento = :data_nascimento, telefone = :telefone');
    qryAlterar.SQL.Add(' WHERE ID_CLIENTE = :ID_CLIENTE');
    qryAlterar.ParamByName('Nome').AsString          :=  oCliente.Nome;
    qryAlterar.ParamByName('documento').AsString     :=  oCliente.documento;
    qryAlterar.ParamByName('email').AsString         :=  oCliente.email;
    qryAlterar.ParamByName('data_nascimento').AsDate :=  oCliente.data_nascimento;
    qryAlterar.ParamByName('telefone').AsString      :=  oCliente.telefone;
    qryAlterar.ParamByName('ID_CLIENTE').AsInteger   :=  oCliente.ID_CLIENTE;
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

procedure TCliente.CarregarCliente(oCliente: TCliente; iCodigo: String);
var
  qrySelect : TFDQuery;
  tx :  TFDTransaction;
begin
  qrySelect := TFDQuery.Create(nil);
  qrySelect.Connection:= dmConexao.dmGeral.FDConnection;
  qrySelect.SQL.Clear;
  qrySelect.SQL.Add('Select * from Cliente where ID_CLIENTE = :iCodigo');
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
                oCliente.ID_CLIENTE     := qrySelect.FieldByName('ID_CLIENTE').AsInteger;
                oCliente.Nome           := qrySelect.FieldByName('Nome').AsString;
                oCliente.Documento      := qrySelect.FieldByName('Documento').AsString;
                oCliente.Email          := qrySelect.FieldByName('Email').AsString;
                oCliente.Data_nascimento:= qrySelect.FieldByName('Data_nascimento').AsDateTime;
                oCliente.Telefone       := qrySelect.FieldByName('Telefone').AsString;
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

function TCliente.ExcluirCliente(iCodigo: Integer; sErro: String): Boolean;
var
  qryDelete : TFDQuery;
  tx :  TFDTransaction;
begin
   if ValidaCliente(iCodigo) then
  begin
     try
       if dmconexao.dmGeral.qCliente.Active then
        dmconexao.dmGeral.qCliente.Active := false;
        Result := True;
        qryDelete := TFDQuery.Create(nil);
        qryDelete.Connection:= dmConexao.dmGeral.FDConnection;
        qryDelete.SQL.Clear;
        qryDelete.SQL.Add('DELETE From Cliente Where id_cliente = :iCodigo');
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
    sErro := 'Cliente possui Conta';

end;

function TCliente.InserirCliente(oCliente: TCliente; sErro: String): Boolean;
  var
  qryInsert : TFDQuery;
  tx :  TFDTransaction;
begin
  try
    Result := True;
    qryInsert := TFDQuery.Create(nil);
    qryInsert.Connection:= dmConexao.dmGeral.FDConnection;
    qryInsert.SQL.Clear;
    qryInsert.SQL.Add('INSERT INTO Cliente (nome,data_nascimento,documento,telefone,email)');
    qryInsert.SQL.Add('VALUES(:nome,:data_nascimento,:documento,:telefone,:email);');
    qryInsert.ParamByName('Nome')           .AsString := oCliente.Nome;
    qryInsert.ParamByName('data_nascimento').AsDate := oCliente.data_nascimento;
    qryInsert.ParamByName('documento')      .AsString := oCliente.documento;
    qryInsert.ParamByName('telefone')       .AsString := oCliente.telefone;
    qryInsert.ParamByName('email')          .AsString := oCliente.email;
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
    FreeAndNil(qryInsert)
  end;

end;

procedure TCliente.Pesquisar(sNome: String);
var
  oFuncoes : TFuncoes;
begin
   if not dmconexao.dmGeral.qCliente.Active then
    dmconexao.dmGeral.qCliente.Active := true;

    if sNome	 <> '' then
    begin
      oFuncoes := TFuncoes.Create;
      sNome := oFuncoes.RemoveSpecialChars(sNome);
      sNome := oFuncoes.RemoveAccents(sNome);
      dmconexao.dmGeral.qCliente.SQL.Text:= 'select * from cliente where nome like ' + QuotedStr('%' + sNome + '%') + ' order by 1';
    end
    else
      dmconexao.dmGeral.qCliente.SQL.Text:= 'select * from cliente';

    dmconexao.dmGeral.qCliente.Active := false;
    dmconexao.dmGeral.qCliente.Open;
end;
function TCliente.ValidaCliente(iCodigo: Integer): Boolean;
var
  qrySelect : TFDQuery;
  tx :  TFDTransaction;
begin
  qrySelect := TFDQuery.Create(nil);
  qrySelect.Connection:= dmConexao.dmGeral.FDConnection;
  qrySelect.SQL.Clear;
  qrySelect.SQL.Add('Select * from conta as mov where id_cliente = :iCodigo');
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
