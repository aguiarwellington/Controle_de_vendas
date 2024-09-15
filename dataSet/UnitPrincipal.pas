unit UnitPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  horse,
  Horse.Jhonson,
  Horse.CORS,
  Controllers.cliente,
  Controllers.produto,
  Controllers.usuario,
  Controllers.Pedidos;

type
  TFrmMainServidor = class(TForm)
    lblServer: TLabel;
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmMainServidor: TFrmMainServidor;

implementation

{$R *.dfm}


procedure TFrmMainServidor.FormShow(Sender: TObject);
begin
  Thorse.Use(Jhonson());
  Thorse.Use(Cors);

  Controllers.cliente.RegistrarRotas;
  Controllers.produto.RegistrarRotas;
  Controllers.usuario.RegistrarRotas;
  Controllers.Pedidos.RegistrarRotas;

  THorse.Listen(3000);

  lblServer.Caption := 'Servidor rodando na porta: ' + Thorse.Port.ToString;

end;



end.
