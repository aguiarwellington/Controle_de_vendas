object FrmClienteCad: TFrmClienteCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 457
  ClientWidth = 445
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  TextHeight = 15
  object lblTitle: TLabel
    Left = 0
    Top = 0
    Width = 445
    Height = 49
    Align = alTop
    Caption = 'Novo Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16744448
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 640
  end
  object Label1: TLabel
    Left = 8
    Top = 107
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 222
    Top = 356
    Width = 138
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = clGray
    ParentBackground = False
    TabOrder = 0
    object btnCancelar: TSpeedButton
      Left = 0
      Top = 0
      Width = 138
      Height = 40
      Cursor = crHandPoint
      Margins.Top = 20
      Margins.Bottom = 20
      Align = alClient
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI Black'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancelarClick
      ExplicitLeft = -4
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 62
    Top = 356
    Width = 138
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = clGreen
    ParentBackground = False
    TabOrder = 1
    object btnSalvar: TSpeedButton
      Left = 0
      Top = 0
      Width = 138
      Height = 40
      Cursor = crHandPoint
      Margins.Top = 20
      Margins.Bottom = 20
      Align = alClient
      Caption = 'Salvar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI Black'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = -8
    end
  end
  object Edit1: TEdit
    Left = 8
    Top = 128
    Width = 361
    Height = 23
    TabOrder = 2
  end
end
