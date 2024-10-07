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
  UnitclienteCad in 'UnitclienteCad.pas' {FrmClienteCad},
  DataModules.Cliente in 'DataModules\DataModules.Cliente.pas' {DMCliente: TDataModule},
  Vcl.Loading in 'utils\Vcl.Loading.pas',
  DataModules.Usuario in 'DataModules\DataModules.Usuario.pas' {DmUsuario: TDataModule},
  DataModules.Pedido in 'DataModules\DataModules.Pedido.pas' {DmPedido: TDataModule},
  UnitPedidoCad in 'UnitPedidoCad.pas' {PedidoCad};

{$R *.res}

begin
  reportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDmPedido, DmPedido);
  Application.CreateForm(TPedidoCad, PedidoCad);
  Application.Run;
end.
