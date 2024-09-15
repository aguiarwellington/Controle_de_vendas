unit UnitPedido;

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
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
   FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Loading;;

type
  TfrmPedido = class(TForm)
    pHeader: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    spButton: TSpeedButton;
    Panel1: TPanel;
    SBExcluir: TSpeedButton;
    Panel2: TPanel;
    sbEditar: TSpeedButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    pnlBuscar: TPanel;
    pnlButtonBuscar: TPanel;
    sbBuscar: TSpeedButton;
    edtPesquisar: TEdit;
    tabPedido: TFDMemTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure RefreshPedido;
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

procedure TfrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TcloseAction.caFree;
    FrmPedido := nil;
end;

procedure TfrmPedido.RefreshPedido;
begin
  Tloading.show;

  Tloading.ExecuteThread(procedure
  begin
    sleep(1000);

    //acessando o servidor
    //DBCliente.DataSource:= nil;
    //DMCliente.ListarCliente(tabPedido, edtPesquisar.text);

  end, TerminateBusca);


end;

end.
