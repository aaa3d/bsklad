object DataModule3: TDataModule3
  OldCreateOrder = False
  Left = 194
  Top = 237
  Height = 480
  Width = 902
  object PersTorgTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 60
    Top = 8
  end
  object QrPersTorg: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PersTorgTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select PERS_TORG0.*,tw_kol*tw_money as tw_summ,tw_kol*nsp as tw_' +
        'nsp,tw_kol*nds as tw_nds from PERS_TORG0(:shop_id,:skl_id,:dt1,:' +
        'dt2,:twtree_id, :KLN_ID, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_T' +
        'YP) ')
    Left = 12
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'shop_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'skl_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dt1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dt2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'twtree_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KLN_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FRM_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'USER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'twktg_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'twtree_typ'
        ParamType = ptUnknown
      end>
    object QrPersTorgRN_ID: TIntegerField
      FieldName = 'RN_ID'
      Origin = 'PERS_TORG0.RN_ID'
    end
    object QrPersTorgRN_DATE: TDateTimeField
      FieldName = 'RN_DATE'
      Origin = 'PERS_TORG0.RN_DATE'
    end
    object QrPersTorgSKL_ID2: TIntegerField
      FieldName = 'SKL_ID2'
      Origin = 'PERS_TORG0.SKL_ID2'
    end
    object QrPersTorgRN_NUM_FULL: TIBStringField
      FieldName = 'RN_NUM_FULL'
      Origin = 'PERS_TORG0.RN_NUM_FULL'
      Size = 74
    end
    object QrPersTorgRNTYP_ID: TIntegerField
      FieldName = 'RNTYP_ID'
      Origin = 'PERS_TORG0.RNTYP_ID'
    end
    object QrPersTorgSKL_FULL: TIBStringField
      FieldName = 'SKL_FULL'
      Origin = 'PERS_TORG0.SKL_FULL'
      Size = 254
    end
    object QrPersTorgTW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'PERS_TORG0.TW_ID'
    end
    object QrPersTorgTW_BRAK: TIBStringField
      FieldName = 'TW_BRAK'
      Origin = 'PERS_TORG0.TW_BRAK'
      FixedChar = True
      Size = 1
    end
    object QrPersTorgTW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'PERS_TORG0.TW_ART'
    end
    object QrPersTorgTW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'PERS_TORG0.TW_NAM'
      Size = 254
    end
    object QrPersTorgED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Origin = 'PERS_TORG0.ED_SHORT'
      Size = 32
    end
    object QrPersTorgTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'PERS_TORG0.TW_KOL'
    end
    object QrPersTorgTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      Origin = 'PERS_TORG0.TW_MONEY'
    end
    object QrPersTorgTW_SKID: TFloatField
      FieldName = 'TW_SKID'
      Origin = 'PERS_TORG0.TW_SKID'
    end
    object QrPersTorgTW_SKIDDOLL: TFloatField
      FieldName = 'TW_SKIDDOLL'
      Origin = 'PERS_TORG0.TW_SKIDDOLL'
    end
    object QrPersTorgTW_SKIDCARD: TFloatField
      FieldName = 'TW_SKIDCARD'
      Origin = 'PERS_TORG0.TW_SKIDCARD'
    end
    object QrPersTorgTW_MONEY0: TFloatField
      FieldName = 'TW_MONEY0'
      Origin = 'PERS_TORG0.TW_MONEY0'
    end
    object QrPersTorgSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Origin = 'PERS_TORG0.SHOP_NAME'
      Size = 100
    end
    object QrPersTorgRNS_ID: TIntegerField
      FieldName = 'RNS_ID'
      Origin = 'PERS_TORG0.RNS_ID'
    end
    object QrPersTorgNDS: TFloatField
      FieldName = 'NDS'
      Origin = 'PERS_TORG0.NDS'
    end
    object QrPersTorgNSP: TFloatField
      FieldName = 'NSP'
      Origin = 'PERS_TORG0.NSP'
    end
    object QrPersTorgRVID_ID: TIntegerField
      FieldName = 'RVID_ID'
      Origin = 'PERS_TORG0.RVID_ID'
    end
    object QrPersTorgRVID_NAME: TIBStringField
      FieldName = 'RVID_NAME'
      Origin = 'PERS_TORG0.RVID_NAME'
      Size = 64
    end
    object QrPersTorgTW_SUMM: TFloatField
      FieldName = 'TW_SUMM'
    end
    object QrPersTorgTW_NSP: TFloatField
      FieldName = 'TW_NSP'
    end
    object QrPersTorgTW_NDS: TFloatField
      FieldName = 'TW_NDS'
    end
    object QrPersTorgPO_SUMM: TFloatField
      FieldName = 'PO_SUMM'
      Origin = 'PERS_TORG0.PO_SUMM'
    end
    object QrPersTorgTW_SEB: TFloatField
      FieldName = 'TW_SEB'
      Origin = 'PERS_TORG0.TW_SEB'
    end
    object QrPersTorgTW_SEB_SUMM: TFloatField
      FieldName = 'TW_SEB_SUMM'
      Origin = 'PERS_TORG0.TW_SEB_SUMM'
    end
    object QrPersTorgKLN_NAME: TIBStringField
      FieldName = 'KLN_NAME'
      Origin = 'PERS_TORG0.KLN_NAME'
      Size = 254
    end
  end
  object QrPers3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PersTorgTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select sum(tw_summ) as summ,sum(nsp) as tw_nsp,sum(nds) as tw_nd' +
        's,shop_name, sum(PO_SUMM) as PO_SUMM '
      
        '        from PERS_TORG2(0,0, cast ('#39'today'#39' as date)-1, cast ('#39'to' +
        'day'#39' as date)+1 ,0, 0,0)'
      '        group by shop_name order by shop_name ')
    Left = 130
    Top = 196
    object QrPers3SUMM: TFloatField
      FieldName = 'SUMM'
    end
    object QrPers3SHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Size = 100
    end
    object QrPers3TW_NDS: TFloatField
      FieldName = 'TW_NDS'
    end
    object QrPers3TW_NSP: TFloatField
      FieldName = 'TW_NSP'
    end
    object QrPers3PO_SUMM: TFloatField
      FieldName = 'PO_SUMM'
    end
  end
  object QrPers2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PersTorgTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select tw_id,tw_art,tw_nam,sum(tw_kol) as tw_kol,sum(tw_kol*nds)' +
        ' as tw_nds, avg(tw_seb) tw_seb, avg(tw_money) tW_money,'
      'sum(tw_kol*tw_weight) as tw_weight'
      
        ' from PERS_TORG0(:shops_id,:skl_id,:dt1,:dt2,:twtree_id, :KLN_ID' +
        ', :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP) '
      ' group by tw_id,tw_art,tw_nam order by tw_nam ')
    Left = 80
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'shops_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'skl_id'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftDateTime
        Name = 'dt1'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'dt2'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftInteger
        Name = 'twtree_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'KLN_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FRM_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'USER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'twktg_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TWTREE_TYP'
        ParamType = ptUnknown
      end>
    object QrPers2TW_ART: TIntegerField
      FieldName = 'TW_ART'
    end
    object QrPers2TW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Size = 254
    end
    object QrPers2TW_KOL: TFloatField
      FieldName = 'TW_KOL'
    end
    object QrPers2TW_SUMM: TFloatField
      FieldName = 'TW_SUMM'
    end
    object QrPers2TW_ID: TIntegerField
      FieldName = 'TW_ID'
    end
    object QrPers2TW_NDS: TFloatField
      FieldName = 'TW_NDS'
    end
    object QrPers2TW_NSP: TFloatField
      FieldName = 'TW_NSP'
    end
    object QrPers2TW_SEB: TFloatField
      FieldName = 'TW_SEB'
    end
    object QrPers2TW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
    end
    object QrPers2tw_weight: TFloatField
      FieldName = 'tw_weight'
    end
  end
  object DsPersTorg: TDataSource
    DataSet = QrPersTorg
    Left = 18
    Top = 246
  end
  object DsPers3: TDataSource
    DataSet = QrPers3
    Left = 132
    Top = 246
  end
  object DsPers2: TDataSource
    DataSet = QrPers2
    Left = 84
    Top = 246
  end
  object QrPers4: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PersTorgTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select twtree_id,twtree_full,sum(tw_kol*tw_money) as tw_summ,'
      'sum(tw_kol*nds) as tw_nds,'
      'sum(tw_kol*nsp) as tw_nsp,'
      'sum(tw_kol*tw_weight) as tw_weight'
      'from PERS_TORG1(:shop_id,:skl_id,:dt1,:dt2,0)'
      'group by twtree_id,twtree_full'
      'order by twtree_full')
    Left = 180
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'shop_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'skl_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dt1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dt2'
        ParamType = ptInput
      end>
    object QrPers4TWTREE_ID: TIntegerField
      FieldName = 'TWTREE_ID'
    end
    object QrPers4TWTREE_FULL: TIBStringField
      FieldName = 'TWTREE_FULL'
      Size = 254
    end
    object QrPers4TW_SUMM: TFloatField
      FieldName = 'TW_SUMM'
    end
    object QrPers4TW_NDS: TFloatField
      FieldName = 'TW_NDS'
    end
    object QrPers4TW_NSP: TFloatField
      FieldName = 'TW_NSP'
    end
    object QrPers4tw_weight: TFloatField
      FieldName = 'tw_weight'
    end
  end
  object DsPers4: TDataSource
    DataSet = QrPers4
    Left = 180
    Top = 248
  end
  object ReTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 510
    Top = 8
  end
  object QueryRe1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ReTransaction
    BufferChunks = 10
    CachedUpdates = False
    Left = 510
    Top = 54
  end
  object QueryRe2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ReTransaction
    BufferChunks = 10
    CachedUpdates = False
    Left = 510
    Top = 98
  end
  object QueryRe3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ReTransaction
    BufferChunks = 10
    CachedUpdates = False
    Left = 510
    Top = 142
  end
  object QueryRe4: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ReTransaction
    BufferChunks = 10
    CachedUpdates = False
    Left = 510
    Top = 186
  end
  object MemPost: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'ids'
        DataType = ftInteger
      end
      item
        Name = 'typ'
        DataType = ftInteger
      end
      item
        Name = 'pntyp_id'
        DataType = ftInteger
      end
      item
        Name = 'shop_id'
        DataType = ftInteger
      end
      item
        Name = 'skl_id'
        DataType = ftInteger
      end
      item
        Name = 'dt'
        DataType = ftDate
      end
      item
        Name = 'tw_kol'
        DataType = ftFloat
      end
      item
        Name = 'men'
        DataType = ftInteger
      end
      item
        Name = 'post'
        DataType = ftInteger
      end
      item
        Name = 'tw_id2'
        DataType = ftInteger
      end>
    Left = 70
    Top = 374
    object MemPostid: TIntegerField
      FieldName = 'id'
    end
    object MemPostids: TIntegerField
      FieldName = 'ids'
    end
    object MemPosttyp: TIntegerField
      FieldName = 'typ'
    end
    object MemPostpntyp_id: TIntegerField
      FieldName = 'pntyp_id'
    end
    object MemPostshop_id: TIntegerField
      FieldName = 'shop_id'
    end
    object MemPostskl_id: TIntegerField
      FieldName = 'skl_id'
    end
    object MemPostdt: TDateField
      FieldName = 'dt'
    end
    object MemPosttw_kol: TFloatField
      FieldName = 'tw_kol'
    end
    object MemPostmen: TIntegerField
      FieldName = 'men'
    end
    object MemPostpost: TIntegerField
      FieldName = 'post'
    end
    object MemPosttw_id2: TIntegerField
      FieldName = 'tw_id2'
    end
  end
  object MemPost2: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'ids'
        DataType = ftInteger
      end
      item
        Name = 'typ'
        DataType = ftInteger
      end
      item
        Name = 'pntyp_id'
        DataType = ftInteger
      end
      item
        Name = 'shop_id'
        DataType = ftInteger
      end
      item
        Name = 'skl_id'
        DataType = ftInteger
      end
      item
        Name = 'dt'
        DataType = ftDate
      end
      item
        Name = 'tw_kol'
        DataType = ftFloat
      end
      item
        Name = 'men'
        DataType = ftInteger
      end
      item
        Name = 'post'
        DataType = ftInteger
      end
      item
        Name = 'tw_id2'
        DataType = ftInteger
      end>
    Left = 146
    Top = 376
    object IntegerField1: TIntegerField
      FieldName = 'id'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ids'
    end
    object IntegerField3: TIntegerField
      FieldName = 'typ'
    end
    object IntegerField4: TIntegerField
      FieldName = 'pntyp_id'
    end
    object IntegerField5: TIntegerField
      FieldName = 'shop_id'
    end
    object IntegerField6: TIntegerField
      FieldName = 'skl_id'
    end
    object DateField1: TDateField
      FieldName = 'dt'
    end
    object FloatField1: TFloatField
      FieldName = 'tw_kol'
    end
    object IntegerField7: TIntegerField
      FieldName = 'men'
    end
    object IntegerField8: TIntegerField
      FieldName = 'post'
    end
    object IntegerField9: TIntegerField
      FieldName = 'tw_id2'
    end
  end
  object QrPers5: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PersTorgTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select sum(tw_summ) as summ,sum(nsp) as tw_nsp,sum(nds) as tw_nd' +
        's,rvid_name '
      'from PERS_TORG2(:shop_id,:skl_id,:dt1,:dt2,:twtree_id) '
      'group by rvid_id,rvid_name order by rvid_name')
    Left = 230
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'shop_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'skl_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dt1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dt2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'twtree_id'
        ParamType = ptUnknown
      end>
    object FloatField2: TFloatField
      FieldName = 'SUMM'
    end
    object FloatField3: TFloatField
      FieldName = 'TW_NDS'
    end
    object FloatField4: TFloatField
      FieldName = 'TW_NSP'
    end
    object QrPers5RVID_NAME: TIBStringField
      FieldName = 'RVID_NAME'
      Size = 64
    end
  end
  object DsPers5: TDataSource
    DataSet = QrPers5
    Left = 232
    Top = 250
  end
  object QrPers6: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PersTorgTransaction
    OnCalcFields = QrPers6CalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select count(*) as cnt,sum(tw_summ) as summ,sum(nsp) as tw_nsp,s' +
        'um(nds) as tw_nds,rns_tabel, sum(nac) as nac '
      
        '         from PERS_TORG3(:shop_id,:skl_id,:dt1,:dt2,:twtree_id, ' +
        ':KLN_ID, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP) '
      '        group by rns_tabel order by rns_tabel')
    Left = 284
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'shop_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'skl_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dt1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dt2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'twtree_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KLN_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FRM_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'USER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'twktg_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TWTREE_TYP'
        ParamType = ptUnknown
      end>
    object FloatField5: TFloatField
      FieldName = 'SUMM'
    end
    object FloatField6: TFloatField
      FieldName = 'TW_NDS'
    end
    object FloatField7: TFloatField
      FieldName = 'TW_NSP'
    end
    object QrPers6RNS_TABEL: TIntegerField
      FieldName = 'RNS_TABEL'
    end
    object QrPers6US_FIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'US_FIO'
      Size = 254
      Calculated = True
    end
    object QrPers6CNT: TIntegerField
      FieldName = 'CNT'
      Required = True
    end
    object QrPers6NAC: TFloatField
      FieldName = 'NAC'
    end
  end
  object DsPers6: TDataSource
    DataSet = QrPers6
    Left = 286
    Top = 250
  end
  object QrTabel: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PersTorgTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select kln_tabel,kln_id,(select kln_full from kln_data(kln.kln_i' +
        'd)) as kln_full'
      'from kln where kln_tabel>0')
    Left = 404
    Top = 60
    object QrTabelKLN_ID: TIntegerField
      FieldName = 'KLN_ID'
      Origin = 'KLN.KLN_ID'
      Required = True
    end
    object QrTabelKLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Size = 5000
    end
    object QrTabelKLN_TABEL: TIntegerField
      FieldName = 'KLN_TABEL'
      Origin = 'KLN.KLN_TABEL'
    end
  end
  object QrPers7: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PersTorgTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select tw_nam, min(tw_art) AS ART, min(ed_short) as ED, sum(bg_a' +
        'bs(tw_kol)) AS KOL '
      'from PERS_TORG0(:shop_id,:skl_id,:dt1,:dt2,:twtree_id) '
      'group by tw_nam'
      'order by tw_nam')
    Left = 336
    Top = 196
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'shop_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'skl_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'twtree_id'
        ParamType = ptUnknown
      end>
    object QrPers7TW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Size = 254
    end
    object QrPers7ART: TIntegerField
      FieldName = 'ART'
    end
    object QrPers7ED: TIBStringField
      FieldName = 'ED'
      Size = 32
    end
    object QrPers7KOL: TFloatField
      FieldName = 'KOL'
    end
  end
  object DsPers7: TDataSource
    DataSet = QrPers7
    Left = 338
    Top = 250
  end
  object QrPers8: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PersTorgTransaction
    OnCalcFields = QrPers6CalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select count(*) as cnt,sum(tw_summ) as summ,sum(nsp) as tw_nsp,s' +
        'um(nds) as tw_nds, kln.kln_id, kln.kln_kkm_password'
      'from PERS_TORG4(0, 0, "04/15/2005", "04/25/2005", 0)'
      'left join kln on kln.kln_id = PERS_TORG4.kassir_id'
      'group by kln.kln_id, kln.kln_kkm_password')
    Left = 388
    Top = 196
    object QrPers8CNT: TIntegerField
      FieldName = 'CNT'
      Required = True
    end
    object QrPers8SUMM: TFloatField
      FieldName = 'SUMM'
    end
    object QrPers8TW_NSP: TFloatField
      FieldName = 'TW_NSP'
    end
    object QrPers8TW_NDS: TFloatField
      FieldName = 'TW_NDS'
    end
    object QrPers8KLN_ID: TIntegerField
      FieldName = 'KLN_ID'
    end
    object QrPers8KLN_KKM_PASSWORD: TIBStringField
      FieldName = 'KLN_KKM_PASSWORD'
      Size = 32
    end
  end
  object DsPers8: TDataSource
    DataSet = QrPers8
    Left = 390
    Top = 250
  end
  object QrPers9: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PersTorgTransaction
    OnCalcFields = QrPers6CalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select count(*) as cnt,sum(tw_summ) as summ,sum(nsp) as tw_nsp,s' +
        'um(nds) as tw_nds, pers_torg4.kassa_id, list_kkm.kkm_name'
      'from PERS_TORG4(0, 0, "04/15/2005", "04/25/2005", 0)'
      
        'left join list_kkm on (list_kkm.cfg_id = PERS_TORG4.kassa_id and' +
        ' not pers_torg4.kassa_id is null)'
      'group by pers_torg4.kassa_id, list_kkm.kkm_name')
    Left = 436
    Top = 196
    object QrPers9CNT: TIntegerField
      FieldName = 'CNT'
      Required = True
    end
    object QrPers9SUMM: TFloatField
      FieldName = 'SUMM'
    end
    object QrPers9TW_NSP: TFloatField
      FieldName = 'TW_NSP'
    end
    object QrPers9TW_NDS: TFloatField
      FieldName = 'TW_NDS'
    end
    object QrPers9KASSA_ID: TIntegerField
      FieldName = 'KASSA_ID'
    end
    object QrPers9KKM_NAME: TIBStringField
      FieldName = 'KKM_NAME'
      Size = 32
    end
  end
  object DsPers9: TDataSource
    DataSet = QrPers9
    Left = 438
    Top = 250
  end
end
