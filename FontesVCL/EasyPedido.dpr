program EasyPedido;

uses
  Vcl.Forms,
  mainLogin in 'mainLogin.pas' {FrmLogin},
  main in 'main.pas' {frmPrincipal},
  untLoad in 'utils\untLoad.pas' {LoadingForm},
  VCL.Session in 'utils\VCL.Session.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
