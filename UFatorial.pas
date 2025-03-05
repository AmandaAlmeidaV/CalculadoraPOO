unit UFatorial;

interface

uses UOperacao, SysUtils;

type
  TFatorial = class(TOperacao)
 private
    // Fun��o que calcula fatorial de forma iterativa
    function FatorialIterativo(N: Integer): Int64;
  public
    function CalculaOperacao(A, B: Double): Double; override;
//    function GerarEquacaoFatorial(N: Integer): String; // Novo m�todo
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

{
function TFatorial.GerarEquacaoFatorial(N: Integer): String;
var
  i: Integer;
  Equacao: String;
begin
  Equacao := IntToStr(N) + '! = ';
  for i := N downto 1 do
  begin
    Equacao := Equacao + IntToStr(i);
    if i > 1 then
      Equacao := Equacao + ' � ';
  end;
  Equacao := Equacao + ' = ' + IntToStr(FatorialIterativo(N));
  Result := Equacao;
end;
}

function TFatorial.CalculaOperacao(A, B: Double): Double;
begin
  if Frac(A) <> 0 then
    raise Exception.Create('O fatorial s� pode ser calculado para n�meros inteiros.');

  if A < 0 then
    raise Exception.Create('O fatorial n�o pode ser calculado para n�meros negativos.');

  Result := FatorialIterativo(Trunc(A));
end;

end.
