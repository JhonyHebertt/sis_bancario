object fRelConsolidado: TfRelConsolidado
  Left = 0
  Top = 0
  ClientHeight = 840
  ClientWidth = 1299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReport1: TRLReport
    Left = 0
    Top = 5
    Width = 1403
    Height = 992
    DataSource = dmGeral.dsRelConsolidado
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    object RLBand1: TRLBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 116
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
        Left = 451
        Top = 22
        Width = 141
        Height = 27
        Caption = 'Consolidado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 1182
        Top = 0
        Width = 127
        Height = 16
        Align = faRightTop
        Info = itPageNumber
        Text = 'P'#225'gina'
        Transparent = False
      end
      object RLImage1: TRLImage
        Left = 3
        Top = 3
        Width = 200
        Height = 50
      end
    end
    object RLBand2: TRLBand
      Left = 47
      Top = 163
      Width = 1309
      Height = 17
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
      object RLLabel2: TRLLabel
        Left = 0
        Top = 0
        Width = 107
        Height = 16
        Align = faTopOnly
        Caption = 'Nome do Cliente'
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 200
        Top = 0
        Width = 103
        Height = 16
        Align = faTopOnly
        Caption = 'Nome do Banco'
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 383
        Top = 0
        Width = 77
        Height = 16
        Align = faTopOnly
        Caption = 'Nr da Conta'
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 466
        Top = 0
        Width = 100
        Height = 16
        Align = faTopOnly
        Alignment = taCenter
        Caption = 'Saldo Anterior'
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 570
        Top = 0
        Width = 100
        Height = 16
        Align = faTopOnly
        Alignment = taCenter
        Caption = 'D'#233'bitos'
        Transparent = False
      end
      object RLLabel7: TRLLabel
        Left = 680
        Top = 0
        Width = 100
        Height = 16
        Align = faTopOnly
        Alignment = taCenter
        Caption = 'Cr'#233'ditos'
        Transparent = False
      end
      object RLLabel8: TRLLabel
        Left = 790
        Top = 0
        Width = 100
        Height = 16
        Align = faTopOnly
        Alignment = taCenter
        Caption = 'Saldo Final'
        Transparent = False
      end
    end
    object RLBand4: TRLBand
      Left = 47
      Top = 289
      Width = 1309
      Height = 23
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 1239
        Top = 0
        Width = 70
        Height = 16
        Align = faRightTop
        Text = 'Data:'
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 1169
        Top = 0
        Width = 70
        Height = 16
        Align = faRightTop
        Info = itHour
        Text = 'Hora:'
      end
    end
    object RLGroup1: TRLGroup
      Left = 47
      Top = 180
      Width = 1309
      Height = 109
      DataFields = 'nome_cliente'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 1309
        Height = 17
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLDBText1: TRLDBText
          Left = 0
          Top = 1
          Width = 194
          Height = 16
          Align = faTopOnly
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'nome_cliente'
          DataSource = dmGeral.dsRelConsolidado
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 200
          Top = 1
          Width = 177
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'nome_banco'
          DataSource = dmGeral.dsRelConsolidado
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 387
          Top = 1
          Width = 100
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'conta'
          DataSource = dmGeral.dsRelConsolidado
          Text = ''
        end
        object sld_ant: TRLDBText
          Left = 466
          Top = 1
          Width = 100
          Height = 16
          Align = faTopOnly
          Alignment = taCenter
          AutoSize = False
          DataField = 'saldo_anterior'
          DataSource = dmGeral.dsRelConsolidado
          DisplayMask = '#,##0.00'
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 570
          Top = 1
          Width = 100
          Height = 16
          Align = faTopOnly
          Alignment = taCenter
          AutoSize = False
          DataField = 'debitos'
          DataSource = dmGeral.dsRelConsolidado
          DisplayMask = '#,##0.00'
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 680
          Top = 1
          Width = 100
          Height = 16
          Align = faTopOnly
          Alignment = taCenter
          AutoSize = False
          DataField = 'creditos'
          DataSource = dmGeral.dsRelConsolidado
          DisplayMask = '#,##0.00'
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 790
          Top = 1
          Width = 100
          Height = 16
          Align = faTopOnly
          Alignment = taCenter
          AutoSize = False
          DataField = 'saldo_final'
          DataSource = dmGeral.dsRelConsolidado
          DisplayMask = '#,##0.00'
          Text = ''
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 17
        Width = 1309
        Height = 43
        BandType = btSummary
        object RLDBSLD_ANT: TRLDBResult
          Left = 422
          Top = 12
          Width = 136
          Height = 16
          Alignment = taCenter
          DataField = 'saldo_anterior'
          DataSource = dmGeral.dsRelConsolidado
          DisplayMask = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult2: TRLDBResult
          Left = 570
          Top = 12
          Width = 92
          Height = 16
          Alignment = taCenter
          DataField = 'debitos'
          DataSource = dmGeral.dsRelConsolidado
          DisplayMask = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult3: TRLDBResult
          Left = 682
          Top = 12
          Width = 100
          Height = 16
          Alignment = taCenter
          DataField = 'creditos'
          DataSource = dmGeral.dsRelConsolidado
          DisplayMask = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult1: TRLDBResult
          Left = 783
          Top = 12
          Width = 100
          Height = 16
          Alignment = taCenter
          DataField = 'saldo_final'
          DataSource = dmGeral.dsRelConsolidado
          DisplayMask = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLLabel9: TRLLabel
          Left = 293
          Top = 11
          Width = 106
          Height = 16
          Alignment = taCenter
          Caption = 'TOTAL CLIENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = False
        end
      end
    end
  end
end
