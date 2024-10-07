object frmPedido: TfrmPedido
  AlignWithMargins = True
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Pedidos'
  ClientHeight = 606
  ClientWidth = 1028
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDefault
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object pHeader: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 1028
    Height = 80
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = 16051947
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 20
      Width = 103
      Height = 60
      Margins.Top = 20
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Pedidos'
      Color = 16051947
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585461
      Font.Height = -29
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitHeight = 40
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 722
      Top = 20
      Width = 138
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 0
      object spButton: TSpeedButton
        Left = 0
        Top = 0
        Width = 138
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Inserir'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI Black'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = spButtonClick
        ExplicitTop = -30
        ExplicitWidth = 194
        ExplicitHeight = 50
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 875
      Top = 20
      Width = 138
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 6906591
      ParentBackground = False
      TabOrder = 1
      object SBExcluir: TSpeedButton
        Left = 0
        Top = 0
        Width = 138
        Height = 40
        Cursor = crHandPoint
        Margins.Top = 20
        Margins.Bottom = 20
        Align = alClient
        Caption = 'Excluir'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI Black'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SBExcluirClick
        ExplicitTop = -30
        ExplicitWidth = 194
        ExplicitHeight = 50
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 569
      Top = 20
      Width = 138
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 2
      object sbEditar: TSpeedButton
        Left = 0
        Top = 0
        Width = 138
        Height = 40
        Cursor = crHandPoint
        Margins.Top = 20
        Margins.Bottom = 20
        Align = alClient
        Caption = 'Editar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI Black'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbEditarClick
        ExplicitTop = -30
        ExplicitWidth = 194
        ExplicitHeight = 50
      end
    end
    object pnlBuscar: TPanel
      AlignWithMargins = True
      Left = 109
      Top = 0
      Width = 410
      Height = 80
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 50
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = 16051947
      ParentBackground = False
      TabOrder = 3
      object pnlButtonBuscar: TPanel
        AlignWithMargins = True
        Left = 257
        Top = 20
        Width = 138
        Height = 40
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 15
        Margins.Bottom = 20
        Align = alRight
        BevelOuter = bvNone
        Color = 16475988
        ParentBackground = False
        TabOrder = 0
        object sbBuscar: TSpeedButton
          Left = 0
          Top = 0
          Width = 138
          Height = 40
          Cursor = crHandPoint
          Margins.Top = 20
          Margins.Bottom = 20
          Align = alClient
          Caption = 'Filtrar'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Segoe UI Black'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 6
        end
      end
      object edtPesquisar: TEdit
        AlignWithMargins = True
        Left = 0
        Top = 20
        Width = 257
        Height = 40
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 20
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitHeight = 33
      end
    end
  end
  object DBPedido: TDBGrid
    AlignWithMargins = True
    Left = 0
    Top = 80
    Width = 1028
    Height = 526
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BorderStyle = bsNone
    Color = clWhite
    DataSource = DsPedido
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id_pedido'
        Title.Caption = 'Id. Pedido'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -19
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Cliente'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -19
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Title.Caption = 'Cidade'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -19
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuario'
        Title.Caption = 'Usuario Cad.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -19
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 146
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt_pedido'
        Title.Alignment = taCenter
        Title.Caption = 'Data do Pedido'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -19
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_total'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor total'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -19
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 153
        Visible = True
      end>
  end
  object DsPedido: TDataSource
    DataSet = tabPedido
    Left = 944
    Top = 208
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
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 856
    Top = 208
    object tabPedidoid_pedido: TIntegerField
      FieldName = 'id_pedido'
    end
    object tabPedidoid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object tabPedidodt_pedido: TDateField
      FieldName = 'dt_pedido'
    end
    object tabPedidovl_total: TFloatField
      FieldName = 'vl_total'
    end
    object tabPedidonome: TStringField
      FieldName = 'nome'
    end
    object tabPedidocidade: TStringField
      FieldName = 'cidade'
    end
    object tabPedidousuario: TStringField
      FieldName = 'usuario'
    end
  end
end
