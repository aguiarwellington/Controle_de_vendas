unit UnitPedidoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,VclNavigation,Vcl.Loading;

type
  TPedidoCad = class(TForm)
    pnl_main: TPanel;
    Label1: TLabel;
    lblTitle: TLabel;
    EdtNome: TEdit;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    tabPedidoCad: TFDMemTable;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure terminateLoad(Sender: Tobject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PedidoCad: TPedidoCad;

implementation

{$R *.dfm}

uses DataModules.Pedido;

procedure TPedidoCad.btnCancelarClick(Sender: TObject);
begin
   TNavigation.closeandcancel(self);
end;

procedure TPedidoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:= TCloseAction.caFree;
  PedidoCad := nil;
end;

procedure TPedidoCad.FormShow(Sender: TObject);
begin
  if TNavigation.ParamInt > 0 then
  begin
    lblTitle.Caption := 'Editar pedido';

    TLoading.Show;
    TLoading.ExecuteThread(procedure
    begin
      //sleep(2000);
      DmPedido.ListarpedidoID(tabPedidoCad,TNavigation.ParamInt);

    end, Terminateload);
  end;
end;


procedure TPedidoCad.terminateLoad(Sender: Tobject);
begin

  {Tloading.Hide;


  if sender is TThread then
    if assigned(TThread(sender).FatalException) then
    begin
      showmessage(exception(TThread(sender).FatalException).Message);
      exit;
    end;

  edtNome.Text:= tabclienteCad.FieldByName('nome').AsString;
  EdtEndereco.Text:= tabclienteCad.FieldByName('endereco').AsString;
  EdtComplemento.Text:= tabclienteCad.FieldByName('complemento').AsString;
  EdtBairro.Text:= tabclienteCad.FieldByName('bairro').AsString;
  EdtCidade.Text:= tabclienteCad.FieldByName('cidade').AsString;
  EdtUf.Text:= tabclienteCad.FieldByName('uf').AsString;  }

end;

end.
