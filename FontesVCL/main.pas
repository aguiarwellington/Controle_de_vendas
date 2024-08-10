unit main;

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
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Buttons,
  Vcl.CategoryButtons,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  VCL.Session,
  VclNavigation,
  UnitPedido,
  UnitCliente;

type
  TfrmPrincipal = class(TForm)
    sMenu: TSplitView;
    pLogo: TPanel;
    btnMenu: TSpeedButton;
    Image1: TImage;
    imglist: TImageList;
    CategoryMenu: TCategoryButtons;
    spSubMenu: TSplitView;
    Panel1: TPanel;
    CategorySubMenuButtons: TCategoryButtons;
    Label1: TLabel;
    sbClose: TSpeedButton;
    plFundo: TPanel;
    pnlNavBar: TPanel;
    Pusuario: TPanel;
    LbEmail: TLabel;
    LbUusario: TLabel;
    Image2: TImage;
    Image3: TImage;
    pContainer: TPanel;
    procedure btnMenuClick(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure CategoryMenuCategories0Items2Click(Sender: TObject);
    procedure CategoryMenuCategories0Items5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CategoryMenuCategories0Items1Click(Sender: TObject);
    procedure CategorySubMenuButtonsCategories0Items0Click(Sender: TObject);
  private
    { Private declarations }
    procedure closeSubMenu;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnMenuClick(Sender: TObject);
begin
  sMenu.Opened:= NOT sMenu.Opened;
end;

procedure TfrmPrincipal.CategoryMenuCategories0Items1Click(Sender: TObject);
begin
  CloseSubMenu;

  Tnavigation.open(TfrmPedido,frmPedido,pContainer);

end;

procedure TfrmPrincipal.CategoryMenuCategories0Items2Click(Sender: TObject);
begin
  spSubMenu.Opened := true;
end;

procedure TfrmPrincipal.CategoryMenuCategories0Items5Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TfrmPrincipal.CategorySubMenuButtonsCategories0Items0Click(
  Sender: TObject);
begin
  closeSubMenu;
  Tnavigation.open(TFrmCliente,FrmCliente,pContainer);
end;

procedure TfrmPrincipal.closeSubMenu;
begin
    if spSubMenu.opened then
    begin
      spSubMenu.Opened := false;
      CategorySubMenuButtons.SelectedItem := nil;
      sMenu.SetFocus;
    end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   LbUusario.Caption := TSession.NOME;
   LbEmail.Caption   := TSession.EMAIL;
end;

procedure TfrmPrincipal.sbCloseClick(Sender: TObject);
begin
  closeSubMenu;
end;

end.
