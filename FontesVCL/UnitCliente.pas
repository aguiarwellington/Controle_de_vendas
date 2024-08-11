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
  DataModules.Cliente,
  Vcl.Loading;

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
    DBCliente: TDBGrid;
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
    procedure RefreshClientes;
    procedure TerminateBusca(Sender: TObject);
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
  RefreshClientes;
end;

procedure TFrmCliente.TerminateBusca(Sender: TObject);
begin
   Tloading.Hide;
    DBCliente.DataSource:= dscliente;

   if sender is TThread then
    if assigned(TThread(sender).FatalException) then
    begin
      showmessage(exception(TThread(sender).FatalException).Message);
      exit;
    end;
end;


procedure TFrmCliente.RefreshClientes;
begin

  Tloading.show(self);

  Tloading.ExecuteThread(procedure
  begin
    sleep(1000);

    //acessando o servidor
    DBCliente.DataSource:= nil;
    DMCliente.ListarCliente(Tabcliente, edtPesquisar.text);

    //atualizar o dbgrid
    {Precisa do synchronize, nao pode mexer visualmente na grid de dentro da tthread }
    {TThread.Synchronize(TThread.CurrentThread,procedure
    begin
       DBCliente.DataSource:= dscliente;
    end)  }

  end, TerminateBusca);

end;



end.
