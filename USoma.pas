unit USoma;

interface

uses
  SysUtils, StdCtrls, Dialogs, UOperacao ;

type
  TSoma = class(TOperacao)
  public
    function CalculaOperacao(A, B: Double): Double; override;
  end;

implementation

function TSoma.CalculaOperacao(A: Double; B: Double): Double;
begin
  Result := A + B;
end;


end.
