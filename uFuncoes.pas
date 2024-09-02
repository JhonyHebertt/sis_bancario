unit uFuncoes;

interface

uses
  SysUtils;

type
  TFuncoes = class
  private
  public
    function RemoveSpecialChars(const Input: string): string;
    function RemoveAccents(const Input: string): string;
  end;

implementation

{ TFuncoes }

function TFuncoes.RemoveSpecialChars(const Input: string): string;
const
  SpecialChars = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+', '[', ']', '{', '}', '|', '\', ':', ';', '"', '''', '<', '>', ',', '.', '?', '/', '`', '~'];
var
  i: Integer;
  ResultStr: string;
begin
  ResultStr := Input;
  for i := Length(ResultStr) downto 1 do
  begin
    if Pos(ResultStr[i], '!@#$%^&*()-_=+[]{}|:;''"<>,.?/`~') > 0 then
      Delete(ResultStr, i, 1);
  end;
  Result := ResultStr;

end;

function TFuncoes.RemoveAccents(const Input: string): string;
const
  Accents: array[0..13] of string = ('á', 'é', 'í', 'ó', 'ú', 'Á', 'É', 'Í', 'Ó', 'Ú', 'ã', 'õ', 'Ã', 'Õ');
  Replacements: array[0..13] of string = ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U', 'a', 'o', 'A', 'O');
var
  i: Integer;
  ResultStr: string;
begin
  ResultStr := Input;
  for i := Low(Accents) to High(Accents) do
    ResultStr := StringReplace(ResultStr, Accents[i], Replacements[i], [rfReplaceAll]);
  Result := ResultStr;
end;

end.
