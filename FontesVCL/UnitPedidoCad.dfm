object PedidoCad: TPedidoCad
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FrmCadPedido'
  ClientHeight = 589
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object pnl_main: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 589
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    object Label1: TLabel
      Left = 8
      Top = 107
      Width = 90
      Height = 15
      Caption = 'Nome do pedido'
    end
    object lblTitle: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 624
      Height = 32
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Novo pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16744448
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 140
    end
    object EdtNome: TEdit
      Left = 8
      Top = 128
      Width = 497
      Height = 25
      TabOrder = 0
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 62
      Top = 492
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
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 294
      Top = 492
      Width = 138
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = clGray
      ParentBackground = False
      TabOrder = 2
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
  end
  object tabPedidoCad: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 542
    Top = 168
  end
end
