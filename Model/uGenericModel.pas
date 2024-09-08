unit uGenericModel;

interface

uses
  System.SysUtils, System.Variants, System.Rtti, System.TypInfo, DmConexao, Data.DB, Data.SqlExpr, FireDAC.Phys.PGDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, Data.DbxSqlite, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Datasnap.DBClient, Datasnap.Provider, uFuncoes, System.Generics.Collections,
  Vcl.DBGrids;

type
  TRepositorio<T> = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function Inserir(const ATabela: String; const ACampos: TArray<String>; const AValores: TArray<Variant>; out sErro: String): Boolean;
    function Alterar(const ATabela: String; const AChave: String; const ACampos: TArray<String>; const AValores: TArray<Variant>; const AId: Integer; out sErro: String): Boolean;
    function Excluir(const ATabela: String; const AChave: String; const AId: Integer; out sErro: String): Boolean;
    function Carregar(const ATabela: String; const AChave: String; const AId: Integer; const ACampos: TArray<String>; out sErro: String):T;
    Procedure Consultar(ATableName, AFiltro: string; AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
  end;

implementation

{ TRepositorio<T> }

constructor TRepositorio<T>.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TRepositorio<T>.Excluir(const ATabela, AChave: String; const AId: Integer; out sErro: String): Boolean;
var
  Query: TFDQuery;
  SQL: String;
begin
  Result := False;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    SQL := 'DELETE FROM ' + ATabela + ' WHERE '+ AChave +' = :id';
    Query.SQL.Text := SQL;
    Query.ParamByName('id').AsInteger := AId;

    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TRepositorio<T>.Inserir(const ATabela: String; const ACampos: TArray<String>; const AValores: TArray<Variant>; out sErro: String): Boolean;
var
  Query: TFDQuery;
  tx: TFDTransaction;
  I: Integer;
  SQL: String;
  Data: TDateTime;
begin
  Result := False;
  if Length(ACampos) <> Length(AValores) then
    Exit; // Número de campos e valores deve ser igual

  Query := TFDQuery.Create(nil);
  tx := TFDTransaction.Create(nil);
  try
    Query.Connection := FConnection;
    tx.Connection := Query.Connection;
    tx.StartTransaction;

    SQL := 'INSERT INTO ' + ATabela + ' (' + String.Join(', ', ACampos) + ') VALUES (';
    for I := 0 to High(ACampos) do
    begin
      if I > 0 then
        SQL := SQL + ', ';
      SQL := SQL + ':' + ACampos[I];
    end;
    SQL := SQL + ')';
    Query.SQL.Text := SQL;

    for I := 0 to High(ACampos) do
    begin
      if (VarIsNumeric(AValores[I]) and TryFloatToDateTime(AValores[I], Data)) then
        Query.ParamByName(ACampos[I]).AsDate := AValores[I]
      else
        Query.ParamByName(ACampos[I]).Value := AValores[I];
    end;

    try
      Query.ExecSQL;
      tx.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        sErro := E.Message;
        tx.Rollback;
      end;
    end;
  finally
    Query.Free;
  end;
end;

function TRepositorio<T>.Alterar(const ATabela: String; const AChave: String; const ACampos: TArray<String>; const AValores: TArray<Variant>; const AId: Integer; out sErro: String): Boolean;
var
  Query: TFDQuery;
  I: Integer;
  SQL: String;
  Data: TDateTime;
begin
  Result := False;
  if Length(ACampos) <> Length(AValores) then
    Exit; // Número de campos e valores deve ser igual

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    SQL := 'UPDATE ' + ATabela + ' SET ';
    for I := 0 to High(ACampos) do
    begin
      if I > 0 then
        SQL := SQL + ', ';
      SQL := SQL + ACampos[I] + ' = :' + ACampos[I];
    end;
    SQL := SQL + ' WHERE ' + AChave + ' = :id';
    Query.SQL.Text := SQL;

    for I := 0 to High(ACampos) do
    begin
      if VarIsType(AValores[I], varDate) then
        Query.ParamByName(ACampos[I]).AsDate := AValores[I]
      else if VarIsNumeric(AValores[I]) and TryFloatToDateTime(AValores[I], Data) then
        Query.ParamByName(ACampos[I]).AsDate := Data
      else
        Query.ParamByName(ACampos[I]).Value := AValores[I];
    end;

    Query.ParamByName('id').AsInteger := AId;

    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;


function TRepositorio<T>.Carregar(const ATabela, AChave: String; const AId: Integer; const ACampos: TArray<String>; out sErro: String): T;
var
  Query: TFDQuery;
  SQL: String;
  i: Integer;
  Context: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
  Instance: TValue;
  FieldValue: TValue;
  ConstructorMethod: TRttiMethod;
begin
  Result := Default(T);
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    SQL := 'SELECT ' + String.Join(', ', ACampos) + ' FROM ' + ATabela + ' WHERE ' + AChave + ' = :id';
//    SQL := 'SELECT * FROM ' + ATabela + ' WHERE ' + AChave + ' = :id';
    Query.SQL.Text := SQL;
    Query.ParamByName('id').AsInteger := AId;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Context := TRttiContext.Create;
      try
        RttiType := Context.GetType(TypeInfo(T));
        ConstructorMethod := RttiType.GetMethod('Create');
        if Assigned(ConstructorMethod) and (Length(ConstructorMethod.GetParameters) = 1) then
          Instance := ConstructorMethod.Invoke(RttiType.AsInstance.MetaclassType, [FConnection])
        else
          raise Exception.Create('A classe não possui um construtor adequado.');

        for i := 0 to High(ACampos) do
        begin
          RttiProperty := RttiType.GetProperty(ACampos[i]);
          if Assigned(RttiProperty) then
          begin
            FieldValue := TValue.FromVariant(Query.FieldByName(ACampos[i]).Value);
            if FieldValue.IsType<TDate> then
              RttiProperty.SetValue(Instance.AsObject, TValue.From<TDateTime>(FieldValue.AsType<TDate>))
            else
              RttiProperty.SetValue(Instance.AsObject, FieldValue);
          end;
        end;
        Result := Instance.AsType<T>;
      finally
        Context.Free;
        Query.Free;
      end;
    end;
  except
    on E: Exception do
    begin
      sErro := E.Message;
      Exit;
    end;
  end;
end;

procedure TRepositorio<T>.Consultar(ATableName, AFiltro: string; AQuery: TFDQuery; ADataSource: TDataSource; ADBGrid: TDBGrid);
begin
  AQuery.Close;
  AQuery.SQL.Text := 'SELECT * FROM ' + ATableName;

  if afiltro <> '' then
    AQuery.SQL.Text := AQuery.SQL.Text + ' '+ AFiltro;

  AQuery.Open;
  ADataSource.DataSet := AQuery;
  ADBGrid.DataSource := ADataSource;
end;

function TryFloatToDateTime(const AValue: Variant; out ADateTime: TDateTime): Boolean;
begin
  try
    ADateTime := TDateTime(AValue);
    Result := True;
  except
    Result := False;
  end;
end;
end.
