object LoadingForm: TLoadingForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Loading'
  ClientHeight = 124
  ClientWidth = 111
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poScreenCenter
  TextHeight = 15
  object FImage: TImage
    Left = 20
    Top = 20
    Width = 60
    Height = 60
  end
  object FTimer: TTimer
    OnTimer = OnTimer
  end
end
