unit UFatorial;

interface

uses UOperacao, SysUtils;

type
  TFatorial = class(TOperacao)
 private
    // Função que calcula fatorial de forma iterativa
    function FatorialIterativo(N: Integer): Int64;
  public
    function CalculaOperacao(A, B: Double): Double; override;
  end;

implementation

function TFatorial.FatorialIterativo(N: Integer): Int64;
var
  i: Integer;
begin
  Result := 1;
  for i := 2 to N do
    Result := Result * i;
end;


function TFatorial.CalculaOperacao(A, B: Double): Double;
begin
  if Frac(A) <> 0 then
    raise Exception.Create('O fatorial só pode ser calculado para números inteiros.');

  if A < 0 then
    raise Exception.Create('O fatorial não pode ser calculado para números negativos.');

  Result := FatorialIterativo(Trunc(A));
end;

end.
