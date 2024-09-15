program servidor;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FrmMainServidor},
  Controllers.cliente in 'Controle\Controllers.cliente.pas',
  DataModuloGlobal in 'DataModulo\DataModuloGlobal.pas' {Dm: TDataModule},
  Controllers.produto in 'Controle\Controllers.produto.pas',
  Controllers.usuario in 'Controle\Controllers.usuario.pas',
  uMD5 in '..\Utils\uMD5.pas',
  Controllers.Pedidos in 'Controle\Controllers.Pedidos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMainServidor, FrmMainServidor);
  Application.Run;
end.
