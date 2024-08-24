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
  VclNavigation,
  Vcl.Loading,
  DataModules.Cliente,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmClienteCad = class(TForm)
    lblTitle: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    EdtNome: TEdit;
    Label1: TLabel;
    pnl_main: TPanel;
    Label2: TLabel;
    EdtEndereco: TEdit;
    EdtComplemento: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtBairro: TEdit;
    Label5: TLabel;
    EdtCidade: TEdit;
    Label6: TLabel;
    EdtUf: TEdit;
    tabClienteCad: TFDMemTable;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  procedure terminateLoad(Sender:Tobject);
    procedure terminateSalvar(Sender: Tobject);
  public
    { Public declarations }
  end;

var
  FrmClienteCad: TFrmClienteCad;

implementation

{$R *.dfm}

procedure TFrmClienteCad.btnCancelarClick(Sender: TObject);
begin
  TNavigation.closeandcancel(self);
end;

procedure TFrmClienteCad.btnSalvarClick(Sender: TObject);
begin

  TLoading.ExecuteThread(procedure
  begin
      if TNavigation.ParamInt = 0 then
        DmCliente.inserir(edtNome.Text, edtEndereco.Text, edtComplemento.Text,edtBairro.Text, edtCidade.Text,edtUf.Text)
      else
        DmCliente.editar(TNavigation.ParamInt,edtNome.Text, edtEndereco.Text, edtComplemento.Text,edtBairro.Text, edtCidade.Text,edtUf.Text);
  end, TerminateSalvar);

end;

procedure TFrmClienteCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:= TCloseAction.caFree;
  FrmClienteCad := nil;
end;

procedure TFrmClienteCad.FormShow(Sender: TObject);
begin
  if TNavigation.ParamInt > 0 then
  begin
    lblTitle.Caption := 'Editar Cliente';

    TLoading.Show;
    TLoading.ExecuteThread(procedure
    begin
      //sleep(2000);
      dmcliente.ListarClienteID(tabClienteCad,TNavigation.ParamInt);

    end, Terminateload);
  end;
end;

procedure TFrmClienteCad.terminateSalvar(Sender: Tobject);
begin

  Tloading.Hide;


  if sender is TThread then
    if assigned(TThread(sender).FatalException) then
    begin
      showmessage(exception(TThread(sender).FatalException).Message);
      exit;
    end;

   Tnavigation.Close(self);
end;

procedure TFrmClienteCad.terminateLoad(Sender: Tobject);
begin

  Tloading.Hide;


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
  EdtUf.Text:= tabclienteCad.FieldByName('uf').AsString;

end;

end.
