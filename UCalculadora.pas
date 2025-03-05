unit UCalculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, USoma, USubtracao, Ufatorial, UOperacao, UDivisao, URaizQuadrada, UMultiplicacao;

type
  TForm1 = class(TForm)
    btnIgual: TButton;
    btnPonto: TButton;
    btn0: TButton;
    btnSoma: TButton;
    btnSubtração: TButton;
    btnMultiplicacao: TButton;
    btnDivisao: TButton;
    btnClear: TButton;
    btn3: TButton;
    btn6: TButton;
    btn9: TButton;
    btnRaizQuadrada: TButton;
    btnClearEntry: TButton;
    btn2: TButton;
    btn5: TButton;
    btn8: TButton;
    btn1: TButton;
    btn4: TButton;
    btn7: TButton;
    Edit1: TEdit;
    btnFatorial: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnNumeroClick(Sender: TObject);
    procedure btnPontoClick(Sender: TObject);
    procedure btnMultiplicacaoClick(Sender: TObject);
    procedure btnSubtracaoClick(Sender: TObject);
    procedure btnDivisaoClick(Sender: TObject);
    procedure btnClearEntryClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSomaClick(Sender: TObject);
    procedure btnRaizQuadradaClick(Sender: TObject);
    procedure plCalculaOperacao(Sender: TObject);
    procedure btnFatorialClick(Sender: TObject);
   private
     FNumero1: Double;
     //FOperacao: TOperacao;
     FCaracterOperacao:Char;
     FPrimeiroNumeroInserido: Boolean;
   public
   end;
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := '0';
  FNumero1 := 0;
  FPrimeiroNumeroInserido := False;
  //FOperacao := nil;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
// Faz a liberação da calculadora na memória
//  if Assigned(FOperacao) then
// FreeAndNil(FOperacao);
end;

 procedure TForm1.btnSomaClick(Sender: TObject);
begin
  FCaracterOperacao := '+';
  FNumero1 := StrToFloat(Edit1.Text);
  FPrimeiroNumeroInserido := True;
{
  if Assigned(FOperacao) then
    FreeAndNil(FOperacao); // Libera memória antes de criar uma nova operação
  FOperacao := TSoma.Create;
}
end;

procedure TForm1.btnSubtracaoClick(Sender: TObject);
begin
  FCaracterOperacao := '-';
//  if Assigned(FOperacao) then
//    FreeAndNil(FOperacao);
  FNumero1 := StrToFloat(Edit1.Text);
  FPrimeiroNumeroInserido := True;

  //FOperacao := TSubtracao.Create;
end;

procedure TForm1.btnMultiplicacaoClick(Sender: TObject);
begin
  FCaracterOperacao := '*';
//  if Assigned(FOperacao) then
//    FreeAndNil(FOperacao);
    FNumero1 := StrToFloat(Edit1.Text);
    FPrimeiroNumeroInserido := True;
//  FOperacao := TMultiplicacao.Create;
end;

procedure TForm1.btnDivisaoClick(Sender: TObject);
begin
  FCaracterOperacao := '/';
  FNumero1 := StrToFloat(Edit1.Text);
  FPrimeiroNumeroInserido := True;
{
  if Assigned(FOperacao) then
    FreeAndNil(FOperacao);
  FOperacao := TDivisao.Create;
}
end;

procedure TForm1.btnRaizQuadradaClick(Sender: TObject);
var
  FOperacao : TOperacao;
begin
//  if Assigned(FOperacao) then
//     FreeAndNil(FOperacao);
  FNumero1 := StrToFloat(Edit1.Text);
  FOperacao := TRaizQuadrada.Create;
  try
    Edit1.Text := FloatToStr(FOperacao.CalculaOperacao(FNumero1, 0));
    FCaracterOperacao := '?';
  finally
    FreeAndNil(FOperacao);
//  FreeAndNil(FOperacao);
  end;

end;

procedure TForm1.plCalculaOperacao(Sender: TObject);
var
//  Resultado: Double;
  FOperacao : TOperacao;
