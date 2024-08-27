object frmCAD_PRODUTOS: TfrmCAD_PRODUTOS
  Left = 243
  Top = 62
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtos'
  ClientHeight = 541
  ClientWidth = 843
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 843
    Height = 541
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 5
    Color = 13100779
    TabOrder = 0
    object dbgCAD_PRODUTOS: TwwDBGrid
      Left = 43
      Top = 7
      Width = 793
      Height = 527
      ControlType.Strings = (
        'LOTE;CustomEdit;dblLotes;T'
        'D_DEV;CheckBox;S;N'
        'C_ENVIADO;CheckBox;S;N')
      Selected.Strings = (
        'C_ID_PRODUTO'#9'4'#9'Id'
        'C_COD_SAP'#9'11'#9'Cod. Etiq.~SAP'
        'C_COD_EAN13'#9'14'#9'C'#243'digo~de Barra'
        'C_TIPO_ETIQUETA'#9'13'#9'Tipo de~Etiqueta'
        'C_COD_PRODUTO'#9'11'#9'C'#243'd. do~Produto'
        'C_SIGLA_PRODUTO'#9'9'#9'Sigla~Prod.'
        'C_NOME_COMERCIAL'#9'20'#9'Refer'#234'ncia~Comercial'
        'C_COR_PRODUTO'#9'14'#9'Cor do~Produto'
        'C_TENSAO_PRODUTO'#9'6'#9'Tens'#227'o~(V)')
      IniAttributes.Delimiter = ';;'
      TitleColor = clMedGray
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoSearchOwnerForm, ecoDisableCustomControls]
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsCAD_PRODUTOS
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      KeyOptions = [dgEnterToTab, dgAllowDelete, dgAllowInsert]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Verdana'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnCalcCellColors = dbgCAD_PRODUTOSCalcCellColors
    end
    object wwDBNavigator1: TwwDBNavigator
      Left = 7
      Top = 7
      Width = 36
      Height = 527
      AutosizeStyle = asSizeNavButtons
      DataSource = dsCAD_PRODUTOS
      Layout = nlVertical
      Options = []
      RepeatInterval.InitialDelay = 500
      RepeatInterval.Interval = 100
      Align = alLeft
      object wwDBNavigator1Insert: TwwNavButton
        Left = 0
        Top = 0
        Width = 36
        Height = 88
        Hint = 'Insert new record'
        ImageIndex = -1
        NumGlyphs = 2
        Spacing = 4
        Transparent = False
        Caption = 'wwDBNavigator1Insert'
        Enabled = False
        DisabledTextColors.ShadeColor = clGray
        DisabledTextColors.HighlightColor = clBtnHighlight
        Index = 0
        Style = nbsInsert
      end
      object wwDBNavigator1Delete: TwwNavButton
        Left = 0
        Top = 88
        Width = 36
        Height = 88
        Hint = 'Delete current record'
        ImageIndex = -1
        NumGlyphs = 2
        Spacing = 4
        Transparent = False
        Caption = 'wwDBNavigator1Delete'
        Enabled = False
        DisabledTextColors.ShadeColor = clGray
        DisabledTextColors.HighlightColor = clBtnHighlight
        Index = 1
        Style = nbsDelete
      end
      object wwDBNavigator1Edit: TwwNavButton
        Left = 0
        Top = 176
        Width = 36
        Height = 88
        Hint = 'Edit current record'
        ImageIndex = -1
        NumGlyphs = 2
        Spacing = 4
        Transparent = False
        Caption = 'wwDBNavigator1Edit'
        Enabled = False
        DisabledTextColors.ShadeColor = clGray
        DisabledTextColors.HighlightColor = clBtnHighlight
        Index = 2
        Style = nbsEdit
      end
      object wwDBNavigator1Post: TwwNavButton
        Left = 0
        Top = 264
        Width = 36
        Height = 88
        Hint = 'Post changes of current record'
        ImageIndex = -1
        NumGlyphs = 2
        Spacing = 4
        Transparent = False
        Caption = 'wwDBNavigator1Post'
        Enabled = False
        DisabledTextColors.ShadeColor = clGray
        DisabledTextColors.HighlightColor = clBtnHighlight
        Index = 3
        Style = nbsPost
      end
      object wwDBNavigator1Cancel: TwwNavButton
        Left = 0
        Top = 352
        Width = 36
        Height = 88
        Hint = 'Cancel changes made to current record'
        ImageIndex = -1
        NumGlyphs = 2
        Spacing = 4
        Transparent = False
        Caption = 'wwDBNavigator1Cancel'
        Enabled = False
        DisabledTextColors.ShadeColor = clGray
        DisabledTextColors.HighlightColor = clBtnHighlight
        Index = 4
        Style = nbsCancel
      end
      object wwDBNavigator1Refresh: TwwNavButton
        Left = 0
        Top = 440
        Width = 36
        Height = 87
        Hint = 'Refresh the contents of the dataset'
        ImageIndex = -1
        NumGlyphs = 2
        Spacing = 4
        Transparent = False
        Caption = 'wwDBNavigator1Refresh'
        Enabled = False
        DisabledTextColors.ShadeColor = clGray
        DisabledTextColors.HighlightColor = clBtnHighlight
        Index = 5
        Style = nbsRefresh
      end
    end
  end
  object CAD_PRODUTOS: TTecQueryADO
    Connection = DM.DB_ADO
    CursorType = ctStatic
    BeforeDelete = CAD_PRODUTOSBeforeDelete
    Parameters = <>
    SQL.Strings = (
      'select * from CAD_PRODUTOS')
    CheckRequestLive = True
    Versao_Biblioteca = '25/06/2012'
    RequestLive = True
    Left = 268
    Top = 164
    object CAD_PRODUTOSC_ID_PRODUTO: TAutoIncField
      DisplayLabel = 'Id'
      DisplayWidth = 4
      FieldName = 'C_ID_PRODUTO'
      ReadOnly = True
    end
    object CAD_PRODUTOSC_COD_SAP: TStringField
      Alignment = taCenter
      DisplayLabel = 'Cod. Etiq.~SAP'
      DisplayWidth = 11
      FieldName = 'C_COD_SAP'
      Size = 10
    end
    object CAD_PRODUTOSC_COD_EAN13: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo~de Barra'
      DisplayWidth = 14
      FieldName = 'C_COD_EAN13'
      Size = 13
    end
    object CAD_PRODUTOSC_TIPO_ETIQUETA: TStringField
      DisplayLabel = 'Tipo de~Etiqueta'
      DisplayWidth = 13
      FieldName = 'C_TIPO_ETIQUETA'
    end
    object CAD_PRODUTOSC_COD_PRODUTO: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd. do~Produto'
      DisplayWidth = 11
      FieldName = 'C_COD_PRODUTO'
      Size = 10
    end
    object CAD_PRODUTOSC_SIGLA_PRODUTO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sigla~Prod.'
      DisplayWidth = 9
      FieldName = 'C_SIGLA_PRODUTO'
      Size = 4
    end
    object CAD_PRODUTOSC_NOME_COMERCIAL: TStringField
      DisplayLabel = 'Refer'#234'ncia~Comercial'
      DisplayWidth = 20
      FieldName = 'C_NOME_COMERCIAL'
    end
    object CAD_PRODUTOSC_COR_PRODUTO: TStringField
      DisplayLabel = 'Cor do~Produto'
      DisplayWidth = 14
      FieldName = 'C_COR_PRODUTO'
    end
    object CAD_PRODUTOSC_TENSAO_PRODUTO: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Tens'#227'o~(V)'
      DisplayWidth = 6
      FieldName = 'C_TENSAO_PRODUTO'
    end
  end
  object dsCAD_PRODUTOS: TwwDataSource
    DataSet = CAD_PRODUTOS
    Left = 276
    Top = 220
  end
end
