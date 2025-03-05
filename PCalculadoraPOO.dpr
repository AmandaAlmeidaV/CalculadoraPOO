program PCalculadoraPOO;

uses
  Forms,
  UCalculadora in 'UCalculadora.pas' {Form1},
  USoma in 'USoma.pas',
  USubtracao in 'USubtracao.pas',
  UMultiplicacao in 'UMultiplicacao.pas',
  URaizQuadrada in 'URaizQuadrada.pas',
  UDivisao in 'UDivisao.pas',
  UOperacao in 'UOperacao.pas',
  UFatorial in 'UFatorial.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
