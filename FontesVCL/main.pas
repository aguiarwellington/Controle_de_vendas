unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.CategoryButtons;

type
  TfrmPrincipal = class(TForm)
    sMenu: TSplitView;
    pLogo: TPanel;
    btnMenu: TSpeedButton;
    Image1: TImage;
    imglist: TImageList;
    CategoryMenu: TCategoryButtons;
    procedure btnMenuClick(Sender: TObject);
  private
    { Private declarations }
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

end.
