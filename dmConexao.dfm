object dmGeral: TdmGeral
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\heber\Desktop\Projeto Delphi\DB\sis_bancario.d' +
        'b'
      'DriverID=SQLite')
    Left = 280
    Top = 33
  end
  object qCliente: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'Select * from cliente')
    Left = 480
    Top = 33
    object qClienteid_cliente: TFDAutoIncField
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qClientenome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
    object qClientedata_nascimento: TDateField
      DisplayLabel = 'Data Nasc.'
      FieldName = 'data_nascimento'
      Origin = 'data_nascimento'
    end
    object qClientedocumento: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'documento'
      Origin = 'documento'
      Size = 12
    end
    object qClientetelefone: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 15
    end
    object qClienteemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Origin = 'email'
      Size = 30
    end
  end
  object dsCliente: TDataSource
    DataSet = qCliente
    Left = 480
    Top = 113
  end
  object dsConta: TDataSource
    DataSet = qConta
    Left = 584
    Top = 113
  end
  object qConta: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'Select con.*, cli.nome as nome_cliente from conta as con inner j' +
        'oin cliente as cli on cli.id_cliente = con.id_cliente')
    Left = 584
    Top = 40
    object qContaid_conta: TFDAutoIncField
      FieldName = 'id_conta'
      Origin = 'id_conta'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qContaid_cliente: TIntegerField
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
      Required = True
      Visible = False
    end
    object qContanome_cliente: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'nome_cliente'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qContanome_banco: TWideStringField
      FieldName = 'nome_banco'
      Origin = 'nome_banco'
      Required = True
      Size = 30
    end
    object qContaconta: TWideStringField
      FieldName = 'conta'
      Origin = 'conta'
      Required = True
      Size = 10
    end
    object qContaativa: TWideStringField
      FieldName = 'ativa'
      Origin = 'ativa'
      Required = True
      Size = 1
    end
  end
  object qListCli: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'Select id_cliente, nome from cliente')
    Left = 488
    Top = 209
    object qListCliid_cliente: TFDAutoIncField
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qListClinome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
  end
  object dsListCli: TDataSource
    DataSet = qListCli
    Left = 488
    Top = 289
  end
  object qBancos: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT '#39'001- Banco do Brasil'#39' as BANCO'
      'union'
      'SELECT '#39'003- Banco da Amaz'#244'nia'#39' AS BANCO'
      'union'
      'SELECT '#39'029- Banco Ita'#250#39' as BANCO '
      'union'
      'SELECT '#39'033- Banco Santander'#39' as BANCO'
      'union'
      'SELECT '#39'036- Banco Bradesco'#39' as BANCO'
      'union'
      'SELECT '#39'077- Banco Inter'#39' as BANCO'
      'union'
      'SELECT '#39'102- XP INVESTIMENTOS'#39' as BANCO'
      'union'
      'SELECT '#39'237- Next'#39' as BANCO'
      'union'
      'SELECT '#39'260- NU Pagamentos'#39' as BANCO'
      'union'
      'SELECT '#39'269- HSBC Brasil'#39' as BANCO'
      'union'
      'SELECT '#39'290- Pagseguro'#39' as BANCO'
      'union'
      'SELECT '#39'380- PicPay'#39' as BANCO')
    Left = 670
    Top = 40
  end
  object dsBancos: TDataSource
    DataSet = qBancos
    Left = 668
    Top = 113
  end
  object dsListConta: TDataSource
    DataSet = qListConta
    Left = 576
    Top = 289
  end
  object qListConta: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT id_conta,'
      '       cl.nome,'
      '       co.nome_banco,'
      '       co.conta'
      '  FROM conta as co'
      '  left join cliente as cl on cl.id_cliente = co.id_cliente'
      'Where co.ativa = '#39'S'#39'  ')
    Left = 576
    Top = 216
    object qListContaid_conta: TFDAutoIncField
      FieldName = 'id_conta'
      Origin = 'id_conta'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qListContanome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qListContanome_banco: TWideStringField
      FieldName = 'nome_banco'
      Origin = 'nome_banco'
      Required = True
      Size = 30
    end
    object qListContaconta: TWideStringField
      FieldName = 'conta'
      Origin = 'conta'
      Required = True
      Size = 10
    end
  end
  object qMovimento: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT mv.*, co.conta, ci.nome as nome_cliente FROM movimento as' +
        ' mv left join conta as co on co.id_conta = mv.id_conta left join' +
        ' cliente as ci on ci.id_cliente = co.id_cliente')
    Left = 768
    Top = 40
    object qMovimentoid_movimento: TFDAutoIncField
      FieldName = 'id_movimento'
      Origin = 'id_movimento'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qMovimentoid_conta: TIntegerField
      FieldName = 'id_conta'
      Origin = 'id_conta'
      Required = True
      Visible = False
    end
    object qMovimentoconta: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'conta'
      Origin = 'conta'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qMovimentonome_cliente: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'nome_cliente'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qMovimentotp_mov: TWideStringField
      FieldName = 'tp_mov'
      Origin = 'tp_mov'
      Required = True
      Size = 1
    end
    object qMovimentodata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object qMovimentovalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
    end
  end
  object dsMovimento: TDataSource
    DataSet = qMovimento
    Left = 768
    Top = 113
  end
  object qRelConsolidado: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT ci.nome as nome_cliente, '
      'co.nome_banco, '
      'co.conta, '
      'sum(COALESCE(sld_ant.saldo,0.00)) as saldo_anterior, '
      
        'sum(case when mv.tp_mov = '#39'D'#39' then COALESCE(mv.valor,0.00) else ' +
        '0.00 end) as debitos, '
      
        'sum(case when mv.tp_mov = '#39'C'#39' then COALESCE(mv.valor,0.00) else ' +
        '0.00 end) as creditos,'
      
        'sum(COALESCE(sld_ant.saldo,0.00) - (case when mv.tp_mov = '#39'D'#39' th' +
        'en (mv.valor) else 0 end) + (case when mv.tp_mov = '#39'C'#39' then (mv.' +
        'valor) else 0.00 end)) as saldo_final'
      'FROM movimento as mv'
      'left join conta as co on co.id_conta = mv.id_conta '
      'left join cliente as ci on ci.id_cliente = co.id_cliente'
      
        'left join (select sum(case when mmv.tp_mov = '#39'C'#39' then (mmv.valor' +
        ') else 0.00 end) - sum(case when mmv.tp_mov = '#39'D'#39' then (mmv.valo' +
        'r) else 0.00 end) as saldo, mmv.id_conta '
      
        '             from movimento as mmv where mmv.data  < :data group' +
        ' by mmv.id_conta) as sld_ant on sld_ant.id_conta = mv.id_conta'
      'where 1 = 1'
      'and ci.nome like :cliente'
      'and co.nome_banco like :banco'
      'and mv.data  >=  :data'
      'group by ci.nome, co.nome_banco, co.conta'
      '')
    Left = 768
    Top = 230
    ParamData = <
      item
        Name = 'DATA'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CLIENTE'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Name = 'BANCO'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end>
  end
  object dsRelConsolidado: TDataSource
    DataSet = qRelConsolidado
    Left = 768
    Top = 303
  end
  object qRelAnalitico: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT mv.*, co.conta, ci.nome as nome_cliente, '
      '       COALESCE(sld_ant.saldo,0.00) as sld_anterior,'
      
        '       (COALESCE(sld_ant.saldo,0.00))+(COALESCE(sld_atual.saldo,' +
        '0.00)) as sld_atual  '
      'FROM movimento as mv '
      'left join conta as co on co.id_conta = mv.id_conta '
      'left join cliente as ci on ci.id_cliente = co.id_cliente'
      
        'left join (select sum(case when mmv.tp_mov = '#39'C'#39' then (mmv.valor' +
        ') else 0 end) - sum(case when mmv.tp_mov = '#39'D'#39' then (mmv.valor) ' +
        'else 0 end) as saldo, mmv.id_conta '
      
        '             from movimento as mmv where mmv.data  < :datab grou' +
        'p by mmv.id_conta) as sld_ant on sld_ant.id_conta = mv.id_conta'
      
        'left join (select sum(case when mmv.tp_mov = '#39'C'#39' then (mmv.valor' +
        ') else 0 end) - sum(case when mmv.tp_mov = '#39'D'#39' then (mmv.valor) ' +
        'else 0 end) as saldo, mmv.id_conta '
      
        '             from movimento as mmv where mmv.data  >= :datab gro' +
        'up by mmv.id_conta) as sld_atual on sld_atual.id_conta = mv.id_c' +
        'onta           '
      'where mv.id_conta = :conta'
      'and mv.data >= :dataB')
    Left = 878
    Top = 40
    ParamData = <
      item
        Name = 'DATAB'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CONTA'
        DataType = ftString
        FDDataType = dtWideString
        ParamType = ptInput
      end>
    object qRelAnaliticoid_movimento: TFDAutoIncField
      FieldName = 'id_movimento'
      Origin = 'id_movimento'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qRelAnaliticoid_conta: TIntegerField
      FieldName = 'id_conta'
      Origin = 'id_conta'
      Required = True
      Visible = False
    end
    object qRelAnaliticoconta: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'conta'
      Origin = 'conta'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRelAnaliticonome_cliente: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'nome_cliente'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qRelAnaliticotp_mov: TWideStringField
      FieldName = 'tp_mov'
      Origin = 'tp_mov'
      Required = True
      Size = 1
    end
    object qRelAnaliticodata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object qRelAnaliticovalor: TFloatField
      FieldName = 'valor'
      OnGetText = qRelAnaliticovalorGetText
    end
    object qRelAnaliticosld_anterior: TFloatField
      FieldName = 'sld_anterior'
      OnGetText = qRelAnaliticosld_anteriorGetText
    end
    object qRelAnaliticosld_atual: TFloatField
      FieldName = 'sld_atual'
      OnGetText = qRelAnaliticosld_atualGetText
    end
  end
  object dsRelAnalitico: TDataSource
    DataSet = qRelAnalitico
    Left = 878
    Top = 113
  end
end
