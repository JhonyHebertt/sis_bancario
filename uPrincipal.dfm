object fmPrincipal: TfmPrincipal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Sistema Banc'#225'rio'
  ClientHeight = 540
  ClientWidth = 1036
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 24
    Top = 16
    object Cadastro: TMenuItem
      Caption = 'Cadastro'
      object Clientes: TMenuItem
        Caption = 'Clientes'
        OnClick = ClientesClick
      end
      object Contas1: TMenuItem
        Caption = 'Contas'
        OnClick = Contas1Click
      end
    end
    object Lançamentos: TMenuItem
      Caption = 'Lan'#231'amentos'
      object Movimentação: TMenuItem
        Caption = 'Movimenta'#231#227'o'
        OnClick = MovimentaçãoClick
      end
    end
    object Relatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      object Consolidado: TMenuItem
        Caption = 'Consolidado'
        OnClick = ConsolidadoClick
      end
      object Analítico: TMenuItem
        Caption = 'Anal'#237'tico'
        OnClick = AnalíticoClick
      end
    end
  end
end
