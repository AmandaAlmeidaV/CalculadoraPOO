unit URaizQuadrada;

interface

uses UOperacao, SysUtils, Math;

type
  TRaizQuadrada = class(TOperacao)
    public
      function CalculaOperacao(A, B: Double): Double; override;
  end;

implementation

function TRaizQuadrada.CalculaOperacao(A: Double; B: Double): Double;
begin
  if A < 0 then
  raise Exception.Create('Erro: N�o � poss�vel calcular a raiz de um n�mero negativo!')
  else
    Result := Sqrt(A);
end;

end.
