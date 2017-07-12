object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 85
  Top = 206
  Height = 688
  Width = 1189
  object PrintTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 176
    Top = 400
  end
  object PrintPNS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from Print_PNS(:PN_ID,:shop_id) order by pns_id')
    Left = 74
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'shop_id'
        ParamType = ptUnknown
      end>
    object PrintPNSPNS_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PNS_ID'
      ReadOnly = True
    end
    object PrintPNSTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object PrintPNSTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object PrintPNSED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object PrintPNSTW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object PrintPNSTWZ_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TWZ_MONEY'
      ReadOnly = True
      DisplayFormat = '#0.00'
    end
    object PrintPNSTWZ_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TWZ_SUMM'
      ReadOnly = True
      DisplayFormat = '#0.00'
    end
    object PrintPNSTWR_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TWR_MONEY'
      ReadOnly = True
      DisplayFormat = '#0.00'
    end
    object PrintPNSTWR_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TWR_SUMM'
      ReadOnly = True
      DisplayFormat = '#0.00'
    end
    object PrintPNSSERT_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SERT_NUM'
      ReadOnly = True
      Size = 254
    end
    object PrintPNSSERT_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'SERT_DATE'
      ReadOnly = True
    end
    object PrintPNSSERT_WHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SERT_WHO'
      ReadOnly = True
      Size = 254
    end
    object PrintPNSNDS: TFloatField
      FieldName = 'NDS'
      Origin = 'PRINT_PNS.NDS'
    end
    object PrintPNSNDS_SUMMZ: TFloatField
      FieldName = 'NDS_SUMMZ'
      Origin = 'PRINT_PNS.NDS_SUMMZ'
    end
    object PrintPNSNDS_SUMMR: TFloatField
      FieldName = 'NDS_SUMMR'
      Origin = 'PRINT_PNS.NDS_SUMMR'
    end
    object PrintPNSTW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'PRINT_PNS.TW_ID'
    end
  end
  object PrintPN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_pn(:PN_ID)')
    Left = 12
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PN_ID'
        ParamType = ptInput
      end>
    object PrintPNPOST_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintPNFRM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FRM_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintPNSKL_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintPNPN_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PN_NUM_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintPNPN_OSN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PN_OSN'
      ReadOnly = True
      Size = 10000
    end
    object PrintPNPN_WHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PN_WHO'
      ReadOnly = True
      Size = 254
    end
    object PrintPNUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintPNPN_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'PN_DATE'
      ReadOnly = True
    end
    object PrintPNPN_ID2: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PN_ID2'
      ReadOnly = True
    end
  end
  object PrintSTS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from Print_STS(:ST_ID) order by sts_id')
    Left = 322
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ST_ID'
        ParamType = ptInput
      end>
    object PrintSTSSTS_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'STS_ID'
      ReadOnly = True
    end
    object PrintSTSTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object PrintSTSTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object PrintSTSED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object PrintSTSTW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
    end
    object PrintSTSTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
    end
    object PrintSTSTW_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM'
      ReadOnly = True
    end
    object PrintSTSTW_WEIGHT: TFloatField
      FieldName = 'TW_WEIGHT'
      Origin = 'PRINT_STS.TW_WEIGHT'
    end
  end
  object PrintST: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_ST(:ST_ID)')
    Left = 260
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ST_ID'
        ParamType = ptInput
      end>
    object PrintSTST_TEXT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ST_TEXT'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTST_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ST_NUM_FULL'
      ReadOnly = True
      Size = 100
    end
    object PrintSTFRM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FRM_FULL'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTFRM_ADR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FRM_ADR'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTFRM_REKW: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FRM_REKW'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTFRM_TEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FRM_TEL'
      ReadOnly = True
      Size = 254
    end
    object PrintSTKLN_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTKLN_ADR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ADR'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTKLN_REKW: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_REKW'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTKLN_TEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_TEL'
      ReadOnly = True
      Size = 254
    end
    object PrintSTVALUTA_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALUTA_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintSTUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintSTKLN_DIR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_DIR'
      ReadOnly = True
      Size = 254
    end
    object PrintSTKLN_GB: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_GB'
      ReadOnly = True
      Size = 254
    end
    object PrintSTVALUTA_AUTO1: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALUTA_AUTO1'
      ReadOnly = True
      Size = 254
    end
    object PrintSTVALUTA_AUTO2: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALUTA_AUTO2'
      ReadOnly = True
      Size = 254
    end
    object PrintSTVALUTA_AUTO3: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALUTA_AUTO3'
      ReadOnly = True
      Size = 254
    end
    object PrintSTVALUTA_AUTO11: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALUTA_AUTO11'
      ReadOnly = True
      Size = 254
    end
    object PrintSTVALUTA_AUTO12: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALUTA_AUTO12'
      ReadOnly = True
      Size = 254
    end
    object PrintSTVALUTA_AUTO13: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALUTA_AUTO13'
      ReadOnly = True
      Size = 254
    end
    object PrintSTST_SKID: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'ST_SKID'
      ReadOnly = True
    end
    object PrintSTST_ID2: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'ST_ID2'
      ReadOnly = True
    end
    object PrintSTNDS: TFloatField
      FieldName = 'NDS'
      Origin = 'PRINT_ST.NDS'
    end
  end
  object PrintRNS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 50
    CachedUpdates = False
    SQL.Strings = (
      'select * from Print_RNS(:RN_ID) order by rns_id')
    Left = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'RN_ID'
        ParamType = ptUnknown
      end>
  end
  object PrintRN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 2
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_Rn(:RN_ID)')
    Left = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RN_ID'
        ParamType = ptInput
      end>
  end
  object PrintSPISS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from Print_SPISS(:SPIS_ID) order by spiss_id')
    Left = 508
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SPIS_ID'
        ParamType = ptInput
      end>
    object PrintSPISSSPISS_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'SPISS_ID'
      ReadOnly = True
    end
    object PrintSPISSTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object PrintSPISSTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object PrintSPISSED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object PrintSPISSTW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
    end
    object PrintSPISSTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
    end
    object PrintSPISSTW_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM'
      ReadOnly = True
    end
  end
  object PrintSPIS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_SPIS(:SPIS_ID)')
    Left = 446
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SPIS_ID'
        ParamType = ptInput
      end>
    object PrintSPISSPIS_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SPIS_NUM_FULL'
      ReadOnly = True
      Size = 100
    end
    object PrintSPISUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintSPISSPISVID_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SPISVID_NAM'
      ReadOnly = True
      Size = 64
    end
    object PrintSPISSKL_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_FULL'
      ReadOnly = True
      Size = 770
    end
    object PrintSPISSPIS_WHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SPIS_WHO'
      ReadOnly = True
      Size = 254
    end
    object PrintSPISSPIS_OSN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SPIS_OSN'
      ReadOnly = True
      Size = 10000
    end
    object PrintSPISFRM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FRM_FULL'
      ReadOnly = True
      Size = 5000
    end
    object PrintSPISSPIS_ID2: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'SPIS_ID2'
      ReadOnly = True
    end
  end
  object PrintPERS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from Print_PERS(:PER_ID) order by pers_id')
    Left = 632
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PER_ID'
        ParamType = ptInput
      end>
    object PrintPERSPERS_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PERS_ID'
      ReadOnly = True
    end
    object PrintPERSTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object PrintPERSTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object PrintPERSED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object PrintPERSTW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
    end
    object PrintPERSTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
    end
    object PrintPERSTW_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM'
      ReadOnly = True
    end
    object PrintPERSSERT_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SERT_NUM'
      ReadOnly = True
      Size = 254
    end
    object PrintPERSSERT_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'SERT_DATE'
      ReadOnly = True
    end
    object PrintPERSSERT_WHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SERT_WHO'
      ReadOnly = True
      Size = 254
    end
    object PrintPERSPERS_WEIGHT: TFloatField
      FieldName = 'PERS_WEIGHT'
      Origin = 'PRINT_PERS.PERS_WEIGHT'
    end
  end
  object PrintPER: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_PER(:PER_ID)')
    Left = 570
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PER_ID'
        ParamType = ptInput
      end>
    object PrintPERFRM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FRM_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintPERSKL_FROM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_FROM_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintPERSKL_TO_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_TO_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintPERPER_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PER_NUM_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintPERPER_OSN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PER_OSN'
      ReadOnly = True
      Size = 10000
    end
    object PrintPERPER_WHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PER_WHO'
      ReadOnly = True
      Size = 254
    end
    object PrintPERUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintPERPER_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'PER_DATE'
      ReadOnly = True
    end
    object PrintPERPER_ID2: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PER_ID2'
      ReadOnly = True
    end
  end
  object PrintKKMS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from Print_KKMS(:KKM_ID) order by rns_id')
    Left = 198
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'KKM_ID'
        ParamType = ptInput
      end>
    object IntegerField1: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RNS_ID'
      ReadOnly = True
    end
    object IntegerField2: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object IBStringField1: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object IBStringField2: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object FloatField1: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
    end
    object FloatField2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
    end
    object FloatField3: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM'
      ReadOnly = True
    end
  end
  object PrintKKM: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_KKM(:KKM_ID)')
    Left = 136
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'KKM_ID'
        ParamType = ptInput
      end>
    object PrintKKMKKM_TEXT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KKM_TEXT'
      ReadOnly = True
      Size = 5000
    end
    object PrintKKMRN_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'RN_DATE'
      ReadOnly = True
    end
    object PrintKKMRN_NUM: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_NUM'
      ReadOnly = True
    end
    object PrintKKMSKL_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_FULL'
      ReadOnly = True
      Size = 770
    end
    object PrintKKMUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintKKMFRM_FULL: TIBStringField
      FieldName = 'FRM_FULL'
      Origin = 'PRINT_KKM.FRM_FULL'
      Size = 254
    end
    object PrintKKMRN_NUM_FULL: TIBStringField
      FieldName = 'RN_NUM_FULL'
      Origin = 'PRINT_KKM.RN_NUM_FULL'
      Size = 100
    end
    object PrintKKMSKID_STR: TIBStringField
      FieldName = 'SKID_STR'
      Origin = 'PRINT_KKM.SKID_STR'
      Size = 254
    end
  end
  object PrintGarant: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_GARANT(:GARANT_ID)')
    Left = 642
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GARANT_ID'
        ParamType = ptInput
      end>
    object PrintGarantGARANT_TEXT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'GARANT_TEXT'
      ReadOnly = True
      Size = 10000
    end
    object PrintGarantGARANT_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'GARANT_NUM_FULL'
      ReadOnly = True
      Size = 100
    end
    object PrintGarantSKL_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintGarantSKL_ADR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_ADR'
      ReadOnly = True
      Size = 254
    end
    object PrintGarantSKL_TEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_TEL'
      ReadOnly = True
      Size = 254
    end
    object PrintGarantTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object PrintGarantTW_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NUM'
      ReadOnly = True
      Size = 254
    end
    object PrintGarantGARANT_MES: TSmallintField
      FieldKind = fkInternalCalc
      FieldName = 'GARANT_MES'
      ReadOnly = True
    end
    object PrintGarantNAKL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NAKL'
      ReadOnly = True
      Size = 4
    end
    object PrintGarantGARANT_DT: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'GARANT_DT'
      ReadOnly = True
    end
    object PrintGarantUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintGarantTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
    end
  end
  object MarketKonk: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from report_market_konk(:twtree_id,:percent,:skid)'
      'order by twtree_full,tw_nam')
    Left = 264
    Top = 302
    ParamData = <
      item
        DataType = ftInteger
        Name = 'twtree_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'percent'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'skid'
        ParamType = ptUnknown
      end>
    object MarketKonkTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object MarketKonkTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object MarketKonkTWTREE_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TWTREE_FULL'
      ReadOnly = True
      Size = 254
    end
    object MarketKonkED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object MarketKonkTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
    end
    object MarketKonkTW_MONEYD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEYD'
      ReadOnly = True
    end
    object MarketKonkMTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MTW_MONEY'
      ReadOnly = True
    end
    object MarketKonkMTW_MONEYD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MTW_MONEYD'
      ReadOnly = True
    end
    object MarketKonkMARKET_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'MARKET_DATE'
      ReadOnly = True
    end
    object MarketKonkMARKET_PRIM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MARKET_PRIM'
      ReadOnly = True
      Size = 254
    end
    object MarketKonkKLN_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 254
    end
    object MarketKonkUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object MarketKonkTW_OST: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_OST'
      ReadOnly = True
    end
  end
  object MarketOld: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from report_market_old(:twtree_id,:d)'
      'where last_date is not null'
      'order by twtree_full,tw_nam')
    Left = 336
    Top = 298
    ParamData = <
      item
        DataType = ftInteger
        Name = 'twtree_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'd'
        ParamType = ptInput
      end>
    object MarketOldTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object MarketOldTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object MarketOldED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object MarketOldTWTREE_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TWTREE_FULL'
      ReadOnly = True
      Size = 254
    end
    object MarketOldTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
    end
    object MarketOldTW_MONEYD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEYD'
      ReadOnly = True
    end
    object MarketOldLAST_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'LAST_DATE'
      ReadOnly = True
    end
  end
  object Pribyl: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from pribyl(:filtertw_id,:filterpn_id,:filterrn_id,:fil' +
        'terspis_id,'
      ':DT1,:DT2,:VALUTA_ID,:VID) order by twtree_full,tw_nam')
    Left = 571
    Top = 346
    ParamData = <
      item
        DataType = ftInteger
        Name = 'filtertw_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'filterpn_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'filterrn_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'filterspis_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VALUTA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VID'
        ParamType = ptInput
      end>
    object PribylTW_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ID'
      ReadOnly = True
    end
    object PribylTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object PribylTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object PribylTWTREE_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TWTREE_FULL'
      ReadOnly = True
      Size = 254
    end
    object PribylED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object PribylTW_MROZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MROZ'
      ReadOnly = True
    end
    object PribylOST1: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OST1'
      ReadOnly = True
    end
    object PribylOST1_SUMMZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OST1_SUMMZ'
      ReadOnly = True
    end
    object PribylOST1_SUMMR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OST1_SUMMR'
      ReadOnly = True
    end
    object PribylPOST: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'POST'
      ReadOnly = True
    end
    object PribylPOST_SUMMZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'POST_SUMMZ'
      ReadOnly = True
    end
    object PribylPOST_SUMMR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'POST_SUMMR'
      ReadOnly = True
    end
    object PribylRASH: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'RASH'
      ReadOnly = True
    end
    object PribylRASH_SUMMZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'RASH_SUMMZ'
      ReadOnly = True
    end
    object PribylRASH_SUMMR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'RASH_SUMMR'
      ReadOnly = True
    end
    object PribylSPIS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SPIS'
      ReadOnly = True
    end
    object PribylSPIS_SUMMZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SPIS_SUMMZ'
      ReadOnly = True
    end
    object PribylSPIS_SUMMR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SPIS_SUMMR'
      ReadOnly = True
    end
    object PribylOST2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OST2'
      ReadOnly = True
    end
    object PribylOST2_SUMMZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OST2_SUMMZ'
      ReadOnly = True
    end
    object PribylOST2_SUMMR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OST2_SUMMR'
      ReadOnly = True
    end
    object PribylPRIBYL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PRIBYL'
      ReadOnly = True
    end
    object PribylUBYT: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'UBYT'
      ReadOnly = True
    end
  end
  object ReportCard: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from report_card(:DT1,:DT2)')
    Left = 192
    Top = 302
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DT2'
        ParamType = ptInput
      end>
    object ReportCardCARD_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'CARD_ID'
      ReadOnly = True
    end
    object ReportCardCARD_NUM: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'CARD_NUM'
      ReadOnly = True
    end
    object ReportCardCARD_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'CARD_DATE'
      ReadOnly = True
    end
    object ReportCardCARD_OSN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'CARD_OSN'
      ReadOnly = True
      Size = 254
    end
    object ReportCardFIRST_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'FIRST_SUMM'
      ReadOnly = True
    end
    object ReportCardPERIOD_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PERIOD_SUMM'
      ReadOnly = True
    end
    object ReportCardPERIOD_COUNT: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PERIOD_COUNT'
      ReadOnly = True
    end
    object ReportCardPERIOD_SKID: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PERIOD_SKID'
      ReadOnly = True
    end
    object ReportCardCURRENT_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'CURRENT_SUMM'
      ReadOnly = True
    end
    object ReportCardCURRENT_SKID: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'CURRENT_SKID'
      ReadOnly = True
    end
    object ReportCardKLN_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 254
    end
  end
  object ReportPostList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from '
      'report_post_list(:DT1,:Dt2)'
      'order by KLN_FULL')
    Left = 444
    Top = 196
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Dt2'
        ParamType = ptInput
      end>
    object ReportPostListKLN_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ID'
      ReadOnly = True
    end
    object ReportPostListKLN_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 254
    end
  end
  object ReportPostOst: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    OnCalcFields = ReportPostOstCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from report_post_ost(:kln_id,:DT)'
      'order by tw_nam,pn_date')
    Left = 516
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'kln_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT'
        ParamType = ptInput
      end>
    object ReportPostOstTW_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ID'
      ReadOnly = True
    end
    object ReportPostOstTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object ReportPostOstTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object ReportPostOstTW_MROZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MROZ'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object ReportPostOstED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object ReportPostOstPN_FULL_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PN_FULL_NUM'
      ReadOnly = True
      Size = 74
    end
    object ReportPostOstPN_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PN_COLOR'
      ReadOnly = True
    end
    object ReportPostOstPN_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'PN_DATE'
      ReadOnly = True
    end
    object ReportPostOstPNVID_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PNVID_NAM'
      ReadOnly = True
      Size = 64
    end
    object ReportPostOstTW_OST: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_OST'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object ReportPostOstTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object ReportPostOstPN_OSN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PN_OSN'
      ReadOnly = True
      Size = 254
    end
    object ReportPostOstPN_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PN_ID'
      ReadOnly = True
    end
    object ReportPostOstUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object ReportPostOstOST_SUMMZ: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OST_SUMMZ'
      DisplayFormat = ',#0.00 руб'
      Calculated = True
    end
    object ReportPostOstOST_SUMMR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OST_SUMMR'
      DisplayFormat = ',#0.00 руб'
      Calculated = True
    end
  end
  object Query_ost: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionTwDetal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select sum(ost1)+sum(ost2) as ost1,sum(ost2) as ost2,skl_id,skl_' +
        'full'
      'from tmp_post_rash_brak(:TW_ID,:TW_IDBRAK),skl'
      'where tmp_post_rash_brak.skl_id=skl.skl_id'
      'group by skl_id,skl_full'
      'having sum(ost1)<>0 or sum(ost2)<>0'
      'order by skl_full')
    Left = 398
    Top = 298
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TW_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TW_IDBRAK'
        ParamType = ptInput
      end>
    object Query_ostOST1: TFloatField
      FieldName = 'OST1'
      DisplayFormat = '#0.0000'
    end
    object Query_ostOST2: TFloatField
      FieldName = 'OST2'
      DisplayFormat = '#0.0000'
    end
    object Query_ostSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
    end
    object Query_ostSKL_FULL: TIBStringField
      FieldName = 'SKL_FULL'
      Size = 254
    end
  end
  object DsQuery_OST: TDataSource
    DataSet = Query_ost
    Left = 400
    Top = 342
  end
  object TransactionTwDetal: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 270
    Top = 410
  end
  object DsQuery_SERT: TDataSource
    DataSet = Query_Sert
    Left = 569
    Top = 295
  end
  object Query_Sert: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionTwDetal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select sert.sert_num,sert.sert_date,sert.sert_who,'
      'cast(kln.kln_fam||'#39' '#39'||bg_left(kln.kln_name,1)||'#39'. '#39'||'
      'bg_left(kln.kln_name2,1)||'#39'.'#39' as varchar(254)) as fio'
      'from sert,kln'
      'where sert.us_id=kln.kln_id'
      'and sert.tw_id=:tw_id'
      'order by sert_date desc')
    Left = 194
    Top = 244
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tw_id'
        ParamType = ptInput
      end>
    object Query_SertSERT_NUM: TIBStringField
      FieldName = 'SERT_NUM'
      Size = 254
    end
    object Query_SertSERT_DATE: TDateTimeField
      FieldName = 'SERT_DATE'
    end
    object Query_SertSERT_WHO: TIBStringField
      FieldName = 'SERT_WHO'
      Size = 254
    end
    object Query_SertFIO: TIBStringField
      FieldName = 'FIO'
      Size = 254
    end
  end
  object Query_Unprov_PN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionTwDetal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from detal_tw_unprov_PN(:TW_ID,:BRAK) '
      'order by PN_DATE')
    Left = 196
    Top = 195
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TW_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BRAK'
        ParamType = ptInput
      end>
    object IntegerField3: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PN_ID'
      ReadOnly = True
    end
    object IBStringField3: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PN_NUM_FULL'
      ReadOnly = True
      Size = 74
    end
    object DateTimeField1: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'PN_DATE'
      ReadOnly = True
    end
    object DateTimeField2: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'PN_DATE_OPL'
      ReadOnly = True
    end
    object IBStringField4: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_SHORT'
      ReadOnly = True
      Size = 32
    end
    object IntegerField5: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PN_COLOR'
      ReadOnly = True
    end
    object IBStringField5: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 128
    end
    object IBStringField6: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PNVID_NAM'
      ReadOnly = True
      Size = 64
    end
    object IBStringField7: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'OWNER_FULL'
      ReadOnly = True
      Size = 128
    end
    object IBStringField8: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG'
      ReadOnly = True
      Size = 254
    end
    object FloatField4: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PN_KURS'
      ReadOnly = True
      DisplayFormat = '#0.00 руб/$'
    end
    object IBStringField9: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PREFIX'
      ReadOnly = True
      Size = 32
    end
    object FloatField5: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object FloatField6: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object FloatField7: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY_S'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object FloatField8: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object FloatField9: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM_S'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object FloatField10: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEYD'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object FloatField11: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEYD_S'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object FloatField12: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMMD'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object FloatField13: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMMD_S'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object Query_Unprov_PNPOST_OSN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_OSN'
      ReadOnly = True
      Size = 254
    end
  end
  object DsQuery_Unprov_PN: TDataSource
    DataSet = Query_Unprov_PN
    Left = 505
    Top = 406
  end
  object DsQuery_Unprov_RN: TDataSource
    DataSet = Query_Unprov_RN
    Left = 292
    Top = 245
  end
  object Query_Unprov_RN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionTwDetal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from detal_tw_unprov_rnspis(:tw_id,:brak)'
      'order by real_date')
    Left = 292
    Top = 191
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tw_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'brak'
        ParamType = ptInput
      end>
    object IntegerField6: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_ID'
      ReadOnly = True
    end
    object IBStringField10: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_NUM_FULL'
      ReadOnly = True
      Size = 74
    end
    object DateTimeField3: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_DATE'
      ReadOnly = True
    end
    object IBStringField11: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_SHORT'
      ReadOnly = True
      Size = 32
    end
    object IntegerField8: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_COLOR'
      ReadOnly = True
    end
    object IBStringField12: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 128
    end
    object IBStringField13: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'REALVID_NAM'
      ReadOnly = True
      Size = 64
    end
    object IBStringField14: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG'
      ReadOnly = True
      Size = 254
    end
    object FloatField14: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_KURS'
      ReadOnly = True
      DisplayFormat = '#0.00 руб/$'
    end
    object IBStringField15: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PREFIX'
      ReadOnly = True
      Size = 32
    end
    object FloatField15: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object FloatField16: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object FloatField17: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object IBStringField16: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_OSN'
      ReadOnly = True
      Size = 254
    end
    object FloatField18: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEYD'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object FloatField19: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMMD'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object Query_Unprov_RNDOC_TYP: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DOC_TYP'
      ReadOnly = True
    end
  end
  object Query_Move: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionTWMove
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from detal_tw_move(:TW_ID,:BRAK,:DT1,:DT2,:SKL_ID,-1)'
      'order by move_date,doc_typ  ')
    Left = 18
    Top = 281
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TW_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BRAK'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SKL_ID'
        ParamType = ptInput
      end>
    object Query_MoveMOVE_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE_ID'
      ReadOnly = True
    end
    object Query_MoveMOVE_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE_NUM_FULL'
      ReadOnly = True
      Size = 74
    end
    object Query_MoveMOVE_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE_DATE'
      ReadOnly = True
    end
    object Query_MoveSKL_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_SHORT'
      ReadOnly = True
      Size = 32
    end
    object Query_MoveMOVE_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE_COLOR'
      ReadOnly = True
    end
    object Query_MoveUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 128
    end
    object Query_MoveMOVEVID_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MOVEVID_NAM'
      ReadOnly = True
      Size = 64
    end
    object Query_MoveKLN_ORG: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG'
      ReadOnly = True
      Size = 254
    end
    object Query_MoveMOVE_KURS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE_KURS'
      ReadOnly = True
    end
    object Query_MovePOST_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'POST_KOL'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object Query_MoveREAL_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_KOL'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object Query_MoveTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object Query_MoveTW_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object Query_MoveMOVE_OSN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE_OSN'
      ReadOnly = True
      Size = 254
    end
    object Query_MoveTW_MONEYD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEYD'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object Query_MoveTW_SUMMD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMMD'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object Query_MoveDOC_TYP: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DOC_TYP'
      ReadOnly = True
    end
  end
  object DsQuery_MOVE: TDataSource
    DataSet = Query_Move
    Left = 93
    Top = 285
  end
  object DsQuery_POST: TDataSource
    DataSet = Query_POST
    Left = 95
    Top = 186
  end
  object Query_POST: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionTwDetal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from detal_tw_post(:TW_ID,:BRAK,:DT1,:DT2,:SKL_ID,-1) '
      'order by PN_DATE')
    Left = 19
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TW_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BRAK'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SKL_ID'
        ParamType = ptInput
      end>
    object Query_POSTPN_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PN_ID'
      ReadOnly = True
    end
    object Query_POSTPN_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PN_NUM_FULL'
      ReadOnly = True
      Size = 74
    end
    object Query_POSTPN_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'PN_DATE'
      ReadOnly = True
    end
    object Query_POSTPN_DATE_OPL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'PN_DATE_OPL'
      ReadOnly = True
    end
    object Query_POSTSKL_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_SHORT'
      ReadOnly = True
      Size = 32
    end
    object Query_POSTPN_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PN_COLOR'
      ReadOnly = True
    end
    object Query_POSTUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 128
    end
    object Query_POSTPNVID_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PNVID_NAM'
      ReadOnly = True
      Size = 64
    end
    object Query_POSTOWNER_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'OWNER_FULL'
      ReadOnly = True
      Size = 128
    end
    object Query_POSTKLN_ORG: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG'
      ReadOnly = True
      Size = 254
    end
    object Query_POSTPN_KURS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PN_KURS'
      ReadOnly = True
      DisplayFormat = '#0.00 руб/$'
    end
    object Query_POSTKLN_PREFIX: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PREFIX'
      ReadOnly = True
      Size = 32
    end
    object Query_POSTTW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object Query_POSTTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object Query_POSTTW_MONEY_S: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY_S'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object Query_POSTTW_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object Query_POSTTW_SUMM_S: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM_S'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object Query_POSTTW_MONEYD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEYD'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object Query_POSTTW_MONEYD_S: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEYD_S'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object Query_POSTTW_SUMMD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMMD'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object Query_POSTTW_SUMMD_S: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMMD_S'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object Query_POSTPOST_OSN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_OSN'
      ReadOnly = True
      Size = 254
    end
  end
  object Query_Realiz: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionTwDetal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from detal_tw_real(:tw_id,:brak,:DT1,:DT2,:SKL_ID,-1)'
      'order by real_date')
    Left = 19
    Top = 233
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tw_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'brak'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SKL_ID'
        ParamType = ptInput
      end>
    object Query_RealizREAL_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_ID'
      ReadOnly = True
    end
    object Query_RealizREAL_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_NUM_FULL'
      ReadOnly = True
      Size = 74
    end
    object Query_RealizREAL_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_DATE'
      ReadOnly = True
    end
    object Query_RealizSKL_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_SHORT'
      ReadOnly = True
      Size = 32
    end
    object Query_RealizREAL_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_COLOR'
      ReadOnly = True
    end
    object Query_RealizUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 128
    end
    object Query_RealizREALVID_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'REALVID_NAM'
      ReadOnly = True
      Size = 64
    end
    object Query_RealizKLN_ORG: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG'
      ReadOnly = True
      Size = 254
    end
    object Query_RealizREAL_KURS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_KURS'
      ReadOnly = True
      DisplayFormat = '#0.00 руб/$'
    end
    object Query_RealizKLN_PREFIX: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PREFIX'
      ReadOnly = True
      Size = 32
    end
    object Query_RealizTW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object Query_RealizTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object Query_RealizTW_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 р'
    end
    object Query_RealizREAL_OSN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'REAL_OSN'
      ReadOnly = True
      Size = 254
    end
    object Query_RealizTW_MONEYD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEYD'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object Query_RealizTW_SUMMD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMMD'
      ReadOnly = True
      DisplayFormat = ',#0.00 $'
    end
    object Query_RealizDOC_TYP: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DOC_TYP'
      ReadOnly = True
    end
  end
  object DsQuery_Realiz: TDataSource
    DataSet = Query_Realiz
    Left = 93
    Top = 235
  end
  object DsQuery_Unprov_PER: TDataSource
    DataSet = Query_Unprov_PER
    Left = 507
    Top = 349
  end
  object Query_Unprov_PER: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionTwDetal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from detal_tw_unprov_per(:TW_ID,:BRAK)'
      'order by per_date')
    Left = 505
    Top = 299
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TW_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BRAK'
        ParamType = ptInput
      end>
    object Query_Unprov_PERPER_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PER_ID'
      ReadOnly = True
    end
    object Query_Unprov_PERPER_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PER_NUM_FULL'
      ReadOnly = True
      Size = 74
    end
    object Query_Unprov_PERPER_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'PER_DATE'
      ReadOnly = True
    end
    object Query_Unprov_PERSKL_FROM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_FROM'
      ReadOnly = True
      Size = 32
    end
    object Query_Unprov_PERSKL_TO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_TO'
      ReadOnly = True
      Size = 32
    end
    object Query_Unprov_PERPER_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PER_COLOR'
      ReadOnly = True
    end
    object Query_Unprov_PERUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 128
    end
    object Query_Unprov_PERTW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object Query_Unprov_PERPER_OSN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PER_OSN'
      ReadOnly = True
      Size = 254
    end
  end
  object Query_REMON: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionTwDetal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from detal_tw_remon(:tw_ID) '
      'order by remon_date')
    Left = 19
    Top = 339
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TW_ID'
        ParamType = ptInput
      end>
    object Query_REMONREMON_NUM_FULL: TIBStringField
      FieldName = 'REMON_NUM_FULL'
      Origin = 'DETAL_TW_REMON.REMON_NUM_FULL'
      Size = 64
    end
    object Query_REMONREMON_DATE: TDateTimeField
      FieldName = 'REMON_DATE'
      Origin = 'DETAL_TW_REMON.REMON_DATE'
    end
    object Query_REMONSKL_FULL: TIBStringField
      FieldName = 'SKL_FULL'
      Origin = 'DETAL_TW_REMON.SKL_FULL'
      Size = 254
    end
    object Query_REMONTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'DETAL_TW_REMON.TW_KOL'
    end
    object Query_REMONED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Origin = 'DETAL_TW_REMON.ED_SHORT'
      Size = 32
    end
    object Query_REMONOLD_MONEY: TFloatField
      FieldName = 'OLD_MONEY'
      Origin = 'DETAL_TW_REMON.OLD_MONEY'
      DisplayFormat = '#0.00 руб'
    end
    object Query_REMONNEW_MONEY: TFloatField
      FieldName = 'NEW_MONEY'
      Origin = 'DETAL_TW_REMON.NEW_MONEY'
      DisplayFormat = '#0.00 руб'
    end
    object Query_REMONREMON_OSN: TIBStringField
      FieldName = 'REMON_OSN'
      Origin = 'DETAL_TW_REMON.REMON_OSN'
      Size = 254
    end
    object Query_REMONUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'DETAL_TW_REMON.US_FULL'
      Size = 100
    end
    object Query_REMONREMON_SHOP: TIBStringField
      FieldName = 'REMON_SHOP'
      Origin = 'DETAL_TW_REMON.REMON_SHOP'
      Size = 64
    end
    object Query_REMONREMON_SHOP_MET: TIBStringField
      FieldName = 'REMON_SHOP_MET'
      Origin = 'DETAL_TW_REMON.REMON_SHOP_MET'
      FixedChar = True
      Size = 1
    end
  end
  object Ds_REMON: TDataSource
    DataSet = Query_REMON
    Left = 19
    Top = 387
  end
  object QrPostMove: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    OnCalcFields = QrPostMoveCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from report_post_move(:DT1,:DT2,:KLN_ID)'
      'order by DOC_VID,DOC_DATE')
    Left = 596
    Top = 197
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'KLN_ID'
        ParamType = ptInput
      end>
    object QrPostMoveTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object QrPostMoveTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object QrPostMoveDOC_FULL_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'DOC_FULL_NUM'
      ReadOnly = True
      Size = 74
    end
    object QrPostMoveDOC_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'DOC_DATE'
      ReadOnly = True
    end
    object QrPostMoveDOC_VID: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'DOC_VID'
      ReadOnly = True
      Size = 64
    end
    object QrPostMoveED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object QrPostMoveTW_MROZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MROZ'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QrPostMoveTW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrPostMoveTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QrPostMoveKLN_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrPostMoveUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrPostMoveTW_SUMMR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_SUMMR'
      DisplayFormat = ',#0.00 руб'
      Calculated = True
    end
    object QrPostMoveTW_SUMMZ: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_SUMMZ'
      DisplayFormat = ',#0.00 руб'
      Calculated = True
    end
    object QrPostMoveSUMM_ACTIV: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SUMM_ACTIV'
      ReadOnly = True
    end
    object QrPostMoveDOC_DATE_FULL: TStringField
      FieldKind = fkCalculated
      FieldName = 'DOC_DATE_FULL'
      Calculated = True
    end
  end
  object PrintSTFAKTS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from Print_STFAKTS(:STFAKT_ID, :IS_WOZW_RN)')
    Left = 446
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'STFAKT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IS_WOZW_RN'
        ParamType = ptUnknown
      end>
    object PrintSTFAKTSTW_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ID'
      ReadOnly = True
    end
    object PrintSTFAKTSTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object PrintSTFAKTSTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object PrintSTFAKTSED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object PrintSTFAKTSTW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
    end
    object PrintSTFAKTSTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
    end
    object PrintSTFAKTSTW_NDS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NDS'
      ReadOnly = True
    end
    object PrintSTFAKTSTW_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM'
      ReadOnly = True
    end
    object PrintSTFAKTSTW_SUMM_NDS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM_NDS'
      ReadOnly = True
    end
    object PrintSTFAKTSTW_SUMM_ALL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM_ALL'
      ReadOnly = True
    end
    object PrintSTFAKTSERR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ERR'
      ReadOnly = True
      Size = 1
    end
    object PrintSTFAKTSTW_TAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_TAM'
      ReadOnly = True
      Size = 254
    end
    object PrintSTFAKTSTW_LAND: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_LAND'
      ReadOnly = True
      Size = 254
    end
    object PrintSTFAKTSed_kod: TStringField
      FieldName = 'ed_kod'
      Size = 32
    end
  end
  object PrintSTFAKT: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_STFAKT(:STFAKT_ID, :IS_WOZW_RN)')
    Left = 376
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'STFAKT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IS_WOZW_RN'
        ParamType = ptUnknown
      end>
    object PrintSTFAKTPOST_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_FULL'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTFAKTPOST_ADR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_ADR'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTFAKTPOST_REKW: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_REKW'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTFAKTPOST_TEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_TEL'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTFAKTKLN_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTFAKTKLN_ADR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ADR'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTFAKTKLN_REKW: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_REKW'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTFAKTKLN_TEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_TEL'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTFAKTSTFAKT_FULL_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'STFAKT_FULL_NUM'
      ReadOnly = True
      Size = 90
    end
    object PrintSTFAKTSTFAKT_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'STFAKT_DATE'
      ReadOnly = True
    end
    object PrintSTFAKTUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintSTFAKTPOST_DIR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_DIR'
      ReadOnly = True
      Size = 254
    end
    object PrintSTFAKTPOST_GB: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_GB'
      ReadOnly = True
      Size = 254
    end
    object PrintSTFAKTSTFAKT_DOCS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'STFAKT_DOCS'
      ReadOnly = True
      Size = 5000
    end
    object PrintSTFAKTGP_FULL: TIBStringField
      FieldName = 'GP_FULL'
      Origin = 'PRINT_STFAKT.GP_FULL'
      Size = 1000
    end
    object PrintSTFAKTGP_ADR: TIBStringField
      FieldName = 'GP_ADR'
      Origin = 'PRINT_STFAKT.GP_ADR'
      Size = 1000
    end
    object PrintSTFAKTGP_REKW: TIBStringField
      FieldName = 'GP_REKW'
      Origin = 'PRINT_STFAKT.GP_REKW'
      Size = 1000
    end
    object PrintSTFAKTGP_TEL: TIBStringField
      FieldName = 'GP_TEL'
      Origin = 'PRINT_STFAKT.GP_TEL'
      Size = 1000
    end
    object PrintSTFAKTPOST_INN_KPP: TIBStringField
      FieldName = 'POST_INN_KPP'
      Origin = 'PRINT_STFAKT.POST_INN_KPP'
      Size = 32
    end
    object PrintSTFAKTKLN_INN_KPP: TIBStringField
      FieldName = 'KLN_INN_KPP'
      Origin = 'PRINT_STFAKT.KLN_INN_KPP'
      Size = 32
    end
    object PrintSTFAKTKLN_FULL_NAME: TIBStringField
      FieldName = 'KLN_FULL_NAME'
      Origin = 'PRINT_STFAKT.KLN_FULL_NAME'
      Size = 254
    end
    object PrintSTFAKTFRM_ID: TIntegerField
      FieldName = 'FRM_ID'
    end
    object PrintSTFAKTRN_GP: TIBStringField
      FieldName = 'RN_GP'
      Origin = 'PRINT_STFAKT.RN_GP'
      Size = 254
    end
    object PrintSTFAKTgp_full_addr: TStringField
      FieldName = 'gp_full_addr'
      Size = 1000
    end
    object PrintSTFAKTPRINT_FOOTER: TIntegerField
      FieldName = 'PRINT_FOOTER'
      Origin = 'PRINT_STFAKT.PRINT_FOOTER'
    end
  end
  object ReportSkid: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from report_osn_skid2(:US_ID,:DT1,:DT2,:PERCENT,:RNTYP_' +
        'ID)'
      'order by ALL_SKID desc')
    Left = 92
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT2'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCENT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RNTYP_ID'
        ParamType = ptInput
      end>
    object ReportSkidRN_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'RN_NUM_FULL'
      ReadOnly = True
      Size = 100
    end
    object ReportSkidRN_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_ID'
      ReadOnly = True
    end
    object ReportSkidTW_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ID'
      ReadOnly = True
    end
    object ReportSkidTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object ReportSkidTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object ReportSkidED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object ReportSkidSKL_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_FULL'
      ReadOnly = True
      Size = 254
    end
    object ReportSkidTW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
    end
    object ReportSkidTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
    end
    object ReportSkidTW_MONEY_OK: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY_OK'
      ReadOnly = True
    end
    object ReportSkidTW_SKID: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SKID'
      ReadOnly = True
    end
    object ReportSkidTW_SKIDDOLL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SKIDDOLL'
      ReadOnly = True
    end
    object ReportSkidRN_SKID: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'RN_SKID'
      ReadOnly = True
    end
    object ReportSkidALL_SKID: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'ALL_SKID'
      ReadOnly = True
    end
    object ReportSkidSKID_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SKID_MONEY'
      ReadOnly = True
    end
    object ReportSkidTW_SKIDTXT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SKIDTXT'
      ReadOnly = True
      Size = 254
    end
    object ReportSkidRN_SKIDTXT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'RN_SKIDTXT'
      ReadOnly = True
      Size = 254
    end
    object ReportSkidUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
  end
  object PrintMail: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_mail(:mail_id)')
    Left = 198
    ParamData = <
      item
        DataType = ftInteger
        Name = 'mail_id'
        ParamType = ptInput
      end>
    object PrintMailMAILVID_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MAILVID_NAM'
      ReadOnly = True
      Size = 64
    end
    object PrintMailFROM_TXT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FROM_TXT'
      ReadOnly = True
      Size = 254
    end
    object PrintMailTO_TXT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TO_TXT'
      ReadOnly = True
      Size = 254
    end
    object PrintMailMAIL_TEM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MAIL_TEM'
      ReadOnly = True
      Size = 254
    end
    object PrintMailMAIL_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'MAIL_DATE'
      ReadOnly = True
    end
    object PrintMailMAIL_NUM: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MAIL_NUM'
      ReadOnly = True
    end
    object PrintMailMAIL_TXT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MAIL_TXT'
      ReadOnly = True
      Size = 20000
    end
    object PrintMailMAIL_ADD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MAIL_ADD'
      ReadOnly = True
      Size = 10000
    end
    object PrintMailMAIL_CONF: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MAIL_CONF'
      ReadOnly = True
      Size = 64
    end
    object PrintMailMAIL_REPLY: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MAIL_REPLY'
      ReadOnly = True
      Size = 64
    end
  end
  object PrintMails: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    OnCalcFields = PrintMailsCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_mails(:mail_id) order by mails_id')
    Left = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'mail_id'
        ParamType = ptInput
      end>
    object PrintMailsMAILS_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MAILS_ID'
      ReadOnly = True
    end
    object PrintMailsTW_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ID'
      ReadOnly = True
    end
    object PrintMailsTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object PrintMailsTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object PrintMailsTWKTG_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TWKTG_ID'
      ReadOnly = True
    end
    object PrintMailsVALUTA_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'VALUTA_ID'
      ReadOnly = True
    end
    object PrintMailsTW_MROZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MROZ'
      ReadOnly = True
    end
    object PrintMailsTW_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_COLOR'
      ReadOnly = True
    end
    object PrintMailsED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object PrintMailsTW_RASPR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_RASPR'
      ReadOnly = True
      Size = 1
    end
    object PrintMailsOST: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OST'
      ReadOnly = True
    end
    object PrintMailsTW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
    end
    object PrintMailsTW_KOL_OLD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL_OLD'
      ReadOnly = True
    end
    object PrintMailsMONEY_ZAK: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MONEY_ZAK'
      ReadOnly = True
    end
    object PrintMailsNEW_MROZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'NEW_MROZ'
      ReadOnly = True
    end
    object PrintMailsMAILS_SPEED: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MAILS_SPEED'
      ReadOnly = True
    end
    object PrintMailsMAILS_PRIM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MAILS_PRIM'
      ReadOnly = True
      Size = 254
    end
    object PrintMailsOLD_MZAK: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OLD_MZAK'
      ReadOnly = True
    end
    object PrintMailsTW_PERCENT: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_PERCENT'
      ReadOnly = True
    end
    object PrintMailsVALUTA_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALUTA_SHORT'
      ReadOnly = True
      Size = 32
    end
    object PrintMailsRASP1: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RASP1'
      ReadOnly = True
    end
    object PrintMailsRASP2: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RASP2'
      ReadOnly = True
    end
    object PrintMailsRASP3: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RASP3'
      ReadOnly = True
    end
    object PrintMailsRASP4: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RASP4'
      ReadOnly = True
    end
    object PrintMailsRASP5: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RASP5'
      ReadOnly = True
    end
    object PrintMailsRASP6: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RASP6'
      ReadOnly = True
    end
    object PrintMailsRASP7: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RASP7'
      ReadOnly = True
    end
    object PrintMailsRASP8: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RASP8'
      ReadOnly = True
    end
    object PrintMailsRASP9: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RASP9'
      ReadOnly = True
    end
    object PrintMailsRASP10: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RASP10'
      ReadOnly = True
    end
    object PrintMailsRASP11: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RASP11'
      ReadOnly = True
    end
    object PrintMailsRASP12: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RASP12'
      ReadOnly = True
    end
    object PrintMailsMOVE1: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE1'
      ReadOnly = True
    end
    object PrintMailsMOVE2: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE2'
      ReadOnly = True
    end
    object PrintMailsMOVE3: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE3'
      ReadOnly = True
    end
    object PrintMailsMOVE4: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE4'
      ReadOnly = True
    end
    object PrintMailsMOVE5: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE5'
      ReadOnly = True
    end
    object PrintMailsMOVE6: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE6'
      ReadOnly = True
    end
    object PrintMailsMOVE7: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE7'
      ReadOnly = True
    end
    object PrintMailsMOVE8: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE8'
      ReadOnly = True
    end
    object PrintMailsMOVE9: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE9'
      ReadOnly = True
    end
    object PrintMailsMOVE10: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE10'
      ReadOnly = True
    end
    object PrintMailsMOVE11: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE11'
      ReadOnly = True
    end
    object PrintMailsMOVE12: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE12'
      ReadOnly = True
    end
    object PrintMailsTW_WEIGHT: TFloatField
      FieldName = 'TW_WEIGHT'
      Origin = 'LIST_MAILS.TW_WEIGHT'
    end
    object PrintMailsMAILS_WEIGHT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MAILS_WEIGHT'
      Calculated = True
    end
    object PrintMailsNEW_MONEY1: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'NEW_MONEY1'
      Origin = 'LIST_MAILS.NEW_MONEY1'
    end
    object PrintMailsOLD_MONEY1: TFloatField
      FieldName = 'OLD_MONEY1'
      Origin = 'LIST_MAILS.OLD_MONEY1'
    end
    object PrintMailsNEW_MONEY2: TFloatField
      FieldName = 'NEW_MONEY2'
      Origin = 'LIST_MAILS.NEW_MONEY2'
    end
    object PrintMailsOLD_MONEY2: TFloatField
      FieldName = 'OLD_MONEY2'
      Origin = 'LIST_MAILS.OLD_MONEY2'
    end
    object PrintMailsNEW_MONEY3: TFloatField
      FieldName = 'NEW_MONEY3'
      Origin = 'LIST_MAILS.NEW_MONEY3'
    end
    object PrintMailsOLD_MONEY3: TFloatField
      FieldName = 'OLD_MONEY3'
      Origin = 'LIST_MAILS.OLD_MONEY3'
    end
  end
  object PrintRemon: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_remon(:remon_id,:skl_id)')
    Left = 516
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'remon_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'skl_id'
        ParamType = ptInput
      end>
    object PrintRemonFRM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FRM_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintRemonREMON_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'REMON_NUM_FULL'
      ReadOnly = True
      Size = 100
    end
    object PrintRemonSKL_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_FULL'
      ReadOnly = True
      Size = 1000
    end
    object PrintRemonUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintRemonREMON_OSN: TIBStringField
      FieldName = 'REMON_OSN'
      Origin = 'PRINT_REMON.REMON_OSN'
      Size = 10000
    end
  end
  object PrintRemons: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_remons(:remon_id,:skl_id,:ful)'
      'order by tw_nam,tw_art')
    Left = 580
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'remon_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'skl_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ful'
        ParamType = ptInput
      end>
    object PrintRemonsTW_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ID'
      ReadOnly = True
    end
    object PrintRemonsTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object PrintRemonsTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object PrintRemonsED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object PrintRemonsTW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
    end
    object PrintRemonsOLD_MROZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OLD_MROZ'
      ReadOnly = True
    end
    object PrintRemonsNEW_MROZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'NEW_MROZ'
      ReadOnly = True
    end
    object PrintRemonsREMONS_PRIM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'REMONS_PRIM'
      ReadOnly = True
      Size = 254
    end
    object PrintRemonsOLD_MONEY3: TFloatField
      FieldName = 'OLD_MONEY3'
      Origin = 'PRINT_REMONS.OLD_MONEY3'
    end
    object PrintRemonsOLD_MONEY2: TFloatField
      FieldName = 'OLD_MONEY2'
      Origin = 'PRINT_REMONS.OLD_MONEY2'
    end
    object PrintRemonsOLD_MONEY1: TFloatField
      FieldName = 'OLD_MONEY1'
      Origin = 'PRINT_REMONS.OLD_MONEY1'
    end
    object PrintRemonsNEW_MONEY3: TFloatField
      FieldName = 'NEW_MONEY3'
      Origin = 'PRINT_REMONS.NEW_MONEY3'
    end
    object PrintRemonsNEW_MONEY2: TFloatField
      FieldName = 'NEW_MONEY2'
      Origin = 'PRINT_REMONS.NEW_MONEY2'
    end
    object PrintRemonsNEW_MONEY1: TFloatField
      FieldName = 'NEW_MONEY1'
      Origin = 'PRINT_REMONS.NEW_MONEY1'
    end
  end
  object PrintMail2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_mail2(:mail_id)')
    Left = 322
    ParamData = <
      item
        DataType = ftInteger
        Name = 'mail_id'
        ParamType = ptInput
      end>
    object PrintMail2FRM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FRM_FULL'
      ReadOnly = True
      Size = 10000
    end
    object PrintMail2FRM_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FRM_SHORT'
      ReadOnly = True
      Size = 254
    end
    object PrintMail2FRM_TEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FRM_TEL'
      ReadOnly = True
      Size = 254
    end
    object PrintMail2PRIM1: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PRIM1'
      ReadOnly = True
      Size = 10000
    end
    object PrintMail2MAIL_TXT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MAIL_TXT'
      ReadOnly = True
      Size = 20000
    end
    object PrintMail2MAIL_FULL_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MAIL_FULL_NUM'
      ReadOnly = True
      Size = 254
    end
    object PrintMail2MAIL_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'MAIL_DATE'
      ReadOnly = True
    end
    object PrintMail2VALUTA_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALUTA_FULL'
      ReadOnly = True
      Size = 254
    end
    object PrintMail2MAIL_OSN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MAIL_OSN'
      ReadOnly = True
      Size = 254
    end
    object PrintMail2POST_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_FULL'
      ReadOnly = True
      Size = 10000
    end
    object PrintMail2POST_ADD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_ADD'
      ReadOnly = True
      Size = 10000
    end
    object PrintMail2TITLE1: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TITLE1'
      ReadOnly = True
      Size = 32
    end
    object PrintMail2TITLE2: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TITLE2'
      ReadOnly = True
      Size = 32
    end
    object PrintMail2TITLE3: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TITLE3'
      ReadOnly = True
      Size = 32
    end
    object PrintMail2TITLE4: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TITLE4'
      ReadOnly = True
      Size = 32
    end
    object PrintMail2TITLE5: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TITLE5'
      ReadOnly = True
      Size = 32
    end
    object PrintMail2TITLE6: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TITLE6'
      ReadOnly = True
      Size = 32
    end
    object PrintMail2TITLE7: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TITLE7'
      ReadOnly = True
      Size = 32
    end
    object PrintMail2TITLE8: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TITLE8'
      ReadOnly = True
      Size = 32
    end
    object PrintMail2TITLE9: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TITLE9'
      ReadOnly = True
      Size = 32
    end
    object PrintMail2TITLE10: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TITLE10'
      ReadOnly = True
      Size = 32
    end
    object PrintMail2TITLE11: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TITLE11'
      ReadOnly = True
      Size = 32
    end
    object PrintMail2TITLE12: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TITLE12'
      ReadOnly = True
      Size = 32
    end
    object PrintMail2FROM_TXT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FROM_TXT'
      ReadOnly = True
      Size = 254
    end
  end
  object PrintMails2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select print_mails2.* from print_mails2(:mail_id)')
    Left = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'mail_id'
        ParamType = ptInput
      end>
    object PrintMails2TW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object PrintMails2TW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object PrintMails2ED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object PrintMails2TW_KOL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
    end
    object PrintMails2TW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
    end
    object PrintMails2VALUTA_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALUTA_SHORT'
      ReadOnly = True
      Size = 32
    end
    object PrintMails2TW_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM'
      ReadOnly = True
    end
    object PrintMails2TW_PERCENT: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_PERCENT'
      ReadOnly = True
    end
    object PrintMails2NEW_MROZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'NEW_MROZ'
      ReadOnly = True
    end
    object PrintMails2PRIBYL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PRIBYL'
      ReadOnly = True
    end
    object PrintMails2MOVE1: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE1'
      ReadOnly = True
    end
    object PrintMails2MOVE2: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE2'
      ReadOnly = True
    end
    object PrintMails2MOVE3: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE3'
      ReadOnly = True
    end
    object PrintMails2MOVE4: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE4'
      ReadOnly = True
    end
    object PrintMails2MOVE5: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE5'
      ReadOnly = True
    end
    object PrintMails2MOVE6: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE6'
      ReadOnly = True
    end
    object PrintMails2MOVE7: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE7'
      ReadOnly = True
    end
    object PrintMails2MOVE8: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE8'
      ReadOnly = True
    end
    object PrintMails2MOVE9: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE9'
      ReadOnly = True
    end
    object PrintMails2MOVE10: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE10'
      ReadOnly = True
    end
    object PrintMails2MOVE11: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE11'
      ReadOnly = True
    end
    object PrintMails2MOVE12: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MOVE12'
      ReadOnly = True
    end
    object PrintMails2MAILS_PRIM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MAILS_PRIM'
      ReadOnly = True
      Size = 254
    end
    object PrintMails2MAILS_WEIGHT: TFloatField
      FieldName = 'MAILS_WEIGHT'
      Origin = 'PRINT_MAILS2.MAILS_WEIGHT'
    end
    object PrintMails2OLD_MONEY3: TFloatField
      FieldName = 'OLD_MONEY3'
      Origin = 'PRINT_MAILS2.OLD_MONEY3'
    end
    object PrintMails2OLD_MONEY2: TFloatField
      FieldName = 'OLD_MONEY2'
      Origin = 'PRINT_MAILS2.OLD_MONEY2'
    end
    object PrintMails2OLD_MONEY1: TFloatField
      FieldName = 'OLD_MONEY1'
      Origin = 'PRINT_MAILS2.OLD_MONEY1'
    end
    object PrintMails2NEW_MONEY3: TFloatField
      FieldName = 'NEW_MONEY3'
      Origin = 'PRINT_MAILS2.NEW_MONEY3'
    end
    object PrintMails2NEW_MONEY2: TFloatField
      FieldName = 'NEW_MONEY2'
      Origin = 'PRINT_MAILS2.NEW_MONEY2'
    end
    object PrintMails2NEW_MONEY1: TFloatField
      FieldName = 'NEW_MONEY1'
      Origin = 'PRINT_MAILS2.NEW_MONEY1'
    end
    object PrintMails2NEW_MONEY4: TFloatField
      FieldName = 'NEW_MONEY4'
      Origin = 'PRINT_MAILS2.NEW_MONEY4'
    end
    object PrintMails2OLD_MONEY4: TFloatField
      FieldName = 'OLD_MONEY4'
      Origin = 'PRINT_MAILS2.OLD_MONEY4'
    end
    object PrintMails2NEW_MONEY6: TFloatField
      FieldName = 'NEW_MONEY6'
      Origin = 'PRINT_MAILS2.NEW_MONEY6'
    end
    object PrintMails2NEW_MONEY7: TFloatField
      FieldName = 'NEW_MONEY7'
      Origin = 'PRINT_MAILS2.NEW_MONEY7'
    end
    object PrintMails2NEW_MONEY8: TFloatField
      FieldName = 'NEW_MONEY8'
      Origin = 'PRINT_MAILS2.NEW_MONEY8'
    end
    object PrintMails2OLD_MONEY6: TFloatField
      FieldName = 'OLD_MONEY6'
      Origin = 'PRINT_MAILS2.OLD_MONEY6'
    end
    object PrintMails2OLD_MONEY7: TFloatField
      FieldName = 'OLD_MONEY7'
      Origin = 'PRINT_MAILS2.OLD_MONEY7'
    end
    object PrintMails2OLD_MONEY8: TFloatField
      FieldName = 'OLD_MONEY8'
      Origin = 'PRINT_MAILS2.OLD_MONEY8'
    end
  end
  object DsRNS: TDataSource
    DataSet = PrintRNS
    Left = 12
    Top = 44
  end
  object DsRN: TDataSource
    DataSet = PrintRN
    Left = 74
    Top = 44
  end
  object DsMail: TDataSource
    DataSet = PrintMail
    Left = 198
    Top = 44
  end
  object DsMails: TDataSource
    DataSet = PrintMails
    Left = 260
    Top = 44
  end
  object DsMail2: TDataSource
    DataSet = PrintMail2
    Left = 322
    Top = 44
  end
  object DsMails2: TDataSource
    DataSet = PrintMails2
    Left = 384
    Top = 46
  end
  object DsSpis: TDataSource
    DataSet = PrintSPIS
    Left = 446
    Top = 44
  end
  object DsSpiss: TDataSource
    DataSet = PrintSPISS
    Left = 508
    Top = 44
  end
  object DsPer: TDataSource
    DataSet = PrintPER
    Left = 570
    Top = 44
  end
  object DsPers: TDataSource
    DataSet = PrintPERS
    Left = 632
    Top = 46
  end
  object DsPN: TDataSource
    DataSet = PrintPN
    Left = 12
    Top = 150
  end
  object DsPNS: TDataSource
    DataSet = PrintPNS
    Left = 74
    Top = 150
  end
  object DsKKM: TDataSource
    DataSet = PrintKKM
    Left = 134
    Top = 150
  end
  object DsKKMS: TDataSource
    DataSet = PrintKKMS
    Left = 198
    Top = 148
  end
  object DsST: TDataSource
    DataSet = PrintST
    Left = 260
    Top = 150
  end
  object DsSTS: TDataSource
    DataSet = PrintSTS
    Left = 322
    Top = 150
  end
  object DsSTFAKT: TDataSource
    DataSet = PrintSTFAKT
    Left = 364
    Top = 158
  end
  object DsSTFAKTS: TDataSource
    DataSet = PrintSTFAKTS
    Left = 448
    Top = 150
  end
  object DsRemon: TDataSource
    DataSet = PrintRemon
    Left = 516
    Top = 148
  end
  object DsRemons: TDataSource
    DataSet = PrintRemons
    Left = 580
    Top = 148
  end
  object DsGarant: TDataSource
    DataSet = PrintGarant
    Left = 640
    Top = 148
  end
  object DsPostList: TDataSource
    DataSet = ReportPostList
    Left = 444
    Top = 244
  end
  object DsPostOst: TDataSource
    DataSet = ReportPostOst
    Left = 516
    Top = 244
  end
  object DsPostMove: TDataSource
    DataSet = QrPostMove
    Left = 596
    Top = 244
  end
  object QrDetalKLN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from detal_kln(:kln_id)')
    Left = 380
    Top = 196
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'kln_id'
        ParamType = ptUnknown
      end>
    object QrDetalKLNKLNTREE_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLNTREE_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_FAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FAM'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_NAME: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_NAME'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_NAME2: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_NAME2'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_EMAIL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_EMAIL'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_PASS_SER: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PASS_SER'
      ReadOnly = True
      Size = 32
    end
    object QrDetalKLNKLN_PASS_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PASS_NUM'
      ReadOnly = True
      Size = 32
    end
    object QrDetalKLNKLN_PASS_WYDD: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PASS_WYDD'
      ReadOnly = True
    end
    object QrDetalKLNKLN_PASS_WYD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PASS_WYD'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_SVID: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_SVID'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_ADR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ADR'
      ReadOnly = True
      Size = 1000
    end
    object QrDetalKLNKLN_CITY: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_CITY'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_OBLAST: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_OBLAST'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_INDEX: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_INDEX'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_LAND: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_LAND'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_TEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_TEL'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_FAX: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FAX'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_SOTEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_SOTEL'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_PAGER: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PAGER'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_ORG: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_DOL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_DOL'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_ORG_ADR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG_ADR'
      ReadOnly = True
      Size = 1000
    end
    object QrDetalKLNKLN_ORG_CITY: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG_CITY'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_ORG_OBLAST: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG_OBLAST'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_ORG_INDEX: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG_INDEX'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_ORG_LAND: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG_LAND'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_ORG_TEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG_TEL'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_ORG_FAX: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ORG_FAX'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_INN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_INN'
      ReadOnly = True
      Size = 12
    end
    object QrDetalKLNKLN_OK1: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_OK1'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_OK2: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_OK2'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_BNK: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_BNK'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_BNKADR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_BNKADR'
      ReadOnly = True
      Size = 1000
    end
    object QrDetalKLNKLN_KB: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_KB'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_RS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_RS'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_BIK: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_BIK'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_KS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_KS'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_OFFICE_ADR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_OFFICE_ADR'
      ReadOnly = True
      Size = 1000
    end
    object QrDetalKLNKLN_OFFICE_TEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_OFFICE_TEL'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_OFFICE_FAX: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_OFFICE_FAX'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_OFFICE_TIME: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_OFFICE_TIME'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_OFFICE_BIGAUTO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_OFFICE_BIGAUTO'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_OFFICE_CONTACT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_OFFICE_CONTACT'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_SKL_ADR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_SKL_ADR'
      ReadOnly = True
      Size = 1000
    end
    object QrDetalKLNKLN_SKL_TEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_SKL_TEL'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_SKL_FAX: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_SKL_FAX'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_SKL_TIME: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_SKL_TIME'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_SKL_BIGAUTO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_SKL_BIGAUTO'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_PASSWORD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PASSWORD'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNUSGROUP_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'USGROUP_NAM'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_CLOSE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_CLOSE'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_MEN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_MEN'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_SKL_CONTACT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_SKL_CONTACT'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_DIR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_DIR'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_GB: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_GB'
      ReadOnly = True
      Size = 254
    end
    object QrDetalKLNKLN_PREFIX: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PREFIX'
      ReadOnly = True
      Size = 32
    end
    object QrDetalKLNKLN_DR: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_DR'
      ReadOnly = True
    end
    object QrDetalKLNKLN_PRIM: TBlobField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PRIM'
      ReadOnly = True
      BlobType = ftBlob
      Size = 8
    end
    object QrDetalKLNKLN_KPP: TIBStringField
      FieldName = 'KLN_KPP'
      Origin = 'DETAL_KLN.KLN_KPP'
      Size = 9
    end
  end
  object DsDetalKLN: TDataSource
    DataSet = QrDetalKLN
    Left = 380
    Top = 244
  end
  object DsSkid: TDataSource
    DataSet = ReportSkid
    Left = 92
    Top = 388
  end
  object DsCard: TDataSource
    DataSet = ReportCard
    Left = 192
    Top = 348
  end
  object DsKonk: TDataSource
    DataSet = MarketKonk
    Left = 264
    Top = 348
  end
  object DsOld: TDataSource
    DataSet = MarketOld
    Left = 332
    Top = 344
  end
  object PrintPsort: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_PSORT(:PSORT_ID)')
    Left = 700
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PSORT_ID'
        ParamType = ptUnknown
      end>
    object PrintPsortPSORT_FULL_NUM: TIBStringField
      FieldName = 'PSORT_FULL_NUM'
      Origin = 'PRINT_PSORT.PSORT_FULL_NUM'
      Size = 128
    end
    object PrintPsortPSORT_DATE: TDateTimeField
      FieldName = 'PSORT_DATE'
      Origin = 'PRINT_PSORT.PSORT_DATE'
    end
    object PrintPsortFRM_FULL: TIBStringField
      FieldName = 'FRM_FULL'
      Origin = 'PRINT_PSORT.FRM_FULL'
      Size = 254
    end
    object PrintPsortSKL_FULL: TIBStringField
      FieldName = 'SKL_FULL'
      Origin = 'PRINT_PSORT.SKL_FULL'
      Size = 254
    end
    object PrintPsortPSORT_OSN: TIBStringField
      FieldName = 'PSORT_OSN'
      Origin = 'PRINT_PSORT.PSORT_OSN'
      Size = 254
    end
    object PrintPsortUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'PRINT_PSORT.US_FULL'
      Size = 254
    end
    object PrintPsortPSORT_ID2: TIntegerField
      FieldName = 'PSORT_ID2'
      Origin = 'PRINT_PSORT.PSORT_ID2'
    end
    object PrintPsortMEN_FULL: TIBStringField
      FieldName = 'MEN_FULL'
      Origin = 'PRINT_PSORT.MEN_FULL'
      Size = 254
    end
  end
  object PrintPsorts: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_PSORTs(:PSORT_ID) order by psorts_id')
    Left = 758
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PSORT_ID'
        ParamType = ptUnknown
      end>
    object PrintPsortsPSORTS_ID: TIntegerField
      FieldName = 'PSORTS_ID'
      Origin = 'LIST_PSORTS.PSORTS_ID'
    end
    object PrintPsortsTW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'LIST_PSORTS.TW_ID'
    end
    object PrintPsortsTW_ART1: TIntegerField
      FieldName = 'TW_ART1'
      Origin = 'LIST_PSORTS.TW_ART1'
    end
    object PrintPsortsTW_NAM1: TIBStringField
      FieldName = 'TW_NAM1'
      Origin = 'LIST_PSORTS.TW_NAM1'
      Size = 128
    end
    object PrintPsortsTW_COLOR1: TIntegerField
      FieldName = 'TW_COLOR1'
      Origin = 'LIST_PSORTS.TW_COLOR1'
    end
    object PrintPsortsED_SHORT1: TIBStringField
      FieldName = 'ED_SHORT1'
      Origin = 'LIST_PSORTS.ED_SHORT1'
      Size = 6
    end
    object PrintPsortsTW_ID2: TIntegerField
      FieldName = 'TW_ID2'
      Origin = 'LIST_PSORTS.TW_ID2'
    end
    object PrintPsortsTW_ART2: TIntegerField
      FieldName = 'TW_ART2'
      Origin = 'LIST_PSORTS.TW_ART2'
    end
    object PrintPsortsTW_NAM2: TIBStringField
      FieldName = 'TW_NAM2'
      Origin = 'LIST_PSORTS.TW_NAM2'
      Size = 128
    end
    object PrintPsortsED_SHORT2: TIBStringField
      FieldName = 'ED_SHORT2'
      Origin = 'LIST_PSORTS.ED_SHORT2'
      Size = 6
    end
    object PrintPsortsTW_COLOR2: TIntegerField
      FieldName = 'TW_COLOR2'
      Origin = 'LIST_PSORTS.TW_COLOR2'
    end
    object PrintPsortsTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'LIST_PSORTS.TW_KOL'
    end
    object PrintPsortsTW_OST: TFloatField
      FieldName = 'TW_OST'
      Origin = 'LIST_PSORTS.TW_OST'
    end
    object PrintPsortsTW_KOL2: TFloatField
      FieldName = 'TW_KOL2'
    end
  end
  object DsPsort: TDataSource
    DataSet = PrintPsort
    Left = 700
    Top = 46
  end
  object DsPsorts: TDataSource
    DataSet = PrintPsorts
    Left = 758
    Top = 46
  end
  object TransactionTWMove: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 378
    Top = 402
  end
  object PrintNPZ: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_npz(:NPZ_ID)')
    Left = 106
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NPZ_ID'
        ParamType = ptUnknown
      end>
    object PrintNPZNPZ_NUM_FULL: TIBStringField
      FieldName = 'NPZ_NUM_FULL'
      Origin = 'PRINT_NPZ.NPZ_NUM_FULL'
      Size = 100
    end
    object PrintNPZFRM_FULL: TIBStringField
      FieldName = 'FRM_FULL'
      Origin = 'PRINT_NPZ.FRM_FULL'
      Size = 5000
    end
    object PrintNPZUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'PRINT_NPZ.US_FULL'
      Size = 254
    end
    object PrintNPZNPZ_ID2: TIntegerField
      FieldName = 'NPZ_ID2'
      Origin = 'PRINT_NPZ.NPZ_ID2'
    end
    object PrintNPZSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Origin = 'PRINT_NPZ.SHOP_NAME'
      Size = 254
    end
    object PrintNPZZONE_FROM_NAME: TIBStringField
      FieldName = 'ZONE_FROM_NAME'
      Origin = 'PRINT_NPZ.ZONE_FROM_NAME'
      Size = 32
    end
    object PrintNPZZONE_TO_NAME: TIBStringField
      FieldName = 'ZONE_TO_NAME'
      Origin = 'PRINT_NPZ.ZONE_TO_NAME'
      Size = 32
    end
    object PrintNPZZONE_FROM_TYPE: TIBStringField
      FieldName = 'ZONE_FROM_TYPE'
      Origin = 'PRINT_NPZ.ZONE_FROM_TYPE'
      Size = 32
    end
    object PrintNPZZONE_TO_TYPE: TIBStringField
      FieldName = 'ZONE_TO_TYPE'
      Origin = 'PRINT_NPZ.ZONE_TO_TYPE'
      Size = 32
    end
    object PrintNPZZONE_FROM_S: TIBStringField
      FieldName = 'ZONE_FROM_S'
      Origin = 'PRINT_NPZ.ZONE_FROM_S'
      Size = 4
    end
    object PrintNPZZONE_TO_S: TIBStringField
      FieldName = 'ZONE_TO_S'
      Origin = 'PRINT_NPZ.ZONE_TO_S'
      Size = 4
    end
  end
  object DsNpz: TDataSource
    DataSet = PrintNPZ
    Left = 122
    Top = 44
  end
  object PrintNpzs: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from Print_NPZS(:NPZ_ID) order by NPZS_id')
    Left = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NPZ_ID'
        ParamType = ptUnknown
      end>
    object PrintNpzsNPZS_ID: TIntegerField
      FieldName = 'NPZS_ID'
      Origin = 'PRINT_NPZS.NPZS_ID'
    end
    object PrintNpzsTW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'PRINT_NPZS.TW_ART'
    end
    object PrintNpzsTW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'PRINT_NPZS.TW_NAM'
      Size = 254
    end
    object PrintNpzsED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Origin = 'PRINT_NPZS.ED_SHORT'
      Size = 32
    end
    object PrintNpzsTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'PRINT_NPZS.TW_KOL'
    end
  end
  object DsNpzs: TDataSource
    DataSet = PrintNpzs
    Left = 156
    Top = 44
  end
  object PrintTorg12s: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 50
    CachedUpdates = False
    SQL.Strings = (
      'select * from Print_torg12s(:N_ID, :typ) order by ns_id')
    Left = 20
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'N_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'typ'
        ParamType = ptUnknown
      end>
    object PrintTorg12sNS_ID: TIntegerField
      FieldName = 'NS_ID'
      Origin = 'PRINT_TORG12S.NS_ID'
    end
    object PrintTorg12sTW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'PRINT_TORG12S.TW_ART'
    end
    object PrintTorg12sTW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'PRINT_TORG12S.TW_NAM'
      Size = 254
    end
    object PrintTorg12sED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Origin = 'PRINT_TORG12S.ED_SHORT'
      Size = 32
    end
    object PrintTorg12sTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'PRINT_TORG12S.TW_KOL'
    end
    object PrintTorg12sTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      Origin = 'PRINT_TORG12S.TW_MONEY'
    end
    object PrintTorg12sTW_SUMM: TFloatField
      FieldName = 'TW_SUMM'
      Origin = 'PRINT_TORG12S.TW_SUMM'
    end
    object PrintTorg12sTWS_WEIGHT: TFloatField
      FieldName = 'TWS_WEIGHT'
      Origin = 'PRINT_TORG12S.TWS_WEIGHT'
    end
    object PrintTorg12sNDS: TIntegerField
      FieldName = 'NDS'
      Origin = 'PRINT_TORG12S.NDS'
    end
  end
  object PrintTorg12: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 2
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_torg12(:N_ID, :typ)')
    Left = 82
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'N_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'typ'
        ParamType = ptUnknown
      end>
    object PrintTorg12N_NUM_FULL: TIBStringField
      FieldName = 'N_NUM_FULL'
      Origin = 'PRINT_TORG12.N_NUM_FULL'
      Size = 100
    end
    object PrintTorg12FRM_FULL: TIBStringField
      FieldName = 'FRM_FULL'
      Origin = 'PRINT_TORG12.FRM_FULL'
      Size = 5000
    end
    object PrintTorg12FRM_ADR: TIBStringField
      FieldName = 'FRM_ADR'
      Origin = 'PRINT_TORG12.FRM_ADR'
      Size = 5000
    end
    object PrintTorg12FRM_REKW: TIBStringField
      FieldName = 'FRM_REKW'
      Origin = 'PRINT_TORG12.FRM_REKW'
      Size = 5000
    end
    object PrintTorg12FRM_TEL: TIBStringField
      FieldName = 'FRM_TEL'
      Origin = 'PRINT_TORG12.FRM_TEL'
      Size = 254
    end
    object PrintTorg12KLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Origin = 'PRINT_TORG12.KLN_FULL'
      Size = 5000
    end
    object PrintTorg12KLN_ADR: TIBStringField
      FieldName = 'KLN_ADR'
      Origin = 'PRINT_TORG12.KLN_ADR'
      Size = 5000
    end
    object PrintTorg12KLN_REKW: TIBStringField
      FieldName = 'KLN_REKW'
      Origin = 'PRINT_TORG12.KLN_REKW'
      Size = 5000
    end
    object PrintTorg12KLN_TEL: TIBStringField
      FieldName = 'KLN_TEL'
      Origin = 'PRINT_TORG12.KLN_TEL'
      Size = 254
    end
    object PrintTorg12KLN_DIR: TIBStringField
      FieldName = 'KLN_DIR'
      Origin = 'PRINT_TORG12.KLN_DIR'
      Size = 254
    end
    object PrintTorg12KLN_GB: TIBStringField
      FieldName = 'KLN_GB'
      Origin = 'PRINT_TORG12.KLN_GB'
      Size = 254
    end
    object PrintTorg12SKL_FULL: TIBStringField
      FieldName = 'SKL_FULL'
      Origin = 'PRINT_TORG12.SKL_FULL'
      Size = 770
    end
    object PrintTorg12RN_WHO: TIBStringField
      FieldName = 'RN_WHO'
      Origin = 'PRINT_TORG12.RN_WHO'
      Size = 254
    end
    object PrintTorg12OSN: TIBStringField
      FieldName = 'OSN'
      Origin = 'PRINT_TORG12.OSN'
      Size = 10000
    end
    object PrintTorg12N_DOST: TIBStringField
      FieldName = 'N_DOST'
      Origin = 'PRINT_TORG12.N_DOST'
      FixedChar = True
      Size = 1
    end
    object PrintTorg12RN_ID2: TIntegerField
      FieldName = 'RN_ID2'
      Origin = 'PRINT_TORG12.RN_ID2'
    end
    object PrintTorg12FRM_ID: TIntegerField
      FieldName = 'FRM_ID'
      Origin = 'PRINT_TORG12.FRM_ID'
    end
    object PrintTorg12OTG_SKL_FULL: TIBStringField
      FieldName = 'OTG_SKL_FULL'
      Origin = 'PRINT_TORG12.OTG_SKL_FULL'
      Size = 254
    end
    object PrintTorg12TYP_NDS: TIntegerField
      FieldName = 'TYP_NDS'
      Origin = 'PRINT_TORG12.TYP_NDS'
    end
    object PrintTorg12NDS: TIntegerField
      FieldName = 'NDS'
      Origin = 'PRINT_TORG12.NDS'
    end
    object PrintTorg12PROV_US: TStringField
      FieldName = 'PROV_US'
      Origin = 'PRINT_TORG12.PROV_US'
      Size = 254
    end
    object PrintTorg12DOC_SUB: TIBStringField
      FieldName = 'DOC_SUB'
      Origin = 'PRINT_TORG12.DOC_SUB'
      Size = 254
    end
    object PrintTorg12RN_GP: TIBStringField
      DisplayWidth = 250
      FieldName = 'RN_GP'
      Origin = 'PRINT_TORG12.RN_GP'
      Size = 5000
    end
  end
  object DsT12s: TDataSource
    DataSet = PrintTorg12s
    Left = 20
    Top = 516
  end
  object DsT12: TDataSource
    DataSet = PrintTorg12
    Left = 82
    Top = 516
  end
  object DsStFaktPN: TDataSource
    DataSet = PrintSTFAKTPN
    Left = 284
    Top = 534
  end
  object PrintSTFAKTPN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_STFAKT_pn(:pn_ID, :is_rn)')
    Left = 272
    Top = 471
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pn_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'is_rn'
        ParamType = ptUnknown
      end>
    object IBStringField17: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_FULL'
      ReadOnly = True
      Size = 5000
    end
    object IBStringField18: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_ADR'
      ReadOnly = True
      Size = 5000
    end
    object IBStringField19: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_REKW'
      ReadOnly = True
      Size = 5000
    end
    object IBStringField20: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_TEL'
      ReadOnly = True
      Size = 5000
    end
    object IBStringField21: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 5000
    end
    object IBStringField22: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ADR'
      ReadOnly = True
      Size = 5000
    end
    object IBStringField23: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_REKW'
      ReadOnly = True
      Size = 5000
    end
    object IBStringField24: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_TEL'
      ReadOnly = True
      Size = 5000
    end
    object IBStringField25: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'STFAKT_FULL_NUM'
      ReadOnly = True
      Size = 90
    end
    object DateTimeField4: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'STFAKT_DATE'
      ReadOnly = True
    end
    object IBStringField26: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object IBStringField27: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_DIR'
      ReadOnly = True
      Size = 254
    end
    object IBStringField28: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST_GB'
      ReadOnly = True
      Size = 254
    end
    object IBStringField29: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'STFAKT_DOCS'
      ReadOnly = True
      Size = 5000
    end
    object IBStringField30: TIBStringField
      FieldName = 'GP_FULL'
      Origin = 'PRINT_STFAKT.GP_FULL'
      Size = 1000
    end
    object IBStringField31: TIBStringField
      FieldName = 'GP_ADR'
      Origin = 'PRINT_STFAKT.GP_ADR'
      Size = 1000
    end
    object IBStringField32: TIBStringField
      FieldName = 'GP_REKW'
      Origin = 'PRINT_STFAKT.GP_REKW'
      Size = 1000
    end
    object IBStringField33: TIBStringField
      FieldName = 'GP_TEL'
      Origin = 'PRINT_STFAKT.GP_TEL'
      Size = 1000
    end
    object IBStringField34: TIBStringField
      FieldName = 'POST_INN_KPP'
      Origin = 'PRINT_STFAKT.POST_INN_KPP'
      Size = 32
    end
    object IBStringField35: TIBStringField
      FieldName = 'KLN_INN_KPP'
      Origin = 'PRINT_STFAKT.KLN_INN_KPP'
      Size = 32
    end
  end
  object PrintSTFAKTSPN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from Print_STFAKTS_PN(:PN_ID, :is_rn)')
    Left = 366
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PN_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'is_rn'
        ParamType = ptUnknown
      end>
    object IntegerField4: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ID'
      ReadOnly = True
    end
    object IntegerField7: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object IBStringField36: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object IBStringField37: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object FloatField20: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_KOL'
      ReadOnly = True
    end
    object FloatField21: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
    end
    object FloatField22: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NDS'
      ReadOnly = True
    end
    object FloatField23: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM'
      ReadOnly = True
    end
    object FloatField24: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM_NDS'
      ReadOnly = True
    end
    object FloatField25: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_SUMM_ALL'
      ReadOnly = True
    end
    object IBStringField38: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ERR'
      ReadOnly = True
      Size = 1
    end
    object IBStringField39: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_TAM'
      ReadOnly = True
      Size = 254
    end
    object IBStringField40: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_LAND'
      ReadOnly = True
      Size = 254
    end
  end
  object DsStfaktsPN: TDataSource
    DataSet = PrintSTFAKTSPN
    Left = 352
    Top = 538
  end
  object PRINT_MH: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_mh(:doc_type, :doc_id,:print_form_type)')
    Left = 776
    Top = 260
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'doc_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'print_form_type'
        ParamType = ptUnknown
      end>
    object PRINT_MHFRM_1: TIBStringField
      FieldName = 'FRM_1'
      Origin = 'PRINT_MH.FRM_1'
      Size = 254
    end
    object PRINT_MHFRM_2: TIBStringField
      FieldName = 'FRM_2'
      Origin = 'PRINT_MH.FRM_2'
      Size = 254
    end
    object PRINT_MHSKL_NAME: TIBStringField
      FieldName = 'SKL_NAME'
      Origin = 'PRINT_MH.SKL_NAME'
      Size = 254
    end
    object PRINT_MHFRM_1_DIR: TIBStringField
      FieldName = 'FRM_1_DIR'
      Origin = 'PRINT_MH.FRM_1_DIR'
      Size = 254
    end
    object PRINT_MHDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
      Origin = 'PRINT_MH.DOC_DATE'
    end
    object PRINT_MHDOC_NUM: TIBStringField
      FieldName = 'DOC_NUM'
      Origin = 'PRINT_MH.DOC_NUM'
      Size = 32
    end
    object PRINT_MHDOC_ID: TIntegerField
      FieldName = 'DOC_ID'
    end
    object PRINT_MHBARCODE: TIBStringField
      FieldName = 'BARCODE'
      Origin = 'PRINT_MH.BARCODE'
      Size = 12
    end
    object PRINT_MHday_number: TStringField
      FieldName = 'day_number'
      Size = 32
    end
  end
  object PRINT_MH_S: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_mh_s(:doc_type, :doc_id)'
      ''
      'order by store_zone, ids')
    Left = 772
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'doc_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_id'
        ParamType = ptUnknown
      end>
    object PRINT_MH_STW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'PRINT_MH_S.TW_ART'
    end
    object PRINT_MH_STW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'PRINT_MH_S.TW_NAM'
      Size = 254
    end
    object PRINT_MH_SED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Origin = 'PRINT_MH_S.ED_SHORT'
      Size = 32
    end
    object PRINT_MH_STW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'PRINT_MH_S.TW_KOL'
    end
    object PRINT_MH_STW_STORE_PRICE: TFloatField
      FieldName = 'TW_STORE_PRICE'
      Origin = 'PRINT_MH_S.TW_STORE_PRICE'
    end
    object PRINT_MH_STW_SUMM: TFloatField
      FieldName = 'TW_SUMM'
      Origin = 'PRINT_MH_S.TW_SUMM'
    end
    object PRINT_MH_SSTORE_ZONE: TStringField
      FieldName = 'STORE_ZONE'
      Size = 1000
    end
    object PRINT_MH_SWEIGHT: TFloatField
      FieldName = 'WEIGHT'
      Origin = 'PRINT_MH_S.WEIGHT'
    end
    object PRINT_MH_SRAZ1_1: TFloatField
      FieldName = 'RAZ1_1'
      Origin = 'PRINT_MH_S.RAZ1_1'
    end
    object PRINT_MH_SRAZ1_2: TFloatField
      FieldName = 'RAZ1_2'
      Origin = 'PRINT_MH_S.RAZ1_2'
    end
    object PRINT_MH_SRAZ1_3: TFloatField
      FieldName = 'RAZ1_3'
      Origin = 'PRINT_MH_S.RAZ1_3'
    end
    object PRINT_MH_SRAZ2_1: TFloatField
      FieldName = 'RAZ2_1'
      Origin = 'PRINT_MH_S.RAZ2_1'
    end
    object PRINT_MH_SRAZ2_2: TFloatField
      FieldName = 'RAZ2_2'
      Origin = 'PRINT_MH_S.RAZ2_2'
    end
    object PRINT_MH_SRAZ2_3: TFloatField
      FieldName = 'RAZ2_3'
      Origin = 'PRINT_MH_S.RAZ2_3'
    end
    object PRINT_MH_SRAZ3_1: TFloatField
      FieldName = 'RAZ3_1'
      Origin = 'PRINT_MH_S.RAZ3_1'
    end
    object PRINT_MH_SRAZ3_2: TFloatField
      FieldName = 'RAZ3_2'
      Origin = 'PRINT_MH_S.RAZ3_2'
    end
    object PRINT_MH_SRAZ3_3: TFloatField
      FieldName = 'RAZ3_3'
      Origin = 'PRINT_MH_S.RAZ3_3'
    end
    object PRINT_MH_STW_UP_KOL: TFloatField
      FieldName = 'TW_UP_KOL'
      Origin = 'PRINT_MH_S.TW_UP_KOL'
    end
    object PRINT_MH_STW_PALL_KOL: TFloatField
      FieldName = 'TW_PALL_KOL'
      Origin = 'PRINT_MH_S.TW_PALL_KOL'
    end
    object PRINT_MH_STW_SROK: TIntegerField
      FieldName = 'TW_SROK'
      Origin = 'PRINT_MH_S.TW_SROK'
    end
    object PRINT_MH_STW_DATE_PROIZ: TIBStringField
      FieldName = 'TW_DATE_PROIZ'
      Origin = 'PRINT_MH_S.TW_DATE_PROIZ'
      Size = 32
    end
  end
  object PrintTransportNakl2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PrintTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from Print_TRANSPORT_NAKL2(:DOC_ID, :doc_type)')
    Left = 486
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DOC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_type'
        ParamType = ptUnknown
      end>
    object PrintTransportNakl2DOC_NUMBER: TIBStringField
      FieldName = 'DOC_NUMBER'
      Origin = 'PRINT_TRANSPORT_NAKL2.DOC_NUMBER'
      Size = 254
    end
    object PrintTransportNakl2DOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
      Origin = 'PRINT_TRANSPORT_NAKL2.DOC_DATE'
    end
    object PrintTransportNakl2KLN_NAME: TIBStringField
      FieldName = 'KLN_NAME'
      Origin = 'PRINT_TRANSPORT_NAKL2.KLN_NAME'
      Size = 254
    end
    object PrintTransportNakl2KLN_ADDRESS: TIBStringField
      FieldName = 'KLN_ADDRESS'
      Origin = 'PRINT_TRANSPORT_NAKL2.KLN_ADDRESS'
      Size = 254
    end
    object PrintTransportNakl2KLN_SKL_ADDRESS: TIBStringField
      FieldName = 'KLN_SKL_ADDRESS'
      Origin = 'PRINT_TRANSPORT_NAKL2.KLN_SKL_ADDRESS'
      Size = 254
    end
    object PrintTransportNakl2FRM_NAME: TIBStringField
      FieldName = 'FRM_NAME'
      Origin = 'PRINT_TRANSPORT_NAKL2.FRM_NAME'
      Size = 254
    end
    object PrintTransportNakl2FRM_ADDRESS: TIBStringField
      FieldName = 'FRM_ADDRESS'
      Origin = 'PRINT_TRANSPORT_NAKL2.FRM_ADDRESS'
      Size = 254
    end
    object PrintTransportNakl2FRM_SKL_ADDRESS: TIBStringField
      FieldName = 'FRM_SKL_ADDRESS'
      Origin = 'PRINT_TRANSPORT_NAKL2.FRM_SKL_ADDRESS'
      Size = 254
    end
    object PrintTransportNakl2TW_WEIGHT: TFloatField
      FieldName = 'TW_WEIGHT'
      Origin = 'PRINT_TRANSPORT_NAKL2.TW_WEIGHT'
    end
    object PrintTransportNakl2TW_NAMES: TIBStringField
      FieldName = 'TW_NAMES'
      Origin = 'PRINT_TRANSPORT_NAKL2.TW_NAMES'
      Size = 10000
    end
  end
  object DsTransportNakl2: TDataSource
    DataSet = PrintTransportNakl2
    Left = 440
    Top = 536
  end
end
