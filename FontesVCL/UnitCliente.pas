unit UnitCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,UnitclienteCad,
  Vcl.ExtCtrls,VclNavigation;

type
  TFrmCliente = class(TForm)
    pHeader: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    btnNovo: TSpeedButton;
    Panel1: TPanel;
    SBExcluir: TSpeedButton;
    Panel2: TPanel;
    sbEditar: TSpeedButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    pnlBuscar: TPanel;
    pnlButtonBuscar: TPanel;
    sbBuscar: TSpeedButton;
    edtPesquisar: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure OpenCadCliente(Id_cliente: integer);
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

procedure TFrmCliente.OpenCadCliente(Id_cliente: integer);
begin
  Tnavigation.openModal(TFrmClienteCad, FrmClienteCad);
end;

procedure TFrmCliente.btnNovoClick(Sender: TObject);
begin
  OpenCadCliente(0);
end;

procedure TFrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TcloseAction.caFree;
  Frmcliente := nil;
end;



end.
