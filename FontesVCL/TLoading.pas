unit TLoading;

interface

uses
  System.Classes, System.SysUtils, Vcl.Forms, Vcl.Graphics, Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TLoadingForm = class(TForm)
  private
    FImage: TImage;
    FTimer: TTimer;
    FAngle: Integer;
    procedure OnTimer(Sender: TObject);
  public
    class procedure ShowLoading(AOwner: TComponent);
    class procedure HideLoading;
    class procedure ExecuteThread(AProc: TProc; ACompletion: TProc);
  end;

var
  LoadingForm: TLoadingForm;

implementation

{$R *.dfm}

{ TLoadingForm }

procedure TLoadingForm.OnTimer(Sender: TObject);
begin
  // Incrementa o ângulo de rotação da imagem (simulação de uma "bolinha girando")
  FAngle := (FAngle + 10) mod 360;
  FImage.Canvas.Lock;
  try
    FImage.Canvas.FillRect(FImage.ClientRect); // Limpa a área da imagem
    FImage.Canvas.Pen.Color := clBlack; // Cor da "bolinha"
    FImage.Canvas.Ellipse(
      Round(50 + 30 * Cos(FAngle * Pi / 180)),
      Round(50 + 30 * Sin(FAngle * Pi / 180)),
      Round(50 + 10 * Cos(FAngle * Pi / 180)),
      Round(50 + 10 * Sin(FAngle * Pi / 180))
    );
  finally
    FImage.Canvas.Unlock;
  end;
end;

class procedure TLoadingForm.ShowLoading(AOwner: TComponent);
begin
  if not Assigned(LoadingForm) then
    LoadingForm := TLoadingForm.Create(AOwner);

  LoadingForm.Show;
  LoadingForm.FTimer.Enabled := True;
end;

class procedure TLoadingForm.HideLoading;
begin
  if Assigned(LoadingForm) then
  begin
    LoadingForm.FTimer.Enabled := False;
    LoadingForm.Close;
    FreeAndNil(LoadingForm);
  end;
end;

class procedure TLoadingForm.ExecuteThread(AProc: TProc; ACompletion: TProc);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      try
        if Assigned(AProc) then
          AProc();
      finally
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

end.
