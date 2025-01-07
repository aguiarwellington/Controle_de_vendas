unit UnitPedidoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,Vcl.Navigation,Vcl.Loading,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,DataModule.Pedido,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TPedidoCad = class(TForm)
    pnlMain: TPanel;
    lblTitulo: TLabel;
    pnlTitle: TPanel;
    edtidCliente: TEdit;
    Label2: TLabel;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    edtNome: TEdit;
    DTdata: TDateTimePicker;
    tabPedido: TFDMemTable;
    id_pedido: TIntegerField;
    id_usuario: TIntegerField;
    id_cliente: TIntegerField;
    dt_pedido: TDateField;
    vl_total: TFloatField;
    nome: TStringField;
    tabPedidocidade: TStringField;
    usuario: TStringField;
    dbItens: TDBGrid;
    tabItens: TFDMemTable;
    DsItens: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     procedure TerminateLoad(Sender: TObject);
  public
    { Public declarations }
  end;

var
  PedidoCad: TPedidoCad;

implementation

{$R *.dfm}

procedure TPedidoCad.btnCancelarClick(Sender: TObject);
begin
  TNavigation.CloseAndCancel(Self);
end;

procedure TPedidoCad.FormShow(Sender: TObject);
begin
   if TNavigation.ParamInt > 0 then
    begin
        lblTitulo.Caption := 'Editar pedido';
        dbItens.DataSource:= nil;

       // TLoading.Show;
        TLoading.ExecuteThread(procedure
        begin
            sleep(2000);
            Dmpedido.ListarId(tabPedido,TabItens, TNavigation.ParamInt);
        end, TerminateLoad);
    end;
end;

procedure TPedidoCad.TerminateLoad(Sender: TObject);
begin
       //TLoading.Hide;
        dbItens.DataSource:= dsItens;
    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    edtidCliente.Text := tabPedido.FieldByName('id_cliente').AsString;
    edtNome.Text := tabPedido.FieldByName('nome').AsString;
    dtData.date := tabPedido.FieldByName('dt_pedido').AsDateTime;

end;

end.
