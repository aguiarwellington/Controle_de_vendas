unit VclNavigation;

interface

uses
  System.SysUtils,
  System.UITypes,
  vcl.Forms,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,
  system.Generics.Collections,
  system.Classes;

type
  TNavigation = class
    private
      class var frmopen: tform;
      class var frmModalOpen: tform;
      class var frmModalFundo: tform;
    public
      class var paramInt: integer;
      class var executeonclose: procedure of object;

      class procedure open(frmclass: tformclass;
                           frm: TForm;
                           parent: tpanel = nil);

      class procedure openModal(frmclass: tformclass;
                                frm: Tform; parent: tform = nil);

      class procedure close(frm: tform);
  end;

implementation

{ TNavigation }

class procedure TNavigation.close(frm: tform);
begin
//Verifica se esta fechando ummodal

  if frm.Name = frmModalOpen.name then
  begin
    FrmModalFundo.Free;
    FrmModalFundo := nil;
  end;

  if assigned(executeonclose) then
  begin
    executeonclose();
    executeonclose:= nil;
  end;

  frm.Close;
end;

class procedure TNavigation.open(frmclass: tformclass; frm: TForm;
  parent: tpanel);
begin
  // close the form if have any open

  if assigned(frmOpen) then
  begin
    frmOpen.Free;
    frmOpen:= nil;
  end;

  if (frmclass = nil) then
    exit;

  if not assigned(frm) then
    application.CreateForm(frmclass,frm);

  if parent <> nil then
  begin
    if parent.ClassType = TPanel then
    begin
      frm.Parent := Tpanel(parent);
      tpanel(Parent).Margins.Bottom := 1;
      tpanel(Parent).Margins.Bottom := 0;
    end;
  end;

  frmOpen := frm; // salva qual é o form aberto
  frm.Show;
end;

class procedure TNavigation.openModal(frmclass: tformclass;
                                      frm: Tform;
                                      parent: tform = nil);
begin
   //  abrir um pedaco da tela e todo o pedaco em volta fica opaco

   if not assigned(frmModalFundo)then
    frmModalFundo := TForm.Create(Frm);

   FrmModalFundo.AlphaBlend := true;
   FrmModalFundo.AlphaBlendValue := 160;
   FrmModalFundo.Color := clblack;

   if parent = nil then
    frmModalFundo.WindowState := wsmaximized
   else
   begin
    FrmModalFundo.WindowState := wsNormal;
    FrmModalFundo.Position := podesigned;
    FrmModalFundo.Width := parent.Width;
    FrmModalFundo.Height := parent.Height;
    FrmModalFundo.Left := parent.Left;
    FrmModalFundo.Top := parent.Top;
   end;

  FrmModalFundo.BorderStyle := bsNone;

  if not assigned(frm) then
    Frm := FrmClass.Create(Frm);

  FrmModalFundo.Show;

  FrmModalOpen:= Frm; // salva qual e o form modal aberto

  Frm.ShowModal;

end;

end.
