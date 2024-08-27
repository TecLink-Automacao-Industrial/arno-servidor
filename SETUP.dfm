object frmSETUP: TfrmSETUP
  Left = 295
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Setup 7188'
  ClientHeight = 297
  ClientWidth = 596
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
    Width = 596
    Height = 297
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 5
    Color = cl3DLight
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -225
    ExplicitTop = -258
    ExplicitWidth = 748
    ExplicitHeight = 568
    object Label7: TLabel
      Left = 16
      Top = 118
      Width = 135
      Height = 19
      Caption = 'C'#243'digo de Barra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 69
      Width = 81
      Height = 19
      Caption = 'Etiq. SAP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 15
      Width = 99
      Height = 19
      Caption = 'Colaborador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 181
      Top = 118
      Width = 144
      Height = 19
      Caption = 'Tipo de Etiqueta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 347
      Top = 118
      Width = 135
      Height = 19
      Caption = 'Cod. do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 167
      Width = 99
      Height = 19
      Caption = 'Sigla Prod.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 181
      Top = 167
      Width = 135
      Height = 19
      Caption = 'Refer'#234'ncia Com.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 347
      Top = 167
      Width = 126
      Height = 19
      Caption = 'Cor do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 503
      Top = 167
      Width = 54
      Height = 19
      Caption = 'Tens'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TecGroupBox2: TTecGroupBox
      Left = 7
      Top = 240
      Width = 582
      Height = 50
      Align = alBottom
      Caption = 'Op'#231#245'es'
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 14
      ExplicitTop = 260
      ExplicitWidth = 509
      object cmdSair: TTecButton
        Tag = 6
        Left = 298
        Top = 10
        Width = 90
        Height = 29
        Hint = 'Fecha a tela.'
        Cancel = True
        Caption = 'Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = False
        OnClick = cmdSairClick
        CorMouseIn = clYellow
        Cor = clBtnFace
        CorDefault = 16711808
        Estilo = teDegrade
        CorFundoIni = clWhite
        CorFundoFim = 11053224
        CorFonteMouseIn = clBlue
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF6B2A006828005C2300521F004E1E004E
          1F004E1F004E1F004E1F004F1F004F1F00401800FF00FFFF00FFFF00FF963A00
          BC4A00B54600AA4200A13F009A3D00983C00993C00993C00993C00993C009F3F
          007D3100401800FF00FFFF00FFB74800E25800D35200CA4F00C24C00B84800B0
          4500AD4400AC4300AD4300AD4300B446009F3F004F1F00FF00FFFF00FFC44D00
          E75B00D95600D15300C94E00CE7328CF8240CA8041C17332B15510A74100AD43
          00993C004F1F00FF00FFFF00FFCA4F00F36807E96004DE5A01D45300EAB788FE
          FEFEFEFEFEFEFEFEFEFEFEC47A3DAD4300993C004E1F00FF00FFFF00FFCA4F00
          F67A1CF06B0CEB6204E15900D85802D35C09CB5C0BC55B0EDDA674FEFEFEAD43
          00993C004E1F00FF00FFFF00FFCA4F00F7913CF07516EF6707ED6202F4BB87DC
          5600D45300CB4F00C55709FEFEFEB647009D3D004F1F00FF00FFFF00FFCA4F00
          F79F54F07B1FEF6A0AF7BA81FEFEFEE95B00DE5700D45300DE8841FEFEFEC14B
          00A54100582300FF00FFFF00FFCA4F00F8A760F28128FAD0A9FEFEFEFEFEFEFB
          E6D1FAD8B7F7D7B7FEFEFEE9AB73CE5000B14500682800FF00FFFF00FFCA4F00
          F8AD6BF38832FACCA4FEFEFEFEFEFEFAD4B2F7BB84F7BA82EE8E3EDD5600DA55
          00BF4A00772E00FF00FFFF00FFCA4F00FAB77BF49646F27F24F8BF8AFEFEFEEF
          6C0DEF6A0AEF6404EE5E00E95B00E55A00CB4F00873500FF00FFFF00FFCA4F00
          FABA80F7B477F6A45CF49A4EF8C595F2842CF07A1EEF6A0AEE6203EF5E00F25E
          00D95500963A00FF00FFFF00FFCB4F00FAA65DFABB82FABD87FAB77BF8AC69F7
          9D4FF6872DF47413F36604F36000FA6200E35900A14000FF00FFFF00FFFF00FF
          CF5C0AD46C1CD46E1ED46E1ED36A18D16513CF5C0ACC5504CB5101CA5000CB50
          00BA4800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = tblGlyphLeft
        DirecaoFundo = dfHorizontal
        Down = False
        TravaDown = False
        AllowAllUp = False
        UseWidthGlyph = False
        WidthGlyph = 16
      end
      object cmdConfirmar: TTecButton
        Tag = 6
        Left = 197
        Top = 10
        Width = 90
        Height = 29
        Hint = 'Gravar Produto'
        Caption = 'Confirma'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = cmdConfirmarClick
        CorMouseIn = clYellow
        Cor = 13100779
        CorDefault = 16711808
        Estilo = teDegrade
        CorFundoIni = clWhite
        CorFundoFim = 11053224
        CorFonteMouseIn = clBlue
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF7F2B287F2B28A18283A18283A18283A1
          8283A18283A18283A182837A1C1C7F2B28FF00FFFF00FFFF00FFFF00FF7F2B28
          CA4D4DB64545DDD4D5791617791617DCE0E0D7DADECED5D7BDBABD76100F9A2D
          2D7F2B28FF00FFFF00FFFF00FF7F2B28C24A4BB14444E2D9D9791617791617D9
          D8DAD9DEE1D3D9DCC1BDC1761111982D2D7F2B28FF00FFFF00FFFF00FF7F2B28
          C24A4AB04242E6DCDC791617791617D5D3D5D8DEE1D7DDE0C6C2C5700F0F962C
          2C7F2B28FF00FFFF00FFFF00FF7F2B28C24A4AB04141EADEDEE7DDDDDDD4D5D7
          D3D5D5D7D9D7D8DACAC2C57E17179E31317F2B28FF00FFFF00FFFF00FF7F2B28
          BF4748B84545BA4C4CBD5757BB5756B64E4EB44949BD5251BB4B4CB54242BF4A
          4A7F2B28FF00FFFF00FFFF00FF7F2B28A33B39B1605DC68684CB918FCC9190CC
          908FCB8988C98988CB9391CC9696BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
          BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B
          4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
          BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
          4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
          BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
          4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FFFF00FF
          7F2B28F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F77F2B
          28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = tblGlyphLeft
        DirecaoFundo = dfHorizontal
        Down = False
        TravaDown = False
        AllowAllUp = False
        UseWidthGlyph = False
        WidthGlyph = 16
      end
    end
    object txtProd_Ean: TEdit
      Left = 16
      Top = 137
      Width = 160
      Height = 27
      Alignment = taCenter
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object lcColaborador: TwwDBLookupCombo
      Left = 16
      Top = 35
      Width = 481
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'C_NOME_COLABORADOR'#9'50'#9'C_NOME_COLABORADOR'#9'F'#9)
      LookupTable = CAD_COLABORADORES
      LookupField = 'C_NOME_COLABORADOR'
      Options = [loColLines, loRowLines]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnCloseUp = lcProdutoCloseUp
    end
    object lcProduto: TwwDBLookupCombo
      Left = 16
      Top = 88
      Width = 140
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Ari]'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'C_COD_SAP'#9'10'#9'Cod. Etiq Sap'#9'F'#9
        'C_COD_EAN13'#9'13'#9'C'#243'digo Barra'#9'F'#9
        'C_TIPO_ETIQUETA'#9'10'#9'Tipo Etiq'#9'F'#9
        'C_COD_PRODUTO'#9'10'#9'C'#243'd. Produto'#9'F'#9
        'C_SIGLA_PRODUTO'#9'4'#9'Sigla Prod.'#9'F'#9
        'C_NOME_COMERCIAL'#9'10'#9'Refer'#234'ncia Com.'#9'F'#9
        'C_COR_PRODUTO'#9'10'#9'Cor Produto'#9'F'#9
        'C_TENSAO_PRODUTO'#9'5'#9'Tens'#227'o'#9'F'#9
        'C_ID_PRODUTO'#9'3'#9'Id'#9'F'#9)
      LookupTable = CAD_PRODUTOS
      LookupField = 'C_COD_SAP'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      OnCloseUp = lcProdutoCloseUp
    end
    object txtProd_Tipo: TEdit
      Left = 181
      Top = 137
      Width = 160
      Height = 27
      Alignment = taCenter
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object txtProd_Cod: TEdit
      Left = 347
      Top = 137
      Width = 150
      Height = 27
      Alignment = taCenter
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object txtProd_Sigla: TEdit
      Left = 16
      Top = 186
      Width = 160
      Height = 27
      Alignment = taCenter
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object txtProd_Ref: TEdit
      Left = 181
      Top = 186
      Width = 160
      Height = 27
      Alignment = taCenter
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object txtProd_Cor: TEdit
      Left = 347
      Top = 186
      Width = 150
      Height = 27
      Alignment = taCenter
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object txtProd_Tensao: TEdit
      Left = 503
      Top = 186
      Width = 54
      Height = 27
      Alignment = taCenter
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
  end
  object CAD_COLABORADORES: TTecQueryADO
    Connection = DM.DB_ADO
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select'
      'C_COD_COLABORADOR,'
      'C_MATRICULA,'
      'C_NOME_COLABORADOR from CAD_COLABORADORES'
      'order by C_NOME_COLABORADOR')
    CheckRequestLive = True
    Versao_Biblioteca = '25/06/2012'
    RequestLive = False
    Left = 524
    Top = 33
    object CAD_COLABORADORESC_NOME_COLABORADOR: TStringField
      DisplayWidth = 50
      FieldName = 'C_NOME_COLABORADOR'
      Size = 50
    end
    object CAD_COLABORADORESC_COD_COLABORADOR: TIntegerField
      DisplayWidth = 10
      FieldName = 'C_COD_COLABORADOR'
      ReadOnly = True
      Visible = False
    end
    object CAD_COLABORADORESC_MATRICULA: TStringField
      DisplayWidth = 10
      FieldName = 'C_MATRICULA'
      Visible = False
      Size = 10
    end
  end
  object CAD_PRODUTOS: TTecQueryADO
    Connection = DM.DB_ADO
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from CAD_PRODUTOS order by C_COD_SAP')
    CheckRequestLive = True
    Versao_Biblioteca = '25/06/2012'
    RequestLive = False
    Left = 516
    Top = 92
    object CAD_PRODUTOSC_COD_SAP: TStringField
      DisplayLabel = 'Cod. Etiq Sap'
      DisplayWidth = 10
      FieldName = 'C_COD_SAP'
      Size = 10
    end
    object CAD_PRODUTOSC_COD_EAN13: TStringField
      DisplayLabel = 'C'#243'digo Barra'
      DisplayWidth = 13
      FieldName = 'C_COD_EAN13'
      Size = 13
    end
    object CAD_PRODUTOSC_TIPO_ETIQUETA: TStringField
      DisplayLabel = 'Tipo Etiq'
      DisplayWidth = 10
      FieldName = 'C_TIPO_ETIQUETA'
    end
    object CAD_PRODUTOSC_COD_PRODUTO: TStringField
      DisplayLabel = 'C'#243'd. Produto'
      DisplayWidth = 10
      FieldName = 'C_COD_PRODUTO'
      Size = 10
    end
    object CAD_PRODUTOSC_SIGLA_PRODUTO: TStringField
      DisplayLabel = 'Sigla Prod.'
      DisplayWidth = 4
      FieldName = 'C_SIGLA_PRODUTO'
      Size = 4
    end
    object CAD_PRODUTOSC_NOME_COMERCIAL: TStringField
      DisplayLabel = 'Refer'#234'ncia Com.'
      DisplayWidth = 10
      FieldName = 'C_NOME_COMERCIAL'
    end
    object CAD_PRODUTOSC_COR_PRODUTO: TStringField
      DisplayLabel = 'Cor Produto'
      DisplayWidth = 10
      FieldName = 'C_COR_PRODUTO'
    end
    object CAD_PRODUTOSC_TENSAO_PRODUTO: TIntegerField
      DisplayLabel = 'Tens'#227'o'
      DisplayWidth = 5
      FieldName = 'C_TENSAO_PRODUTO'
    end
    object CAD_PRODUTOSC_ID_PRODUTO: TIntegerField
      DisplayLabel = 'Id'
      DisplayWidth = 3
      FieldName = 'C_ID_PRODUTO'
      ReadOnly = True
    end
  end
end
