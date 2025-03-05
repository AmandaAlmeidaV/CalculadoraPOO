unit USubtracao;

interface

uses UOperacao;

type
  TSubtracao=  class(TOperacao)
    public
      function CalculaOperacao(A, B: Double): Double; override;
  end;

implementation

function TSubtracao.CalculaOperacao(A: Double; B: Double): Double;
begin
  Result := A - B;
end;

end.
