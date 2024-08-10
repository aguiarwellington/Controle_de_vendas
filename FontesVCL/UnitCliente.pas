unit UnitCliente;

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
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.StdCtrls,
  UnitclienteCad,
  Vcl.ExtCtrls,
  VclNavigation,

  RESTRequest4D,
  DataSet.Serialize.adapter.RESTRequest4D;

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
    dsCliente: TDataSource;
    tabCliente: TFDMemTable;
    pnlBuscar: TPanel;
    pnlButtonBuscar: TPanel;
    sbBuscar: TSpeedButton;
    edtPesquisar: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure OpenCadCliente(Id_cliente: integer);
    procedure ListarCliente(memtable: TFDMemTable; filtro:string);
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



procedure TFrmCliente.FormShow(Sender: TObject);
begin
  ListarCliente(Tabcliente, edtPesquisar.text);
end;

procedure TFrmCliente.ListarCliente(memtable: TFDMemTable;
                                    filtro:string);
var
  resp: IResponse;
begin
   resp:= TRequest.new.baseURL('http://localhost:3000')
                      .Resource('/clientes')
                      .AddParam('filtro', filtro)
                      .accept('application/json')
                      .Adapters(TdatasetSerializeadapter.New(memtable))
                      .Get;

   if resp.StatusCode <> 200 then
    raise exception.Create(resp.Content);

end;

end.
