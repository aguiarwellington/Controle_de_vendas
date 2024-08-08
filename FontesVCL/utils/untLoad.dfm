object LoadingForm: TLoadingForm
  Left = 0
  Top = 0
  AlphaBlendValue = 100
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Loading'
  ClientHeight = 538
  ClientWidth = 351
  Color = clGrayText
  TransparentColor = True
  TransparentColorValue = clMedGray
  UseDockManager = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poScreenCenter
  TextHeight = 15
  object Indicator: TActivityIndicator
    AlignWithMargins = True
    Left = 120
    Top = 240
    IndicatorSize = aisXLarge
    IndicatorType = aitSectorRing
  end
end
