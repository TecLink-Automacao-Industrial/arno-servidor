object frmCAD_COLABORADORES: TfrmCAD_COLABORADORES
  Left = 235
  Top = 154
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Colaboradores'
  ClientHeight = 393
  ClientWidth = 746
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
    Width = 746
    Height = 393
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 5
    Color = 13100779
    TabOrder = 0
    object dbgCAD_COLABORADORES: TwwDBGrid
      Left = 43
      Top = 7
      Width = 696
      Height = 379
      ControlType.Strings = (
        'LOTE;CustomEdit;dblLotes;T'
        'D_DEV;CheckBox;S;N'
        'C_ENVIADO;CheckBox;S;N')
      Selected.Strings = (
        'C_NOME_COLABORADOR'#9'71'#9'Nome do Colaborador'
        'C_MATRICULA'#9'12'#9'Matr'#237'cula'
        'C_COD_COLABORADOR'#9'10'#9'C'#243'digo')
      IniAttributes.Delimiter = ';;'
      TitleColor = clMedGray
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoSearchOwnerForm, ecoDisableCustomControls]
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsCAD_COLABORADORES
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
      OnCalcCellColors = dbgCAD_COLABORADORESCalcCellColors
    end
    object wwDBNavigator1: TwwDBNavigator
      Left = 7
      Top = 7
      Width = 36
      Height = 379
      AutosizeStyle = asSizeNavButtons
      DataSource = dsCAD_COLABORADORES
      Layout = nlVertical
      RepeatInterval.InitialDelay = 500
      RepeatInterval.Interval = 100
      Align = alLeft
      object wwDBNavigator1Insert: TwwNavButton
        Left = 0
        Top = 0
        Width = 36
        Height = 64
        Hint = 'Insert new record'
        ImageIndex = -1
        NumGlyphs = 2
        Spacing = 4
        Transparent = False
        Caption = 'wwDBNavigator1Insert'
        DisabledTextColors.ShadeColor = clGray
        DisabledTextColors.HighlightColor = clBtnHighlight
        Index = 0
        Style = nbsInsert
      end
      object wwDBNavigator1Delete: TwwNavButton
        Left = 0
        Top = 64
        Width = 36
        Height = 63
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
        Top = 127
        Width = 36
        Height = 63
        Hint = 'Edit current record'
        ImageIndex = -1
        NumGlyphs = 2
        Spacing = 4
        Transparent = False
        Caption = 'wwDBNavigator1Edit'
        DisabledTextColors.ShadeColor = clGray
        DisabledTextColors.HighlightColor = clBtnHighlight
        Index = 2
        Style = nbsEdit
      end
      object wwDBNavigator1Post: TwwNavButton
        Left = 0
        Top = 190
        Width = 36
        Height = 63
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
        Top = 253
        Width = 36
        Height = 63
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
        Top = 316
        Width = 36
        Height = 63
        Hint = 'Refresh the contents of the dataset'
        ImageIndex = -1
        NumGlyphs = 2
        Spacing = 4
        Transparent = False
        Caption = 'wwDBNavigator1Refresh'
        DisabledTextColors.ShadeColor = clGray
        DisabledTextColors.HighlightColor = clBtnHighlight
        Index = 5
        Style = nbsRefresh
      end
    end
  end
  object CAD_COLABORADORES: TTecQueryADO
    Active = True
    Connection = DM.DB_ADO
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      'C_COD_COLABORADOR,'
      'C_MATRICULA,'
      'C_NOME_COLABORADOR from CAD_COLABORADORES'
      'order by C_NOME_COLABORADOR')
    CheckRequestLive = True
    Versao_Biblioteca = '25/06/2012'
    RequestLive = True
    Left = 268
    Top = 164
    object CAD_COLABORADORESC_NOME_COLABORADOR: TStringField
      DisplayLabel = 'Nome do Colaborador'
      DisplayWidth = 71
      FieldName = 'C_NOME_COLABORADOR'
      Size = 50
    end
    object CAD_COLABORADORESC_MATRICULA: TStringField
      DisplayLabel = 'Matr'#237'cula'
      DisplayWidth = 12
      FieldName = 'C_MATRICULA'
      Size = 10
    end
    object CAD_COLABORADORESC_COD_COLABORADOR: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'C_COD_COLABORADOR'
      ReadOnly = True
    end
  end
  object dsCAD_COLABORADORES: TwwDataSource
    DataSet = CAD_COLABORADORES
    Left = 276
    Top = 220
  end
end
