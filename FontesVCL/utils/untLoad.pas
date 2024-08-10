unit untLoad;

interface

uses
  System.Classes, System.SysUtils, Vcl.Forms, Vcl.Graphics, Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls, System.UITypes,
  Vcl.WinXCtrls;

type
  TLoadingForm = class
  private
    class var Indicator: TActivityIndicator;
    class var Loading: TForm;
    class var Fundo: TForm;
  public
    class procedure ExecuteThread(AProc: TProc; ACompletion: TProc);
    class procedure ShowLoading;
    class procedure HideLoading;
  end;

implementation

{ TLoadingForm }

class procedure TLoadingForm.ShowLoading;
begin

  {Deixar o fundo opaco e tirar o tela branco do panel}

  // Criando o formul�rio de fundo
  Fundo := TForm.Create(nil);
  Fundo.BorderStyle := bsNone;
  Fundo.FormStyle := fsStayOnTop;
  Fundo.Color := clred;
  Fundo.AlphaBlend := True;
  Fundo.AlphaBlendValue := 128; // Semitransparente
  Fundo.WindowState := wsMaximized;
  Fundo.Position := poScreenCenter;

  // Criando o formul�rio de loading com fundo cinza semi-transparente
  Loading := TForm.Create(nil);
  Loading.BorderStyle := bsNone;
  //Loading.FormStyle := fsStayOnTop;
  Loading.Width := 1096;
  Loading.Height := 807;
  Loading.Position := poScreenCenter;
  Loading.Color := clGray; // Definindo a cor de fundo como cinza
  Loading.AlphaBlend := True; // Habilitar AlphaBlend para transpar�ncia
  Loading.AlphaBlendValue := 150; // Ajuste para semi-transparente (0 a 255)

  // Criando o TActivityIndicator
  Indicator := TActivityIndicator.Create(Loading);
  Indicator.Parent := Loading;
  Indicator.Align := alClient;
  Indicator.IndicatorType := aitSectorRing;
  Indicator.Animate  := True;


  // Exibir os formul�rios
  //Fundo.Show;
  Loading.Show;
end;

class procedure TLoadingForm.ExecuteThread(AProc: TProc; ACompletion: TProc);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      try
        // Executa o procedimento fornecido na thread separada
        if Assigned(AProc) then
          AProc();
      finally
        // Ap�s a conclus�o, sincroniza com a thread principal para finalizar a UI
        TThread.Synchronize(nil,
          procedure
          begin
            TLoadingForm.HideLoading;
            if Assigned(ACompletion) then
              ACompletion();
          end
        );
      end;
    end
  ).Start;
end;

class procedure TLoadingForm.HideLoading;
begin
  // Esconder e destruir os formul�rios e o indicador
  if Assigned(Indicator) then
    Indicator.Free;

  if Assigned(Loading) then
    Loading.Free;

  if Assigned(Fundo) then
    Fundo.Free;
end;

end.

