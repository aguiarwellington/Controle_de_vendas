program EasyPedido;

uses
  Vcl.Forms,
  mainLogin in 'mainLogin.pas' {FrmLogin},
  main in 'main.pas' {frmPrincipal},
  VCL.Session in 'utils\VCL.Session.pas',
  VclNavigation in 'utils\VclNavigation.pas',
  untLoad in 'utils\untLoad.pas',
  UnitPedido in 'UnitPedido.pas' {frmPedido},
  UnitCliente in 'UnitCliente.pas' {FrmCliente},
  UnitclienteCad in 'UnitclienteCad.pas' {FrmClienteCad};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
