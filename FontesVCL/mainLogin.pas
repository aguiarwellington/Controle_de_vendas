unit mainLogin;

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
  Vcl.Imaging.jpeg,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  untLoad,
  main,
  VCL.Session;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    pLogin: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    edtEmail: TEdit;
    Label4: TLabel;
    Panel2: TPanel;
    EdtSenha: TEdit;
    Panel3: TPanel;
    spButton: TSpeedButton;
    procedure spButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure TerminateLogin(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

procedure  TFrmLogin.TerminateLogin(Sender: TObject);
begin

  //saber se houve algum erro na execucao da tthread
    if sender is TThread then
      if assigned(TThread(sender).FatalException) then
      begin
        showmessage(exception(TThread(sender).FatalException).Message);
        exit;
      end;

    TSession.ID_USUARIO := 1;
    TSession.EMAIL := 'Wellingtoncarvalho@gmail.com';
    TSession.NOME := 'Wellington Carvalho';

    //Tloading.HideLoading;
    if not assigned(frmPrincipal) then
      application.CreateForm(TfrmPrincipal,frmPrincipal);

    frmPrincipal.show;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFrmLogin.spButtonClick(Sender: TObject);
begin
  //criar uma tela de loding

  TLoadingForm.ShowLoading;

  TLoadingForm.ExecuteThread(
    procedure
    begin
      // Simula uma operação de longa duração
      Sleep(1000);
    end,
    procedure
    begin
      TerminateLogin(Sender);
    end
  );


end;

end.
