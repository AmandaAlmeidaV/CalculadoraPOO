unit UDivisao;

interface

uses UOperacao, SysUtils;

type
 TDivisao = class(TOperacao)
   public
   function CalculaOperacao(A, B: Double): Double; override;
 end;

implementation

function TDivisao.CalculaOperacao(A: Double; B: Double): Double;
begin
  if B = 0 then
    raise Exception.Create('Divisão por zero!');

  Result := A / B;
end;

end.
