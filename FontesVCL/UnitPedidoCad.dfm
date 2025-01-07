object PedidoCad: TPedidoCad
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'PedidoCad'
  ClientHeight = 577
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 818
    Height = 577
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    object Label2: TLabel
      AlignWithMargins = True
      Left = 26
      Top = 84
      Width = 126
      Height = 13
      Margins.Left = 6
      AutoSize = False
      Caption = 'Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5585461
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object pnlTitle: TPanel
      Left = 1
      Top = 1
      Width = 816
      Height = 64
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 682
      object lblTitulo: TLabel
        AlignWithMargins = True
        Left = 25
        Top = 6
        Width = 249
        Height = 42
        Margins.Left = 0
        Margins.Top = 15
        Margins.Right = 0
        Margins.Bottom = 15
        AutoSize = False
        Caption = 'Novo Pedido'
        Font.Charset = ANSI_CHARSET
        Font.Color = 16744448
        Font.Height = -24
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
    end
    object edtidCliente: TEdit
      Left = 25
      Top = 103
      Width = 64
      Height = 35
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 196
      Top = 500
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 2
      object btnSalvar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Salvar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 9
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 334
      Top = 500
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 14869218
      ParentBackground = False
      TabOrder = 3
      object btnCancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5585461
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnCancelarClick
        ExplicitLeft = -6
        ExplicitTop = -8
      end
    end
    object edtNome: TEdit
      Left = 95
      Top = 103
      Width = 469
      Height = 35
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DTdata: TDateTimePicker
      Left = 570
      Top = 103
      Width = 186
      Height = 35
      Date = 45660.000000000000000000
      Time = 0.898785590274201200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object dbItens: TDBGrid
      Left = 25
      Top = 144
      Width = 731
      Height = 193
      BorderStyle = bsNone
      Color = clWhite
      DataSource = DsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object tabPedido: TFDMemTable
    FieldDefs = <
      item
        Name = 'id_pedido'
        DataType = ftInteger
      end
      item
        Name = 'id_usuario'
        DataType = ftInteger
      end
      item
        Name = 'id_cliente'
        DataType = ftInteger
      end
      item
        Name = 'dt_pedido'
        DataType = ftDate
      end
      item
        Name = 'vl_total'
        DataType = ftFloat
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'usuario'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 768
    Top = 24
    object id_pedido: TIntegerField
      FieldName = 'id_pedido'
    end
    object id_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object id_cliente: TIntegerField
      FieldName = 'id_cliente'
    end
    object dt_pedido: TDateField
      FieldName = 'dt_pedido'
    end
    object vl_total: TFloatField
      FieldName = 'vl_total'
    end
    object nome: TStringField
      FieldName = 'nome'
    end
    object tabPedidocidade: TStringField
      FieldName = 'cidade'
    end
    object usuario: TStringField
      FieldName = 'usuario'
    end
  end
  object tabItens: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 768
    Top = 88
  end
  object DsItens: TDataSource
    DataSet = tabItens
    Left = 688
    Top = 24
  end
end
