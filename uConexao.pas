unit uConexao;

interface

uses System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.ConsoleUI.Wait,
  Data.DB, FireDAC.Comp.Client,

  // -- POSTGRESQL --
  FireDAC.Phys.PGDef,
  FireDAC.Phys.PGWrapper,
  FireDAC.Phys.PG,

  // -- MYSQL --
  FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL,

  // -- MYSQLITE --
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLite,

  System.IniFiles;

type
    TConnection = class
    private

    public
        class procedure CarregarConfig(Connection: TFDConnection);
        class function CreateConnection: TFDConnection;
    end;

//Const ARQ_INI = 'D:\JornadaDev\Backend Horse\server.ini';


implementation

{ TConnection }

class procedure TConnection.CarregarConfig(Connection: TFDConnection);
var
    ini : TIniFile;
    arq_ini : string;
begin
    try
        arq_ini := GetCurrentDir + '\server.ini';

        // Instanciar arquivo INI...
        ini := TIniFile.Create(ARQ_INI);
        Connection.DriverName := ini.ReadString('Banco de Dados', 'DriverID', '');

        // Buscar dados do arquivo fisico...
        with Connection.Params do
        begin
            Clear;
            Add('DriverID=' + ini.ReadString('Banco de Dados', 'DriverID', ''));

            if ini.ReadString('Banco de Dados', 'Database', '') <> '' then
                Add('Database=' + ini.ReadString('Banco de Dados', 'Database', ''));

            if ini.ReadString('Banco de Dados', 'User_name', '') <> '' then
                Add('User_Name=' + ini.ReadString('Banco de Dados', 'User_name', ''));

            if ini.ReadString('Banco de Dados', 'Password', '') <> '' then
                Add('Password=' + ini.ReadString('Banco de Dados', 'Password', ''));

            if ini.ReadString('Banco de Dados', 'Protocol', '') <> '' then
                Add('Protocol=' + ini.ReadString('Banco de Dados', 'Protocol', ''));

            if ini.ReadString('Banco de Dados', 'Server', '') <> '' then
                Add('Server=' + ini.ReadString('Banco de Dados', 'Server', ''));

            if ini.ReadString('Banco de Dados', 'Port', '') <> '' then
                Add('Port=' + ini.ReadString('Banco de Dados', 'Port', ''));
        end;

    finally
        if Assigned(ini) then
            ini.DisposeOf;
    end;
end;

class function TConnection.CreateConnection: TFDConnection;
var
    Conn: TFDConnection;
begin
    Conn := TFDConnection.Create(nil);
    CarregarConfig(Conn);
    Conn.Connected := true;
    Result := Conn;
end;

end.
