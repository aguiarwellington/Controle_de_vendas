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
  Vcl.Loading,
  DataModules.Pedido;

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
    DBPedido: TDBGrid;
    DsPedido: TDataSource;
    pnlBuscar: TPanel;
    pnlButtonBuscar: TPanel;
    sbBuscar: TSpeedButton;
    edtPesquisar: TEdit;
    tabPedido: TFDMemTable;
    tabPedidoid_pedido: TIntegerField;
    tabPedidoid_usuario: TIntegerField;
    tabPedidodt_pedido: TDateField;
    tabPedidovl_total: TFloatField;
    tabPedidonome: TStringField;
    tabPedidocidade: TStringField;
    tabPedidousuario: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    bookMark: TBookMark;
    { Private declarations }
    procedure RefreshPedido;
    procedure TerminateBusca(Sender: TObject);
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

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  RefreshPedido;
end;

procedure TfrmPedido.RefreshPedido;
begin
  //Tloading.show;

  Tloading.ExecuteThread(procedure
  begin
    sleep(1000);

    //acessando o servidor
    DBPedido.DataSource:= nil;
    DMPedido.ListarPedido(tabPedido, edtPesquisar.text);

  end, TerminateBusca);

end;

procedure TfrmPedido.TerminateBusca(Sender: TObject);
begin
   Tloading.Hide;

   DBPedido.DataSource:= dspedido;

   if sender is TThread then
    if assigned(TThread(sender).FatalException) then
    begin
      showmessage(exception(TThread(sender).FatalException).Message);
      exit;
    end;

  if bookMark <> nil then
  begin
   DBPedido.DataSource.DataSet.GotoBookmark(bookMark);
   BookMark:= nil;
   end;
end;


end.
