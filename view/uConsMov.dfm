object fConsMov: TfConsMov
  Left = 0
  Top = 0
  Caption = 'Consulta de Movimento'
  ClientHeight = 326
  ClientWidth = 930
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 930
    Height = 69
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 926
    object Label2: TLabel
      Left = 11
      Top = 6
      Width = 37
      Height = 15
      Caption = 'Cliente'
    end
    object btnPesquisar: TBitBtn
      Left = 798
      Top = 31
      Width = 115
      Height = 25
      Caption = '&Pesquisar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF686868
        6868686868686767676767676767676767676767676666666666666666666666
        66656565807F7F807F7FFF00FF767676FCFCFCF7F7F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F6F6F6F6F6F6F6F6F6F3F3F3828282989999808181FF00FF818181
        F7F7F7E0E0E0E1E1E1E1E1E1E1E1E1E1E1E1E0E0E0E0E0E0DEDEDEDDDDDDA5A5
        A59D9D9D818383FF00FFFF00FF8B8B8BF8F8F8E3E3E3E5E5E5E5E5E5E5E5E5E5
        E5E5C6C6C6C5C5C5CBCBCBBCBCBC9192927B7D7DFF00FFFF00FFFF00FF959595
        F8F8F8E7E7E7E7E7E7E9E9E9D1D1D19190909D9D9DABABAB9796967E7E7E8081
        818F8F8FFF00FFFF00FFFF00FF9A9A9AFAFAFAEAEAEAEBEBEBCFCCC9919090D0
        CCC9E7E5E1FEFBF8FEFBF8CBC7C7959293999999FF00FFFF00FFFF00FFA1A1A1
        FBFBFBEDEDEDEEEEEEB2ADA9ADA59AFCF3E6FEF4EBFEF6EBFEF6EDFEF6EDABA6
        A5989898FF00FFFF00FFFF00FFA5A5A5FBFBFBEFEFEFF0F0F0919090C7BAAAFC
        EEDDFCEFDEFCEFE0FCEFE0FCEFE1C7BFB88C8C8CFF00FFFF00FFFF00FFA9A9A9
        FBFBFBF2F2F2F3F3F3999999C7B29CFAE5CAFBE7D0FBE6CFFBE9D3FBEAD5B8AF
        A9ADADADFF00FFFF00FFFF00FFABABABFCFCFCF4F4F4F6F6F6C2C2C2928475F8
        E2C9FBE9D3FBE9D3FBE9D3F4E3CE8E8887A4A4A4FF00FFFF00FFFF00FFACACAC
        FCFCFCF6F6F6F7F7F7F7F7F7908F8E9C8E7FD0C2B1EEDCC6CABDAF9C928BB5B5
        B5ACACACFF00FFFF00FFFF00FFADADADFCFCFCF7F7F7F8F8F8F8F8F8FAFAFAB4
        B4B4908B89919090979392C9C9C9FCFCFCADADADFF00FFFF00FFFF00FFAFAFAF
        FEFEFEF8F8F8FAFAFAFAFAFAFAFAFAFAFAFAF8F8F8F7F7F7AFAFAFBCBCBCD0D0
        D0ADADADFF00FFFF00FFFF00FFAFAFAFFEFEFEFAFAFAFAFAFAFBFBFBFBFBFBFB
        FBFBFAFAFAF8F8F8BCBCBCD9D9D9ADADADFF00FFFF00FFFF00FFFF00FFAFAFAF
        FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF8F8F8D0D0D0ADADADFF00
        FFFF00FFFF00FFFF00FFFF00FFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF
        AFAFAFAFAFAFAFAFADADADFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 0
      OnClick = btnPesquisarClick
    end
    object edtCliente: TEdit
      Left = 8
      Top = 24
      Width = 153
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 289
    Width = 930
    Height = 37
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 288
    ExplicitWidth = 926
    object btnNovo: TBitBtn
      Left = 168
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Novo'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FF0A6B0A0A6B0A0A6B0A0A6B0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFB25D130A6B0A42D37331B85A0A6B0AA8
        4E0FA54A0EA4480DA1440DA0420C9F3F0C9D3E0BFF00FFFF00FFFF00FFFF00FF
        B561140A6B0A78F3A440D1710A6B0AFBF0DEFBEFDAFBEDD5FBEBD1FBE9CDFBE7
        C89E400BFF00FFFF00FF0A6B0A0A6B0A0A6B0A0A6B0A78F3A444D5740A6B0A0A
        6B0A0A6B0A0A6B0AFCEDD6FBEBD1FBEACEA1430CFF00FFFF00FF0A6B0A78F3A4
        53E4844FE1804CDD7C48D97845D67541D27231B85A0A6B0AFBEFDBFCEDD6FBEB
        D1A3470DFF00FFFF00FF0A6B0A78F3A478F3A478F3A478F3A44DDE7D78F3A478
        F3A442D3730A6B0AFCF1E0FBEFDBFBEDD7A64B0EFF00FFFF00FF0A6B0A0A6B0A
        0A6B0A0A6B0A78F3A450E2810A6B0A0A6B0A0A6B0A0A6B0AFCF4E4FBF1E1FCEF
        DCA94F0FFF00FFFF00FFFF00FFFF00FFC375190A6B0A78F3A454E5850A6B0AFC
        F9F5FCF7F1FCF7EEFCF5E9FBF3E4FCF2E2AC5110FF00FFFF00FFFF00FFFF00FF
        C579190A6B0A78F3A478F3A40A6B0AFCFAF7FCF9F5FCF7F2FCF7EEFBF6E9FBF3
        E5AD5611FF00FFFF00FFFF00FFFF00FFC77C1A0A6B0A0A6B0A0A6B0A0A6B0AFC
        FBFBFCFAF8FCF9F5FBF8F2FCF7EEFBF6EAB05A12FF00FFFF00FFFF00FFFF00FF
        C97F1CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFCFBF8FCF9F6FCF8F2FCF7
        EFB35E13FF00FFFF00FFFF00FFFF00FFCC821CFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFAFCFBF9FCFAF6FCF8F3B66214FF00FFFF00FFFF00FFFF00FF
        CE851DFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFCFBF9FCFA
        F7B96615FF00FFFF00FFFF00FFFF00FFCF861DFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFCFBFCFBF8BC6A16FF00FFFF00FFFF00FFFF00FF
        CF871DCF871DCE861DCC831CCC821CCA801BC87D1BC67A1AC47719C37419C172
        17BF6F17FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TBitBtn
      Left = 279
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Alterar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFB25D13AF5912AD5612AC5311AA4F10A84E0FA54A0EA4
        480DA1440DA0420C9F3F0C9D3E0BFF00FFFF00FFFF00FFFF00FFB56114FCF7EF
        FBF6EBF3EBE0FCF2E3FBF0DEFBEFDAFBEDD5FBEBD1FBE9CDFBE7C89E400BFF00
        FFFF00FFFF00FFFF00FFB86516FCF8F3FCF7EF1D2B321B2F37A7C0C5EDE0CFF4
        E0C8F8E6CFFBEBD1FBEACEA1430CFF00FFFF00FFFF00FFFF00FFBB6916FCFAF7
        FCF8F43F5A655999A455B9D12A84A64A8763E3C0A5E4C1A4E8C9ABA2450DFF00
        FFFF00FFFF00FFFF00FFBE6D17FCFBF9FCFAF7B2CDD96BBAD688E9EF2381400E
        6D0D0E6E0EE3C0A5E3BFA2A3470DFF00FFFF00FFFF00FFFF00FFC07217FCFBFC
        FCFBF9EBEFF14190B23687509CDEB056B86D146F110E6E0EE3C0A6A54A0EFF00
        FFFF00FFFF00FFFF00FFC37519FCFCFCFCFCFCFCFBFA5B9A9A53975392C69994
        E1AC4EB565146F110E6E0EA84C0FFF00FFFF00FFFF00FFFF00FFC57919FCFCFC
        FCFCFCFCFCFCFCFBF931833550955080BC8784DCA046B15E146F110E6E0EFF00
        FFFF00FFFF00FFFF00FFC77C1AFCFCFCFCFCFCFCFCFCFCFCFCFCFBFB31833547
        8F476DB27573D7943EAE58116A0E0E6E9B84ACBDFF00FFFF00FFC97F1CFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFA3183353C893C5AA96461D1874297AC34A3
        CC0E6E9BFF00FFFF00FFCC821CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFA3183353183354297AC9AFBFB4297AC141EB10A0A9AFF00FFCE851DFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFB4297AC87EDF64297AC476B
        FC1D46F72231C34B4BAACF861DFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCEEF5F74297AC1116A6476BFC1D46F70A0A9AFF00FFCF871DCF871D
        CE861DCC831CCC821CCA801BC87D1BC67A1AC47719C37419C172170A0A9A2231
        C30A0A9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF4B4BAAFF00FFFF00FFFF00FF}
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TBitBtn
      Left = 392
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Excluir'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        2D2BAA252595FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0101
        60000073FF00FFFF00FFFF00FF3836B61111B81C1CB82F2FA4FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF06066D01018A00008B020074FF00FF3F3FBB1616C5
        0A0AC20A0AC02222C43737ADFF00FFFF00FFFF00FFFF00FF11117B0505910000
        9000009000008B0200743B3BB22C2CD30D0DD00D0DCE0C0CC92828CC3D3DB4FF
        00FFFF00FF1F1F8E0C0C9F00009200009000009000008800005DFF00FF4747C1
        3333DE1111DA0F0FD50D0DCF2A2AD13C3CB42F2FA41717B40303A30101990000
        91010189010160FF00FFFF00FFFF00FF5454CC3C3CE71313E11111DA0E0ED328
        28CF2222C60707B50505AA0303A0060693050566FF00FFFF00FFFF00FFFF00FF
        FF00FF5C5CD33F3FEA1414E31111DC0E0ED10C0CC70909BC0606B10D0DA40E0E
        77FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5B5BD03D3DE61414E311
        11DA0D0DCF0A0AC21616B5181886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF6E6ECE5B5BE92020E71313E10F0FD40C0CC91616B7181887FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7878CE7474E75353EE4848ED35
        35E92020DD1111CE0A0ABF0F0FAB0E0E79FF00FFFF00FFFF00FFFF00FFFF00FF
        7F7FCB8787E56D6DF26363F05757EF5C5CDE5252D83B3BDA2D2DCE1F1FC01818
        A5111176FF00FFFF00FFFF00FF8484C79797E38484F47B7BF37070F27272E05B
        5BBB4D4DB15151CF4141D43838C92F2FBD2929A51B1B78FF00FF8686C2A0A0E0
        9999F69191F68888F48383DE6767BCFF00FFFF00FF4747A55050C54242CB3737
        C02E2EB52929A01D1D7A9393B7A5A5EAA1A1F79A9AF69292DD6E6EBDFF00FFFF
        00FFFF00FFFF00FF3F3F9C4A4ABC3B3BC03232B52D2DA92B2B8EFF00FF9594B6
        A7A7E99D9DDC7676BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3C3C984141
        B53535B0343495FF00FFFF00FFFF00FF9796B68080C0FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF3636933E3E9AFF00FFFF00FF}
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnSair: TBitBtn
      Left = 502
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Sair'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF244E6E
        0A6B9BA6B2F19FA4DAA29CBFAD9BAAB69E9EB69E9EB69F9FB69F9FB69F9FB69F
        9F3C9DBE244E6EFF00FFFF00FF244E6E0A6B9B95AAFC8199FC6F8BFC5D7DFC56
        72F06272D47A79B899879CAB9090AB90903FA0BF244E6EFF00FFFF00FF244E6E
        0A6B9B849CFC728DFC607FFC4E71FC3C62FC2A54FC1745FC0A3AFAA08181A081
        8142A3C1244E6EFF00FFFF00FF244E6E0D6E9D7490FC6282FC5074FC3E64FC2C
        56FC1A48FC0A3BFC0A34F095727295727245A6C2244E6EFF00FFFF00FF244E6E
        10719F6684FC5475FC4267FC3059FC1E4AFC0C3CFC0A36F20A2FE58963638963
        6348A9C4244E6EFF00FFFF00FF244E6E1374A15778FC4569FC335BFC214DFC0F
        3EFC0A37F40A2FE60A2ADA7E54547E54544BACC6244E6EFF00FFFF00FF244E6E
        1575A3486CFC365EFC244FFC1240FC0A37F50A31E80A2ADC0A24D07446467446
        464EAEC8244E6EFF00FFFF00FF244E6E1778A53960FC2751FC1543FC0A38F70A
        32EA0A2BDE0A7ED80AA0E16A3C3C6B3B3B50B1CA244E6EFF00FFFF00FF244E6E
        1A7BA72A54FC1744FC0A39F90A33ED0A2CE00A27D30B91EA4DC9F3693D3E6B3B
        3B53B4CC244E6EFF00FFFF00FF244E6E1D7EA91947FC0A3AFB0A34EF0A2DE30A
        28D50A21C90A1BBD0A15B06B3B3B6B3B3B56B7CE244E6EFF00FFFF00FF244E6E
        2081AB0A3BFC0A35F10A2EE40A29D80A22CB0A1CBF0A16B20A0EA56B3B3B6B3B
        3B59BAD0244E6EFF00FFFF00FF244E6E2384AC0A36F30A2FE60A2ADA0A23CE0A
        1DC00A15B10A0FA40A0A9B6B3B3B6B3B3B5CBDD1244E6EFF00FFFF00FF244E6E
        2687AE0A31E80A2ADC0A24D00A1BBE0A13AD0A0EA30A0A9C0A0A9B6B3B3B6B3B
        3B5EBFD3244E6EFF00FFFF00FF244E6E2989B00A2BDE0A21C90A17B40A11AA0A
        0EA20A0B9C0A0A9B0A0A9B6B3B3B6B3B3B61C1D5244E6EFF00FFFF00FF244E6E
        2B8CB23192B53697B93C9CBC3FA0BF45A6C24AABC64FB0C954B5CD59BAD15FBF
        D363C4D7244E6EFF00FFFF00FF244E6E244E6E244E6E244E6E244E6E244E6E24
        4E6E244E6E244E6E244E6E244E6E244E6E244E6E244E6EFF00FF}
      TabOrder = 3
      OnClick = btnSairClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 69
    Width = 930
    Height = 220
    Align = alClient
    DataSource = dmGeral.dsMovimento
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
end
