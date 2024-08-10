unit UnitclienteCad;

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
  Vcl.Buttons,
  Vcl.ExtCtrls,
  VclNavigation;

type
  TFrmClienteCad = class(TForm)
    lblTitle: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClienteCad: TFrmClienteCad;

implementation

{$R *.dfm}

procedure TFrmClienteCad.btnCancelarClick(Sender: TObject);
begin
  TNavigation.close(self);
end;

procedure TFrmClienteCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:= TCloseAction.caFree;
  FrmClienteCad := nil;
end;

end.
