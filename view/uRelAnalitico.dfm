object fRelAnalitico: TfRelAnalitico
  Left = 0
  Top = 0
  ClientHeight = 805
  ClientWidth = 1028
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 992
    Height = 1403
    DataSource = dmGeral.dsRelAnalitico
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 47
      Top = 47
      Width = 898
      Height = 123
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Color = clWhite
      ParentColor = False
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 287
        Top = 84
        Width = 110
        Height = 29
        Alignment = taCenter
        Caption = 'Anal'#237'tico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 771
        Top = 0
        Width = 127
        Height = 16
        Align = faRightTop
        Info = itPageNumber
        Text = 'P'#225'gina'
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 3
        Top = 84
        Width = 73
        Height = 16
        Caption = 'Nr da Conta'
        Transparent = False
      end
      object RLDBText4: TRLDBText
        Left = 82
        Top = 84
        Width = 70
        Height = 16
        AutoSize = False
        DataField = 'conta'
        DataSource = dmGeral.dsRelAnalitico
        Text = ''
      end
      object RLImage1: TRLImage
        Left = 3
        Top = 3
        Width = 200
        Height = 50
      end
      object RLLabel2: TRLLabel
        Left = 508
        Top = 101
        Width = 96
        Height = 16
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBText1: TRLDBText
        Left = 610
        Top = 101
        Width = 100
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'sld_anterior'
        DataSource = dmGeral.dsRelAnalitico
        DisplayMask = '#,##0.00'
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 47
      Top = 170
      Width = 898
      Height = 16
      BandType = btHeader
      Color = 8421631
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic, fsUnderline]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel4: TRLLabel
        Left = 3
        Top = 0
        Width = 47
        Height = 16
        Align = faTopOnly
        Caption = 'Cliente'
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 610
        Top = 0
        Width = 95
        Height = 16
        Align = faTopOnly
        Caption = 'Movimenta'#231#227'o'
        Transparent = False
      end
      object RLLabel7: TRLLabel
        Left = 490
        Top = 0
        Width = 94
        Height = 16
        Align = faTopOnly
        Caption = 'Tp Movimento'
        Transparent = False
      end
      object RLLabel8: TRLLabel
        Left = 330
        Top = 0
        Width = 100
        Height = 16
        Align = faTopOnly
        Alignment = taCenter
        Caption = 'Data'
        Transparent = False
      end
    end
    object RLBand3: TRLBand
      Left = 47
      Top = 186
      Width = 898
      Height = 16
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLDBText3: TRLDBText
        Left = 3
        Top = 0
        Width = 310
        Height = 16
        Align = faTopOnly
        AutoSize = False
        DataField = 'nome_cliente'
        DataSource = dmGeral.dsRelAnalitico
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 610
        Top = 0
        Width = 100
        Height = 16
        Align = faTopOnly
        Alignment = taCenter
        AutoSize = False
        DataField = 'valor'
        DataSource = dmGeral.dsRelAnalitico
        DisplayMask = '#,##0.00'
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 490
        Top = 0
        Width = 100
        Height = 16
        Align = faTopOnly
        Alignment = taCenter
        AutoSize = False
        DataField = 'tp_mov'
        DataSource = dmGeral.dsRelAnalitico
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 330
        Top = 0
        Width = 100
        Height = 16
        Align = faTopOnly
        Alignment = taCenter
        AutoSize = False
        DataField = 'data'
        DataSource = dmGeral.dsRelAnalitico
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 47
      Top = 265
      Width = 898
      Height = 17
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 828
        Top = 0
        Width = 70
        Height = 16
        Align = faRightTop
        Text = 'Data:'
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 758
        Top = 0
        Width = 70
        Height = 16
        Align = faRightTop
        Info = itHour
        Text = 'Hora:'
      end
    end
    object RLBand5: TRLBand
      Left = 47
      Top = 202
      Width = 898
      Height = 63
      BandType = btSummary
      object RLLabel6: TRLLabel
        Left = 508
        Top = 23
        Width = 78
        Height = 16
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBResult1: TRLDBResult
        Left = 606
        Top = 24
        Width = 108
        Height = 16
        Alignment = taCenter
        DataField = 'sld_atual'
        DataSource = dmGeral.dsRelAnalitico
        DisplayMask = '#,##0.00'
        Text = ''
      end
    end
  end
end
