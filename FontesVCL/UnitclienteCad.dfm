object FrmClienteCad: TFrmClienteCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 589
  ClientWidth = 634
  Color = clWhite
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
    object Label1: TLabel
      Left = 8
      Top = 107
      Width = 33
      Height = 15
      Caption = 'Nome'
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
      Caption = 'Novo Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16744448
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 140
    end
    object Label2: TLabel
      Left = 10
      Top = 171
      Width = 49
      Height = 15
      Caption = 'Endereco'
    end
    object Label3: TLabel
      Left = 320
      Top = 171
      Width = 77
      Height = 15
      Caption = 'Complemento'
    end
    object Label4: TLabel
      Left = 10
      Top = 235
      Width = 31
      Height = 15
      Caption = 'Bairro'
    end
    object Label5: TLabel
      Left = 224
      Top = 235
      Width = 37
      Height = 15
      Caption = 'Cidade'
    end
    object Label6: TLabel
      Left = 424
      Top = 235
      Width = 14
      Height = 15
      Caption = 'UF'
    end
    object EdtNome: TEdit
      Left = 8
      Top = 128
      Width = 497
      Height = 23
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
        OnClick = btnSalvarClick
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
    object EdtEndereco: TEdit
      Left = 8
      Top = 192
      Width = 281
      Height = 23
      TabOrder = 3
    end
    object EdtComplemento: TEdit
      Left = 320
      Top = 192
      Width = 185
      Height = 23
      TabOrder = 4
    end
    object EdtBairro: TEdit
      Left = 10
      Top = 256
      Width = 185
      Height = 23
      TabOrder = 5
    end
    object EdtCidade: TEdit
      Left = 224
      Top = 256
      Width = 185
      Height = 23
      TabOrder = 6
    end
    object EdtUf: TEdit
      Left = 424
      Top = 256
      Width = 81
      Height = 23
      TabOrder = 7
    end
  end
  object tabClienteCad: TFDMemTable
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
