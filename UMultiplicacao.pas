unit UMultiplicacao;

interface

uses UOperacao;

type
  TMultiplicacao = class(TOperacao)
    public
    function CalculaOperacao(A, B: Double): Double; override;
  end;

implementation

function TMultiplicacao.CalculaOperacao(A: Double; B: Double): Double;
begin
  Result := A * B;
end;

end.
