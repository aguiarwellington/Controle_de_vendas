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
    procedure sbEditarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
  private
  { Private declarations }
    bookMark: TBookMark;

  {Private Procedures}
    procedure OpenCadCliente(Id_cliente: integer);
    procedure RefreshClientes;
    procedure TerminateBusca(Sender: TObject);
    procedure editar;
    procedure TerminateDelete(Sender: TObject);

  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

procedure TFrmCliente.OpenCadCliente(Id_cliente: integer);
begin
  Tnavigation.ExecuteOnClose:= RefreshClientes;

  Tnavigation.ParamInt:= Id_cliente;
  Tnavigation.openModal(TFrmClienteCad, FrmClienteCad);
end;


procedure TFrmCliente.btnNovoClick(Sender: TObject);
begin
  OpenCadCliente(0);
  RefreshClientes;
end;

procedure TFrmCliente.editar;
begin
  if tabCliente.RecordCount = 0 then
    exit;

  bookMark:= DBCliente.DataSource.DataSet.GetBookmark;
  OpenCadCliente(TabCliente.FieldByName('id_cliente').AsInteger);
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

  if bookMark <> nil then
  begin
   DBCliente.DataSource.DataSet.GotoBookmark(bookMark);
   BookMark:= nil;
   end;
end;


procedure TFrmCliente.RefreshClientes;
begin

  Tloading.show;

  Tloading.ExecuteThread(procedure
  begin
    sleep(1000);

    //acessando o servidor
    DBCliente.DataSource:= nil;
    DMCliente.ListarCliente(Tabcliente, edtPesquisar.text);

  end, TerminateBusca);

end;



procedure TFrmCliente.sbEditarClick(Sender: TObject);
begin
  editar;
  RefreshClientes;
end;

procedure TFrmCliente.SBExcluirClick(Sender: TObject);
begin
  if messageDlg('Deseja excluir o cliente selecionado ? ', TMsgdlgtype.mtconfirmation, [tmsgdlgbtn.mbYes,tmsgdlgbtn.mbno],0 ) = mrYes then
  begin
    tloading.ExecuteThread(procedure
    begin
      DmCliente.excluir(TabCliente.FieldByName('id_cliente').AsInteger);

    end, terminateDelete)

  end;

end;

procedure TFrmCliente.TerminateDelete(Sender: TObject);
begin
   //Tloading.Hide;

   if sender is TThread then
    if assigned(TThread(sender).FatalException) then
    begin
      showmessage(exception(TThread(sender).FatalException).Message);
      exit;
    end;

   RefreshClientes;
end;

end.
