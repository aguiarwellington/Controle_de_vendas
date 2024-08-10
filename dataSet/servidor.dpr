program servidor;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FrmMainServidor},
  Controllers.cliente in 'Controle\Controllers.cliente.pas',
  DataModuloGlobal in 'DataModulo\DataModuloGlobal.pas' {Dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMainServidor, FrmMainServidor);
  Application.Run;
end.
