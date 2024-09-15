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
  object DBGrid1: TDBGrid
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
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Pedidos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Clientes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Endereco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    Left = 576
    Top = 152
  end
  object tabPedido: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 712
    Top = 200
  end
end