begin
  try
      try
        case FCaracterOperacao of
          '+':FOperacao := TSoma.Create;
          '-': FOperacao := TSubtracao.Create;
          '*': FOperacao := TMultiplicacao.Create;
          '/': FOperacao := TDivisao.Create;
          '!': FOperacao := TFatorial.Create;
          '?': FOperacao := TRaizQuadrada.Create;
        Else
          raise Exception.Create('Não definida a operação');
        end;

        if Assigned(FOperacao) then
        begin
          if Trim(Edit1.Text) = '' then
            raise Exception.Create('Por favor, insira um número antes de calcular.');


          Edit1.Text := FloatToStr(FOperacao.CalculaOperacao(FNumero1, StrToFloat(Edit1.Text)));



          FreeAndNil(FOperacao);
        end
        else
          ShowMessage('Nenhuma operação foi selecionada.');
      except
        on E: Exception do
          ShowMessage('Erro: ' + E.Message);
      end;
  finally
    if Assigned(FOperacao) then
      FreeAndNil(FOperacao);
  end;
end;

procedure TForm1.btnFatorialClick(Sender: TObject);
{var
  FatorialStr: string;
  i: Integer;
  Resultado: Double;
  FOperacao : TOperacao;
}
begin
  FCaracterOperacao := '!';
  FNumero1 := StrToFloat(Edit1.Text);
  plCalculaOperacao(Sender);
{
//  if Assigned(FOperacao) then
//    FreeAndNil(FOperacao);
    FNumero1 := StrToFloat(Edit1.Text);
  if FNumero1 <> Trunc(FNumero1) then
  begin
    ShowMessage('Por favor, insira um número inteiro!');
    Exit;
  end;
  FOperacao := TFatorial.Create;
  try
      try
        // Calcula o fatorial usando o método Calcular
        Resultado := FOperacao.Calcular(Trunc(FNumero1), 0); // Passa 0 como segundo parâmetro, pois não é usado

        // Gera a string representando a equação do fatorial
        FatorialStr := IntToStr(Trunc(FNumero1)) + '! = ';

        // Cria a equação com os números do fatorial
        for i := Trunc(FNumero1) downto 1 do
        begin
          FatorialStr := FatorialStr + IntToStr(i);
          if i > 1 then
            FatorialStr := FatorialStr + ' x ';
        end;
        FatorialStr := FatorialStr + ' = ' + IntToStr(Round(Resultado)); // Exibe o resultado inteiro
        ShowMessage(FatorialStr);
      except
        on E: Exception do
        begin
          // Exibe erro caso o cálculo do fatorial falhe (como número negativo)
          ShowMessage('Erro: ' + E.Message);
        end;
      end;
  finally
    FreeAndNil(FOperacao);
  end;
}
end;

procedure TForm1.btnIgualClick(Sender: TObject);
begin
  plCalculaOperacao(Sender);
  FPrimeiroNumeroInserido := False;
end;


procedure TForm1.btnNumeroClick(Sender: TObject);
begin
  if FPrimeiroNumeroInserido or (Edit1.Text = '0') then
  begin
    Edit1.Text := (Sender as TButton).Caption; // Substitui o valor no Edit1
    FPrimeiroNumeroInserido := False; // Reseta o estado
  end
  else
  begin
    Edit1.Text := Edit1.Text + (Sender as TButton).Caption; // Concatena o número
  end;
end;



procedure TForm1.btnPontoClick(Sender: TObject);
begin
   if Pos(',', Edit1.Text) = 0 then
  begin
    if   Edit1.Text = '0' then
         Edit1.Text := '0,'
    else
      Edit1.Text := Edit1.Text + ',';
    end;
end;


 procedure TForm1.btnClearClick(Sender: TObject);
begin
  Edit1.Text := '0';
//  if Assigned(FOperacao) then
//    FreeAndNil(FOperacao);
end;


procedure TForm1.btnClearEntryClick(Sender: TObject);
begin
  Edit1.Text := '0';
end;

  
end.
