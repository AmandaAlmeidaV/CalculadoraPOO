unit UOperacao;

interface

uses SysUtils;

type
    TOperacao = class
    public
    function CalculaOperacao(A, B: Double): Double; virtual; abstract;
    end;
{
    TOperacaoSoma = class(TOperacao)
    function Calcular(A, B: Double): Double; override;
    end;

    TOperacaoSubtracao = class(TOperacao)
    function Calcular(A, B: Double): Double; override;
    end;

    TOperacaoMultiplicacao = class(TOperacao)
    function Calcular(A, B: Double): Double; override;
    end;

    TOperacaoDivisao = class(TOperacao)
    function Calcular(A, B: Double): Double; override;
    end;
}


implementation

{

function TOperacaoSoma.Calcular(A, B: Double): Double;
begin
  Result := A + B;
end;

function TOperacaoSubtracao.Calcular(A, B: Double): Double;
begin
  Result := A - B;
end;

function TOperacaoMultiplicacao.Calcular(A, B: Double): Double;
begin
  Result := A * B;
end;

function TOperacaoDivisao.Calcular(A, B: Double): Double;
begin
  if B = 0 then
   raise Exception.Create('Erro: Não se pode efetuar divisaõ por zero!');
  Result := A / B;
end;
}

end.
