unit UnitPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DataModule.Pedido,Vcl.Loading,UnitPedidoCad,Vcl.Navigation;

type
  TFrmPedido = class(TForm)
    pHeader: TPanel;
    Label4: TLabel;
    Panel1: TPanel;
    btnExcluir: TSpeedButton;
    Panel2: TPanel;
    btnAdd: TSpeedButton;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    dbPedido: TDBGrid;
    tabPedido: TFDMemTable;
    dsPedido: TDataSource;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    id_pedido: TIntegerField;
    id_usuario: TIntegerField;
    id_cliente: TIntegerField;
    dt_pedido: TDateField;
    vl_total: TFloatField;
    nome: TStringField;
    tabPedidocidade: TStringField;
    usuario: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dbPedidoDblClick(Sender: TObject);
  private
     bookmark: TBookmark;
    { Private declarations }
    procedure refreshPedidos;
    procedure TerminateBusca(Sender: TObject);
    procedure TerminateDelete(Sender: TObject);
    procedure OpenCadPedido(id_pedido: integer);
    procedure Editar;
  public
    { Public declarations }
  end;

var
  FrmPedido: TFrmPedido;

implementation

{$R *.dfm}

procedure TFrmPedido.btnAddClick(Sender: TObject);
begin
   OpenCadPedido(0);
end;

procedure TFrmPedido.btnExcluirClick(Sender: TObject);
begin
    if Tabpedido.RecordCount = 0 then
        exit;

    if MessageDlg('Deseja excluir o pedido selecionado?', TMsgDlgType.mtConfirmation,
                [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    begin
       // TLoading.Show;
        TLoading.ExecuteThread(procedure
        begin
            Dmpedido.Excluir(Tabpedido.FieldByName('id_pedido').AsInteger);
        end, TerminateDelete);
    end;
end;

procedure TFrmPedido.dbPedidoDblClick(Sender: TObject);
begin
   Editar;
end;

procedure TFrmPedido.Editar;
begin
     if Tabpedido.RecordCount = 0 then
        exit;

    bookmark := dbPedido.DataSource.DataSet.GetBookmark;
    OpenCadpedido(Tabpedido.FieldByName('id_pedido').AsInteger);
end;

procedure TFrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmPedido := nil;
end;

procedure TFrmPedido.FormShow(Sender: TObject);
begin
    refreshPedidos;
end;

procedure TFrmPedido.OpenCadPedido(id_pedido: integer);
begin
   TNavigation.ExecuteOnClose := refreshPedidos;
   TNavigation.ParamInt := id_pedido;
   TNavigation.OpenModal(TPedidoCad, PedidoCad);
end;

procedure TFrmPedido.refreshPedidos;
begin
        //TLoading.Show;

    TLoading.ExecuteThread(procedure
    begin
        sleep(800);

        // Acessar o servidor...
        //TabCliente.DisableControls;
        dbPedido.DataSource := nil;
        DmPedido.Listar(tabPedido, edtBusca.Text);
    end,
    TerminateBusca);
end;

procedure TFrmPedido.TerminateBusca(Sender: TObject);
begin
    TLoading.Hide;
    dbPedido.DataSource := dsPedido;
    //TabCliente.EnableControls;


    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    if bookmark <> nil then
        try
            dbPedido.DataSource.DataSet.GotoBookmark(bookmark);
            bookmark := nil;
        except
        end;
end;

procedure TFrmPedido.TerminateDelete(Sender: TObject);
begin
    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    refreshPedidos;
end;

end.
