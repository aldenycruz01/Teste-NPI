object frmPesquisarSocio: TfrmPesquisarSocio
  Left = 0
  Top = 0
  Caption = 'Pesquisar Socio '
  ClientHeight = 363
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 33
    Align = alTop
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object edtPesquisar: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 200
      Height = 25
      Align = alLeft
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitHeight = 24
    end
    object btnPesquisar: TBitBtn
      AlignWithMargins = True
      Left = 210
      Top = 4
      Width = 28
      Height = 25
      Align = alLeft
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFEF5F5F4F6F6F5FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEAEAE7AF
        ABA3C0BCB7F7F6F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEAEAE8A3A096746E60B0ACA4F5F5F4
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF1F1F1E4E4E5E3E3E4F1F1F1
        FEFEFEFEFEFEEAEAE9A09C916E6657A6A199EBEBE8FEFEFEFFFFFFFFFFFFFFFF
        FFFFFFFDFDFDE9E9E9B9BABB9B9A9994908B95908A979695BABABBDADADAAAA9
        A6716B5EA29E95ECEAEAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFCFCFCD8D9DA9E9B
        989B8872B99466CC9D65CC9F65B993649A87718583807E7E7EACABA8ECEAEAFE
        FEFEFFFFFFFFFFFFFFFFFFFFFFFEFEFEE4E4E49E9C99A98F6BE1AB64F3B464F6
        B564F6B564F3B464E1AA64A28865888582DBDBDBFEFEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF9FAFAB9BAB99B886FE6AD64F6B564F6B564F6B564F6B564F6B564
        F6B564E0AA64998770B6B7B9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEE
        A19E98BC9564F7B664F6B564F6B564F6B564F6B564F6B564F6B564F3B464B993
        64969695F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E69C948ACFA065F8B5
        64F6B564F6B564F6B564F6B564F6B564F6B564F6B564CD9E65948F8AE2E2E3FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E69C948BCFA065F7B664F6B564F6B563F6
        B564F6B564F6B563F6B564F6B564CC9E65948F8AE3E3E4FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFEEEEEEA29F9ABB9565F7B665F7BD77F7BC73F6B666F6B565F6BB72
        F7C07BF2B465B893659A9897F0F0F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8
        B9B9B99B876FE6AD63FAC37EF9CC94F8C78AF8C78AF9CF9CF8C381E1AA639A87
        71B8B8B9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE3E4E49A9895A88D
        69E7AE65F8BE76F9C584FAC585F8BF75E7AD63A98E6B9D9A97E9E9E9FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBD5D6D79B99979C8970BB9564CE
        A065D0A065BC95639C89719F9D99D8D8D9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFBFBFBE3E4E4BBBCBBA4A09B9D958B9D958BA29E99
        BCBCBCE3E4E4FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEF9F9F9EEEEEFE6E7E7E6E6E7EEEEEEFAFAFAFEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      ParentBiDiMode = False
      ParentFont = False
      Spacing = 10
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object btnConfCli: TBitBtn
      AlignWithMargins = True
      Left = 244
      Top = 4
      Width = 99
      Height = 25
      Align = alLeft
      Caption = 'Selecionar '
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000F50D0000F50D00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB
        AD95B7B8A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF97987B57751D516A17ACAB98
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF97967B52701C53984C5395484D6214ABAA98FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9695
        7A52701D54994C4E6515516F1D54984B4D6315ABAA98FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96957A53701D559A4C506A18AA
        AA949A9A7A56772154984B4D6315ABAA98FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF93917A53711D559A4C516A18A5A58CFFFFFFFFFFFF91926E
        56772154984B4D6315ABAA98FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9DA07C
        668D2653984B516A18A5A58CFFFFFFFFFFFFFFFFFFFFFFFF91926E5677215498
        4B4D6315ABAA98FFFFFFFFFFFFFFFFFFFFFF65673B58761D5DA6504F6817A4A4
        8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91926E56772154994B4D6315AB
        AA98FFFFFFFFFFFFFFFF898C694F6716516A17A5A58BFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF91926E56772154984B4C6314ABAA98FFFFFF
        FFFFFFFFFFC4C5B6B9BAA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF91926E56772152954A4B6014AEAD9AFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF8F8F6E6890285CA44F485D14FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF98
        9B6F608221506918FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A78AB8BAA5
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      TabOrder = 2
      OnClick = btnConfCliClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 650
    Height = 295
    Align = alClient
    DataSource = dsPesqSocio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 328
    Width = 650
    Height = 35
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object aqrPesqSocio: TADOQuery
    Active = True
    Connection = DM.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT ID_SOCIO,NOME_SOCIO FROM SOCIO ')
    Left = 88
    Top = 136
    object aqrPesqSocioID_SOCIO: TAutoIncField
      DisplayLabel = 'C'#211'D. SOCIO'
      FieldName = 'ID_SOCIO'
      ReadOnly = True
    end
    object aqrPesqSocioNOME_SOCIO: TStringField
      DisplayLabel = 'NOME DO SOCIO'
      FieldName = 'NOME_SOCIO'
      Size = 50
    end
  end
  object dsPesqSocio: TDataSource
    DataSet = aqrPesqSocio
    Left = 88
    Top = 184
  end
end