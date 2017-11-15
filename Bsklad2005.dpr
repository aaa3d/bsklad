program Bsklad2005;
{ ********************************************************************
  **** Copyright 1980-1999 Britvin Sergej,                        ****
  **** Beginner(C), Yaroslavl, Russia,                            ****
  **** E-mail:  Beginner@inbox.ru                                 ****
  ****------------------------------------------------------------****
  ****  Модуль проекта программы BSKLAD                           ****
  ********************************************************************}



uses
  LFHeapMemory,
  Forms,
  SpeedBar,
  SysUtils,
  VclUtils,
  Menus,
  RxMemDS,
  Messages,
  Mainform in 'Mainform.pas' {MAIN_FORM},
  DicValuta in 'DicValuta.pas' {DIC_VALUTA},
  Data1 in 'Data1.pas' {DataModule1: TDataModule},
  PrepareForm in 'PrepareForm.pas' {Prepare_form},
  B_utils in 'B_utils.pas',
  EditValuta in 'EditValuta.pas' {EDIT_VALUTA},
  B_DButils in 'B_DButils.pas',
  UsWorkForm in 'UsWorkForm.pas' {UsWork_FORM},
  DicTowar in 'DicTowar.pas' {DIC_TOWAR},
  KursPN in 'KursPN.pas' {Kurs_PN},
  EditTw in 'EditTw.pas' {Edit_TW},
  EditKontakt in 'EditKontakt.pas' {Edit_Kontakt},
  DicKlient in 'DicKlient.pas' {Dic_Klient},
  DefaultJournal in 'DEFAULTJOURNAL.pas' {Default_Journal},
  JouZonePer in 'JouZonePer.pas' {Jou_ZAY_INTERNAL_SALE},
  DicEmail in 'DicEmail.pas' {Dic_Email},
  MoveTree in 'MoveTree.pas' {Move_tree},
  DicSklad in 'DicSklad.pas' {DIC_SKLAD},
  EditSklad in 'EditSklad.pas' {Edit_sklad},
  DicShop in 'DicShop.pas' {Dic_shop},
  EditShop in 'EditShop.pas' {Edit_Shop},
  JouGARANT in 'JouGARANT.pas' {Jou_GARANT},
  DateInterval in 'DateInterval.pas' {Date_Interval},
  JouRn in 'JouRn.pas' {Jou_RN},
  DocRn in 'DocRn.pas' {Doc_RN},
  EditKlnTree in 'EditKLNTree.pas' {Edit_KLNTREE},
  FindTowar123 in 'FindTowar123.pas' {Find_Towar_123},
  FindKontakt in 'FindKontakt.pas' {Find_Kontakt},
  DetalTW in 'DetalTW.pas' {Detal_TW},
  DicTWKTG in 'DicTWKTG.pas' {DIC_TWKTG},
  DICPNTYP in 'DICPNTYP.pas' {DIC_PNTYP},
  DICSPISVID in 'DICSPISVID.pas' {DIC_SPISVID},
  DICPNVID in 'DICPNVID.pas' {DIC_PNVID},
  DICZONE in 'DICZONE.pas' {DIC_ZONE},
  DICRNTYP in 'DICRNTYP.pas' {DIC_RNTYP},
  JouRemont in 'JouRemont.pas' {JOU_REMONT},
  EditRemont in 'EditRemont.pas' {Edit_REMONT},
  ANALIZTW in 'ANALIZTW.pas' {ANALIZ_TW},
  DetalKLN in 'DetalKLN.pas' {Detal_KLN},
  FindTowarAbc in 'FindTowarAbc.pas' {Find_Towar_Abc},
  AllPrint in 'AllPrint.pas' {All_Print},
  SetPnPrint in 'SetPnPrint.pas' {Set_PNPRINT},
  SetSubDoc in 'SetSubDoc.pas' {Set_SUBDOC},
  FindDocNum in 'FindDocNum.pas' {FIND_DOCNUM},
  SetJouDate in 'SetJouDate.pas' {Set_JouDate},
  AdminStFakt in 'AdminStFakt.pas' {Admin_STFAKT},
  AnalizSPIS in 'AnalizSPIS.pas' {Analiz_SPIS},
  MarketingTW in 'MarketingTW.pas' {Marketing_TW},
  SetKolvo in 'SetKolvo.pas' {Set_KOLVO},
  JouSTFAKT in 'JouSTFAKT.pas' {Jou_STFAKT},
  SetSkid in 'SetSkid.pas' {Set_Skid},
  SelectNew in 'SelectNew.pas' {Select_NEW},
  SetMain in 'SetMain.pas' {Set_Main},
  DocSpis in 'DocSpis.pas' {Doc_SPIS},
  AnalizPN in 'AnalizPN.pas' {Analiz_PN},
  AdminPn in 'AdminPn.pas' {Admin_PN},
  AnalizRN in 'AnalizRN.pas' {Analiz_RN},
  JouPsort in 'JouPsort.pas' {Jou_PSORT},
  JouPN in 'JouPN.pas' {Jou_PN},
  DocRemon in 'DocRemon.pas' {Doc_Remon},
  DocZonePer in 'DocZonePer.pas' {Doc_ZONE_PER},
  DocEmail in 'DocEmail.pas' {Doc_Email},
  KursMoney in 'KursMoney.pas' {Kurs_Money},
  SetKurs in 'SetKurs.pas' {SET_KURS},
  JouCard in 'JouCard.pas' {Jou_CARD},
  EditCard in 'EditCard.pas' {Edit_CARD},
  JouST in 'JouST.pas' {Jou_ST},
  DataPrint in 'DataPrint.pas' {DataModule2: TDataModule},
  EditGarant in 'EditGarant.pas' {Edit_Garant},
  AllPol in 'AllPol.pas' {ALL_POL},
  AllOtgruz in 'AllOtgruz.pas' {ALL_OTGRUZ},
  ReportNePol in 'ReportNePol.pas' {REPORT_NEPOL},
  ReportNeotgruz in 'ReportNeotgruz.pas' {REPORT_NEOTGRUZ},
  EditMarket in 'EditMarket.pas' {EDIT_MARKET},
  ReportMarketKonk in 'ReportMarketKonk.pas' {REPORT_MARKETKONK},
  ReportMarketOld in 'ReportMarketOld.pas' {REPORT_MARKETOLD},
  ReportCard in 'ReportCard.pas' {Report_card},
  ReportPOST in 'ReportPOST.pas' {Report_POST},
  SelectValuta in 'SelectValuta.pas' {Select_VALUTA},
  EditPnTyp in 'EditPnTyp.pas' {Edit_Pntyp},
  EditSpisVid in 'EditSpisVid.pas' {Edit_SpisVid},
  EditRnTyp in 'EditRnTyp.pas' {Edit_Rntyp},
  Editzone1 in 'Editzone1.pas' {Edit_zone1},
  EditPnVid in 'EditPnVid.pas' {Edit_PnVid},
  HistoryKursRN in 'HistoryKursRN.pas' {History_Kurs_RN},
  KursRN in 'KursRN.pas' {Kurs_RN},
  StfaktError in 'StfaktError.pas' {StFakt_Error},
  JouRemon in 'JouRemon.pas' {Jou_REMON},
  EditTWKTG in 'EditTWKTG.pas' {Edit_TWKTG},
  EditUsgroup in 'EditUsgroup.pas' {Edit_USGROUP},
  DicDost in 'DicDost.pas' {DIC_DOST},
  SetPeriod in 'SetPeriod.pas' {SET_PERIOD},
  EditPeriod in 'EditPeriod.pas' {Edit_PERIOD},
  ReportSKID in 'ReportSKID.pas' {REPORT_SKID},
  CalcPnOst in 'CalcPnOst.pas' {Calc_PNOST},
  AboutForm in 'AboutForm.pas' {About_Form},
  DataQr in 'DataQr.pas' {DataModule3: TDataModule},
  PolPer in 'PolPer.pas' {POL_PER},
  OtgrSpis in 'OtgrSpis.pas' {OTGR_SPIS},
  PolPn in 'PolPn.pas' {POL_PN},
  OtgrPer in 'OtgrPer.pas' {OTGR_PER},
  OtgrRn in 'OtgrRn.pas' {OTGR_RN},
  ReportMinOst in 'ReportMinOst.pas' {Report_Min_OSt},
  AdminRn in 'AdminRn.pas' {Admin_RN},
  AdminPer in 'AdminPer.pas' {Admin_PER},
  AdminPsort in 'AdminPsort.pas' {Admin_PSORT},
  DefaultShopPn in 'DefaultShopPn.pas' {DEFAULT_SHOPPN},
  EditDefaultShopPN in 'EditDefaultShopPN.pas' {EDIT_DEFAULT_SHOPPN},
  KKMINFO in 'KKMINFO.pas' {KKM_INFO},
  ReportMinResult in 'ReportMinResult.pas' {Report_Min_result},
  MailNewMoney in 'MailNewMoney.pas' {MAIL_NEW_MONEY},
  EditMailsMon in 'EditMailsMon.pas' {Edit_Mails_mon},
  ToolZoneDistribute in 'ToolZoneDistribute.pas' {tool_zone_distribute},
  SetNewTW in 'SetNewTW.pas' {Set_NEW_TW},
  HistoryKursMoney in 'HistoryKursMoney.pas' {History_KursMoney},
  FormLock in 'FormLock.pas' {FORM_LOCK},
  SizeCennik in 'SizeCennik.pas' {SIZE_CENNIK},
  DocKKM in 'DocKKM.pas' {Doc_KKM},
  MailSubdoc in 'MailSubdoc.pas' {MAIL_SUBDOC},
  SelectPrintRemon in 'SelectPrintRemon.pas' {Select_Print_Remon},
  WaitForm in 'WaitForm.pas' {Wait_Form},
  DetalReal in 'DetalReal.pas' {Detal_real},
  AdminRemon in 'AdminRemon.pas' {Admin_REMON},
  AdminOplata in 'AdminOplata.pas' {Admin_OPLATA},
  StfaktFast in 'StfaktFast.pas' {Stfakt_FAST},
  PrintDoc in 'PrintDoc.pas' {Print_DOC},
  PersTorg in 'PersTorg.pas' {Pers_TORG},
  FormDebug in 'FormDebug.pas' {FORM_DEBUG},
  SetDostup in 'SetDostup.pas' {SET_DOSTUP},
  ReportPribylNew in 'ReportPribylNew.pas' {REPORT_PRIBYL_NEW},
  PersPribyl2 in 'PersPribyl2.pas' {PERS_PRIBYL2},
  ChangePassword in 'ChangePassword.pas' {CHANGE_PASSWORD},
  TestBase in 'TestBase.pas' {TEST_BASE},
  KKMEdit in 'KKMEdit.pas' {KKM_EDIT},
  DefaultShop in 'DefaultShop.pas' {DEFAULT_SHOP},
  EditDefaultShop in 'EditDefaultShop.pas' {EDIT_DEFAULT_SHOP},
  KKMADD in 'kkmadd.pas' {KKM_ADD},
  PrintKKM in 'PrintKKM.pas' {PRINT_KKM},
  KKMSUB in 'kkmsub.pas' {KKM_SUB},
  KkmStat in 'KkmStat.pas' {KKM_STAT},
  SetPocketNum in 'SetPocketNum.pas' {SET_POCKET_NUM},
  SetData in 'SetData.pas' {Set_DATA},
  FindDeleteDoc in 'FindDeleteDoc.pas' {FIND_DELETE_DOC},
  AdminTw in 'AdminTw.pas' {Admin_TW},
  LastDial in 'LastDial.pas' {LAST_DIAL},
  ReportOstNew in 'ReportOstNew.pas' {REPORT_OST_NEW},
  ReportInn in 'ReportInn.pas' {REPORT_INN},
  ReportMoney in 'ReportMoney.pas' {REPORT_MONEY},
  SetLoadReport in 'SetLoadReport.pas' {SET_LOAD_REPORT},
  AdminSt in 'AdminSt.pas' {Admin_ST},
  CardSkidCoupon in 'CardSkidCoupon.pas' {CARD_SKID_COUPON},
  EditCardNum in 'EditCardNum.pas' {EDIT_CARDNUM},
  CardSumm in 'CardSumm.pas' {CARD_SUMM},
  EditCardSkidCoupon in 'EditCardSkidCoupon.pas' {EDIT_CARDSKID_COUPON},
  KlnMerge in 'KlnMerge.pas' {KLN_MERGE},
  ReportMergeMail in 'ReportMergeMail.pas' {REPORT_MERGE_MAIL},
  ReportTwChange in 'ReportTwChange.pas' {REPORT_TW_CHANGE},
  HistoryPeriod in 'HistoryPeriod.pas' {History_Period},
  SelectReportShop in 'SelectReportShop.pas' {SELECT_REPORT_SHOP},
  MyForm in 'MyForm.pas' {My_FORM},
  ReportOstNul in 'ReportOstNul.pas' {REPORT_OST_NUL},
  MakeRemonTwMon in 'MakeRemonTwMon.pas' {MAKE_REMON_TWMON},
  DelOtgSPis in 'DelOtgSPis.pas' {DEL_OTG_SPIS},
  SelectBase in 'SelectBase.pas' {Select_BASE},
  EditKomplekt in 'EditKomplekt.pas' {EDIT_KOMPLEKT},
  EditTwShopMon in 'EditTwShopMon.pas' {EDIT_TWSHOPMON},
  EditEdk in 'EditEdk.pas' {EDIT_EDK},
  PrintPrice in 'PrintPrice.pas' {PRINT_PRICE},
  LinkNotable in 'LinkNotable.pas' {LINK_NOTABLE},
  EditLinkNotable in 'EditLinkNotable.pas' {EDIT_LINKNOTABLE},
  LinkNofield in 'LinkNofield.pas' {LINK_NOFIELD},
  EditLinkNoField in 'EditLinkNoField.pas' {EDIT_LINKNOFIELD},
  EditTwSkladMon in 'EditTwSkladMon.pas' {EDIT_TWSKLADMON},
  CopyProp in 'CopyProp.pas' {COPY_PROP},
  dicKTG in 'dicKTG.pas' {DIC_KTG},
  EditPropTWKTGTREE in 'EditPropTWKTGTREE.pas' {EDIT_PROPTWKTGTREE},
  EditPropTWKTG in 'EditPropTWKTG.pas' {EDIT_PROPTWKTG},
  Elves_Unit in 'Elves_Unit.pas',
  DocPN2 in 'DocPN2.pas' {DOC_PN2},
  EditNakl in 'EditNakl.pas' {Edit_Nakl},
  DicUsl in 'DicUsl.pas' {DIC_USL},
  EditUsl in 'EditUsl.pas' {Edit_USL},
  PnNaklDoc in 'PnNaklDoc.pas' {PN_NAKL_DOC},
  UtwMail in 'UtwMail.pas' {UTW_MAIL},
  Exp1C in 'Exp1C.pas' {EXP_1C},
  SetExport1C in 'SetExport1C.pas' {SET_EXPORT_1C},
  Exp1CReports in 'Exp1CReports.pas' {EXP_1C_REPORTS},
  DocPnWozw in 'DocPnWozw.pas' {DOC_PN_WOZW},
  SelectWozw in 'SelectWozw.pas' {Select_WOZW},
  SelectPrint in 'SelectPrint.pas' {Select_Print},
  DocRnWozw in 'DocRnWozw.pas' {DOC_RN_WOZW},
  AnalizPnNew in 'AnalizPnNew.pas' {ANALIZ_PN_NEW},
  Unit_AMC100F in 'Unit_AMC100F.pas',
  Unit_AMC200F in 'Unit_AMC200F.pas',
  DocPsort in 'DocPsort.pas' {DOC_PSORT},
  JouSpis in 'JouSpis.pas' {Jou_SPIS},
  AdminSpis in 'AdminSpis.pas' {Admin_SPIS},
  ReportPribylNewCase in 'ReportPribylNewCase.pas' {Report_pribyl_new_case},
  ReportPribylNewError in 'ReportPribylNewError.pas' {REPORT_PRIBYL_NEW_ERROR},
  ReportKorr in 'ReportKorr.pas' {REPORT_KORR},
  ZpStat in 'ZpStat.pas' {ZP_STAT},
  SetMinOst in 'SetMinOst.pas' {SET_MIN_OST},
  EditOtdel in 'EditOtdel.pas' {EDIT_OTDEL},
  KlnToOtdel in 'KlnToOtdel.pas' {KLN_TO_OTDEL},
  JouZP in 'JouZP.pas' {JOU_ZP},
  EditZp in 'EditZp.pas' {EDIT_ZP},
  ZpRlUser in 'ZpRlUser.pas' {ZP_RL_USER},
  EditZpRulez in 'EditZpRulez.pas' {Edit_Zp_Rulez},
  ZpRun in 'ZpRun.pas' {ZP_RUN},
  ZpRunProgress in 'ZpRunProgress.pas' {ZP_RUN_PROGRESS},
  ZpTabel in 'ZpTabel.pas' {Zp_Tabel},
  CardReg in 'CardReg.pas' {CARD_REG},
  EditCardReg in 'EditCardReg.pas' {EDIT_CARD_REG},
  EditDol in 'EditDol.pas' {EDIT_DOL},
  ReportCardOneShop in 'ReportCardOneShop.pas' {REPORT_CARD_ONE_SHOP},
  ReportNacItogShop in 'ReportNacItogShop.pas' {REPORT_NAC_ITOG_SHOP},
  RefreshRe in 'RefreshRe.pas' {REFRESH_RE},
  ReportItogMoveDetal in 'ReportItogMoveDetal.pas' {REPORT_ITOG_MOVE_DETAL},
  ReportNacTabel in 'ReportNacTabel.pas' {REPORT_NAC_TABEL},
  ReportStat in 'ReportStat.pas' {REPORT_STAT},
  ReportNalogAll in 'ReportNalogAll.pas' {REPORT_NALOG_ALL},
  BarCodeSetTW in 'BarCodeSetTW.pas' {BAR_CODE_SET_TW},
  ZpWizard in 'ZpWizard.pas' {ZP_WIZARD},
  ZpPlusVid in 'ZpPlusVid.pas' {ZP_PLUS_VID},
  ZpPlusSposob in 'ZpPlusSposob.pas' {ZP_PLUS_SPOSOB},
  ZpTitle in 'ZpTitle.pas' {ZP_TITLE},
  DicShopSkl in 'DicShopSkl.pas' {DIC_SHOPSKL},
  WhatsNew in 'WhatsNew.pas' {Whats_NEW},
  EditRvid in 'EditRvid.pas' {EDIT_RVID},
  ReportTDMItogShopDetalNew in 'ReportTDMItogShopDetalNew.pas' {REPORT_TDM_ITOG_SHOP_DETAL_NEW},
  ReportTDMItogShopAvg in 'ReportTDMItogShopAvg.pas' {REPORT_TDM_ITOG_SHOP_AVG},
  MakeRemon in 'MakeRemon.pas' {MAKE_REMON},
  ReportTdmDetalAvg in 'ReportTdmDetalAvg.pas' {REPORT_TDM_DETAL_AVG},
  HistoryDoc in 'HistoryDoc.pas' {HISTORY_DOC},
  DocPoWozw in 'DocPoWozw.pas' {DOC_PO_WOZW},
  JouKKM in 'JouKKM.pas' {JOU_KKM},
  DocPo in 'DocPo.pas' {DOC_PO},
  SetKorr in 'SetKorr.pas' {SET_KORR},
  SetOstSt in 'SetOstSt.pas' {Set_Ost_St},
  EditSetOstSt in 'EditSetOstSt.pas' {Edit_SET_OST_ST},
  RnShowPo in 'RnShowPo.pas' {RN_SHOW_PO},
  DelOtgRn in 'DelOtgRn.pas' {DEL_OTG_RN},
  AddReport in 'AddReport.pas' {ADD_REPORT},
  ReportNacSpecZp in 'ReportNacSpecZp.pas' {Report_nac_spec_zp},
  ReportStFakt in 'ReportStFakt.pas' {REPORT_STFAKT},
  DocZRemon in 'DocZRemon.pas' {DOC_ZREMON},
  DicKKM in 'DicKKM.pas' {DIC_KKM},
  EditKKM in 'EditKKM.pas' {EDIT_KKM},
  EditStFakt in 'EditStFakt.pas' {Edit_STFAKT},
  ListConstant in 'ListConstant.pas' {LIST_CONSTANT},
  ClosePeriodDir in 'ClosePeriodDir.pas' {CLOSE_PERIOD_DIR},
  JouZREMON in 'JouZREMON.pas' {JOU_ZREMON},
  JouZTRINDEF in 'JouZTRINDEF.pas' {JOU_ZTRINDEF},
  DicNP in 'DicNP.pas' {DIC_NP},
  EditNP in 'EditNP.pas' {EDIT_NP},
  DicNDS in 'DicNDS.pas' {DIC_NDS},
  EditNds in 'EditNDS.pas' {EDIT_NDS},
  ChangeDate in 'ChangeDate.pas' {CHANGE_DATE},
  FilterCards in 'FilterCards.pas' {FFilter},
  CARDRegister in 'CARDRegister.pas' {FRegister},
  CardDelivery in 'CardDelivery.pas' {FCardDelivery},
  ReportCardsToExcel in 'ReportCardsToExcel.pas',
  ReportCardInfoToExcel in 'ReportCardInfoToExcel.pas',
  DocSpisWozw in 'DocSpisWozw.pas' {DOC_SPIS_WOZW},
  FRStatus in 'FRStatus.pas' {FR_STATUS},
  EditZone in 'EditZone.pas' {EDIT_ZONE},
  FR_Shtrih in 'FR_Shtrih.pas' {FRShtrih},
  TWShowOst in 'TWShowOst.pas' {TW_SHOW_OST},
  Import_1C in 'Import_1C.pas' {IMP_1C},
  KlnWarn in 'KlnWarn.pas' {KLN_WARN},
  JouSale in 'JouSale.pas' {JOU_SALE},
  CalcRNPNOSNMoney in 'CalcRNPNOSNMoney.pas' {CalcRNPN_OSN_Money},
  sqladmin in 'sqladmin.pas' {sql_admin},
  ReportRemainingGoods in 'ReportRemainingGoods.pas',
  TwShowOstPrih in 'TwShowOstPrih.pas' {TW_SHOW_OST_PRIH},
  DicRvid in 'DicRvid.pas' {DIC_RVID},
  EditTwTree in 'EditTwTree.pas' {Edit_TWTREE},
  ReportTdmDetal in 'ReportTdmDetal.pas' {REPORT_TDM_DETAL},
  ReportTDMItog in 'ReportTDMItog.pas' {REPORT_TDM_ITOG},
  ReportTDMItogShop in 'ReportTDMItogShop.pas' {REPORT_TDM_ITOG_SHOP},
  ReportTDMItogShopDetal in 'ReportTDMItogShopDetal.pas' {REPORT_TDM_ITOG_SHOP_DETAL},
  ReportTDMItogPostNew in 'ReportTDMItogPostNew.pas' {REPORT_TDM_ITOG_POST_NEW},
  ReportTDMItogShopNew in 'ReportTDMItogShopNew.pas' {REPORT_TDM_ITOG_SHOP_NEW},
  EditMoneyDopusk in 'EditMoneyDopusk.pas' {EDIT_MONEY_DOPUSK},
  DocZTrindef in 'DocZTrindef.pas' {DOC_ZTRINDEF},
  DicTwDynGroup in 'DicTwDynGroup.pas' {DIC_TW_DYN_GROUP},
  DicKlientDynGroup in 'DicKlientDynGroup.pas' {DIC_Klient_DYN_GROUP},
  ReportPostFin in 'ReportPostFin.pas' {Report_Post_fin},
  reportcardprod in 'reportcardprod.pas' {report_card_prod},
  KkmWait in 'KkmWait.pas' {KKM_WAIT},
  BarScanerEdit in 'BarScanerEdit.pas' {BAR_SCANER_EDIT},
  DocSale in 'DocSale.pas' {DOC_SALE},
  ExpCas in 'ExpCas.pas' {EXP_CAS},
  MakeComplexRN in 'MakeComplexRN.pas' {MAKE_COMPLEX_RN},
  ReportNacItog in 'ReportNacItog.pas' {REPORT_NAC_ITOG},
  InternetTwData in 'InternetTwData.pas' {INTERNET_TW_DATA},
  ReportPostFinFirm in 'ReportPostFinFirm.pas' {Report_Post_fin_firm},
  EditText in 'EditText.pas' {EDIT_TEXT},
  MakeTwrealToKln in 'MakeTwrealToKln.pas' {MAKE_TW_REAL_TO_KLN},
  ReportTDMItogNew in 'ReportTDMItogNew.pas' {REPORT_TDM_ITOG_NEW},
  MakeTwWozwToPost in 'MakeTwWozwToPost.pas' {MAKE_TW_WOZW_TO_POST},
  JouPO in 'JouPO.pas' {JOU_PO},
  DocSt in 'DocST.pas' {Doc_St},
  RepPN in 'RepPN.pas' {REP_PN},
  DocRemind in 'DocRemind.pas' {DOC_REMIND},
  ListRemind in 'ListRemind.pas' {LIST_REMIND},
  TextEditDialog in 'TextEditDialog.pas' {TEXT_EDIT_DIALOG},
  ReportTdmDetalNew in 'ReportTdmDetalNew.pas' {REPORT_TDM_DETAL_NEW},
  ReportNacSpec in 'ReportNacSpec.pas' {Report_nac_spec},
  dicZpUsers in 'dicZpUsers.pas' {DIC_ZP_USERS},
  EditZpUser in 'EditZpUser.pas' {EDIT_ZP_USER},
  ListDoc_Informer in 'ListDoc_Informer.pas' {LIST_DOC_INFORMER},
  ReportSkladWork in 'ReportSkladWork.pas' {REPORT_SKLAD_WORK},
  ReportSkladWorkPalet in 'ReportSkladWorkPalet.pas' {REPORT_SKLAD_WORK_PALETT},
  DicKlnWorktype in 'DicKlnWorktype.pas' {DIC_KLN_WORKTYPE},
  report_prodag in 'report_prodag.pas' {report_prod},
  DocPer in 'DocPer.pas' {Doc_PER},
  JouPer in 'JouPer.pas' {Jou_PER},
  EditRnVid in 'EditRnVid.pas' {Edit_RnVid},
  DICRNVID in 'DICRNVID.pas' {DIC_RNVID},
  ReportZoneOst in 'ReportZoneOst.pas' {REPORT_ZONE_OST},
  SelectShop in 'SelectShop.pas' {Select_Shop},
  SelectZone in 'SelectZone.pas' {Select_zone},
  ReportCardInfo in 'ReportCardInfo.pas' {report_card_info},
  EditTwSkladParams in 'EditTwSkladParams.pas' {edit_tw_sklad_params},
  setSkladManager in 'setSkladManager.pas' {set_sklad_manager},
  formDostavka in 'formDostavka.pas' {form_Dostavka},
  CardSkid in 'CardSkid.pas' {CARD_SKID},
  EditCardSkid in 'EditCardSkid.pas' {EDIT_CARDSKID};

{$R *.RES}




var
   EmailExportCnt:integer;
   Cnt_base:integer;
   Err_read:boolean;
   a:integer;
   r:double;
   Main_path:ansistring;
   N_BASE:integer;
   s,s2,s3,s4,s5:ansistring;
   Met_brake:boolean;
   Met_brake2,Met_brake3:boolean;
   CONN:boolean=False;

begin
  try

  Application.Initialize;
  Application.HelpFile := '';
  Application.Title := 'Арм Склад';

  Err_read:=False;
  base_path:='';
  GET_DEFAULT_LAST_TIME:= 0;

  IsRefreshRe:=False;
  IsPnOst:=False;
  IsEmailExport:=False;

  global_NoFindKKM:=False;
  if ParamCount>0 then begin
    for a:=1 to ParamCount do begin
      if (trim(ansiuppercase(paramstr(a)))='-EMAIL') then begin
        IsEmailExport:=true;
        EmailExportCnt:=strtoint(trim(ansiuppercase(paramstr(1))));
      end;
      if (trim(ansiuppercase(paramstr(a)))='-REFRESHRE') then begin
          IsRefreshRe:=true;
          EmailExportCnt:=strtoint(trim(ansiuppercase(paramstr(1))));
      end;
      if (trim(ansiuppercase(paramstr(a)))='-PNOST') then begin
          IsPnOst:=true;
          EmailExportCnt:=strtoint(trim(ansiuppercase(paramstr(1))));
      end;
      if (left(trim(ansiuppercase(paramstr(a))),8)='-SHOPID=') then begin
          MANUAL_SHOPID:=strtoint( copy( trim(paramstr(a)), 9, length(paramstr(a)) - 8));
      end;

      if (left(trim(ansiuppercase(paramstr(a))),10)='-NOFINDKKM') then begin
          global_NoFindKKM:=true;
      end;



    end;
  end;
  try
      assignfile(input,'bsklad2005.set');
      reset(input);
      Cnt_base:=0;
      while not eof(input) do begin
         readln(input,s);
         s:=trim(s);
         s2:='';
         s3:='';
         s4:='';
         s5:='';
         Met_brake:=False;
         Met_brake2:=False;
         Met_brake3:=False;
         for a:=1 to length(s) do if s[a]=';' then begin
            if (not Met_brake) and (not Met_brake2) and (not Met_brake3) then Met_Brake:=true else
            if (Met_brake) and (not Met_brake2) and (not Met_brake3) then Met_Brake2:=true else
            if (Met_brake) and (Met_brake2) and (not Met_brake3) then Met_Brake3:=true;
         end else begin
            if (Not Met_brake) and (Not Met_brake2) and (Not Met_brake3) then s2:=s2+s[a];
            if (Met_brake) and (Not Met_brake2) and (Not Met_brake3) then s3:=s3+s[a];
            if (Met_brake) and (Met_brake2) and (Not Met_brake3) then s4:=s4+s[a];
            if (Met_brake) and (Met_brake2) and (Met_brake3) then s5:=s5+s[a];
         end;
         inc(Cnt_base);
         base_paths[cnt_base]:=s2;
         if S3='' then base_name[cnt_base]:=s2 else base_name[cnt_base]:=s3;
         base_ico[cnt_base]:=s4;
         if s5='' then s5:='LOGO.BMP';
         base_logo[cnt_base]:=s5;


      end;
      closefile(input);
      if Cnt_base=0 then Messbox('Список баз данных пуст!',MessError,16);
      if Cnt_base=1 then N_BASE:=1
      else begin
        if IsEmailExport or IsPnOst or IsRefreshRe then
           // Режим работы через коммандную строку - база выбирается автоматически!
           N_BASE:=EmailExportCnt
        else begin
          Application.CreateForm(TSelect_BASE, Select_BASE);
  Application.CreateForm(Treport_card_info, report_card_info);
  Application.CreateForm(Tedit_tw_sklad_params, edit_tw_sklad_params);
  Application.CreateForm(Tset_sklad_manager, set_sklad_manager);
  Select_Base.Combobox1.items.clear;
          for a:=1 to cnt_base do Select_Base.Combobox1.items.add(base_name[a]);
          Select_Base.Combobox1.itemindex:=0;
          Select_Base.showModal;
          N_BASE:=-1;
          if Select_Base.tag=2 then N_BASE:=Select_Base.Combobox1.itemindex+1;
          Select_Base.Destroy;
        end;
      end;
      if N_BASE>0 then begin
        BASE_NAME_GLOBAL:=base_name[N_BASE];
        base_path:=base_paths[N_BASE];
        if base_ico[N_BASE]<>'' then begin
            try
            Application.Icon.LoadFromFile(base_ico[N_BASE]);
            except
            end;
        end;
        LOGO_NAME:=base_logo[N_BASE];
        MP_NAME:='MP.bmp';
      end;
  Except
     on E : Exception do
     begin
//       Messbox('Exception class name = '+E.ClassName,MessSystem,16);
       Messbox('Ошибка при чтении файла конфигурации BSKLAD2009 !'+E.ClassName+ E.Message,MessSystem,16);
           Err_read:=true;
     end;
//    Messbox('Ошибка при чтении файла конфигурации системы BSKLAD!',MessSystem,16);

  End;
  if base_path<>'' then
  begin

//    Application.CreateForm(TDIC_RVID, DIC_RVID);
//    Application.CreateForm(TTW_SHOW_OST_PRIH, TW_SHOW_OST_PRIH);

  Application.CreateForm(TPrepare_form, Prepare_form);
  Application.CreateForm(TWait_Form, Wait_Form);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TDataModule3, DataModule3);





  Application.CreateForm(TDIC_TOWAR, DIC_TOWAR);
  Application.CreateForm(TFind_Towar_123, Find_Towar_123);
   Application.CreateForm(TFind_Towar_Abc, Find_Towar_Abc);
//  Application.CreateForm(TKKM_WAIT, KKM_WAIT);
//  Application.CreateForm(TSelect_BASE, Select_BASE);

//  Application.CreateForm(TFind_Kontakt, Find_Kontakt);

  Application.CreateForm(TStfakt_FAST, Stfakt_FAST);
  Application.CreateForm(TEdit_STFAKT, Edit_STFAKT);
//  Application.CreateForm(TDOC_SPIS_WOZW, DOC_SPIS_WOZW);
//  Application.CreateForm(TTW_SHOW_OST, TW_SHOW_OST);
//  Application.CreateForm(TIMP_1C, IMP_1C);
//  Application.CreateForm(TKLN_WARN, KLN_WARN);
//  Application.CreateForm(TCalcRNPN_OSN_Money, CalcRNPN_OSN_Money);
  Application.CreateForm(TMAIN_FORM, MAIN_FORM);

  Application.createForm(TPrint_DOC,PRINT_DOC);



  begin
    try
      if Err_read then r:=sqrt(-1);
      DataModule1.IBDatabase1.Connected:=False;
      DataModule1.IBDatabase2.Connected:=False;
      DataModule1.IBDatabase1.DatabaseName:=BASE_PATH;
      DataModule1.IBDatabase1.Connected:=True;
      // Включаем вторую базу
      DataModule1.IBDatabase2.DatabaseName:=BASE_PATH+'.log';
//      DataModule1.IBDatabase2.Connected:=True;
      CONN:=True;
    except
      Messbox('Ошибка при подключении к базе данных BSKLAD! Проверьте конфигурацию!',MessSystem,16);
    end;
    if CONN then begin



//      Application.CreateForm(TDIC_TOWAR, DIC_TOWAR);
//      Application.CreateForm(TDic_Klient, Dic_Klient);
      Prepare_Form.Show;
//      Application.CreateForm(TDIC_VALUTA, DIC_VALUTA);
      Datamodule1.QueryPrepare.Close;
      Datamodule1.QueryPrepare.SQL.clear;
      Datamodule1.QueryPrepare.SQL.add('select CFG_VALUE from CFG WHERE CFG_NAME="MARKET_PERIOD"');
      Datamodule1.QueryPrepare.Open;
      MARKET_PERIOD:=Datamodule1.QueryPrepare.fieldByname('CFG_VALUE').asinteger;
      Datamodule1.QueryPrepare.Close;
      Datamodule1.QueryPrepare.SQL.clear;
      Datamodule1.QueryPrepare.SQL.add('select CFG_VALUE from CFG WHERE CFG_NAME="TIME_GET_DISCONT"');
      Datamodule1.QueryPrepare.Open;
      TIME_GET_DISCONT:=Datamodule1.QueryPrepare.fieldByname('CFG_VALUE').asinteger;

      Datamodule1.QueryPrepare.Close;
      Datamodule1.QueryPrepare.SQL.clear;
      Datamodule1.QueryPrepare.SQL.add('select * from PNTYP order by PNTYP_ID');
      Datamodule1.QueryPrepare.Open;
      CntPntyp:=0;
      while not Datamodule1.QueryPrepare.eof do begin
            inc(CntPNTYP);
            PNTYP[CntPnTYP].ID:=Datamodule1.QueryPrepare.fieldbyname('PNTYP_ID').asinteger;
            PNTYP[CntPnTYP].SHORT:=Datamodule1.QueryPrepare.fieldbyname('PNTYP_SHORT').asstring;
            PNTYP[CntPnTYP].FULL:=Datamodule1.QueryPrepare.fieldbyname('PNTYP_FULL').asstring;
            PNTYP[CntPnTYP].DOC:=Datamodule1.QueryPrepare.fieldbyname('Doc_Picture').asinteger;
            PNTYP[CntPnTYP].Jou:=Datamodule1.QueryPrepare.fieldbyname('Jou_Picture').asinteger;
            Datamodule1.QueryPrepare.next;
      end;
      Datamodule1.QueryPrepare.Close;
      Datamodule1.QueryPrepare.Close;
      Datamodule1.QueryPrepare.SQL.clear;
      Datamodule1.QueryPrepare.SQL.add('select * from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
      Datamodule1.QueryPrepare.Open;
      CntRntyp:=0;
      while not Datamodule1.QueryPrepare.eof do begin
            inc(CntRNTYP);
            RNTYP[CntRnTYP].ID:=Datamodule1.QueryPrepare.fieldbyname('RNTYP_ID').asinteger;
            RNTYP[CntRnTYP].SHORT:=Datamodule1.QueryPrepare.fieldbyname('RNTYP_SHORT').asstring;
            RNTYP[CntRnTYP].FULL:=Datamodule1.QueryPrepare.fieldbyname('RNTYP_FULL').asstring;
            RNTYP[CntRnTYP].DOC:=Datamodule1.QueryPrepare.fieldbyname('Doc_Picture').asinteger;
            RNTYP[CntRnTYP].Jou:=Datamodule1.QueryPrepare.fieldbyname('Jou_Picture').asinteger;
            if Datamodule1.QueryPrepare.fieldbyname('TEMP').asstring='1' then
            	   RNTYP[CntRnTYP].IsTemp:=true
                   else RNTYP[CntRnTYP].IsTemp:=false;
            Datamodule1.QueryPrepare.next;
      end;
      Datamodule1.QueryPrepare.Close;
      {Формирование самих меню расходных}
      for a:=1 to CntRNTYP do begin
          MySubDocsRnMenu[a] := TMenuItem.Create(Main_form.MnRn);
          MySubDocsRnMenu[a].Caption :=RNTYP[a].FULL;
          MySubDocsRnMenu[a].OnClick:=MAIN_FORM.MnDocRn.OnClick;
          MySubDocsRnMenu[a].ShortCut:=TextToshortcut('Alt+'+inttostr(a));
          MySubDocsRnMenu[a].ImageIndex:=RNTYP[a].DOC;
          Main_form.MnRn.Add(MySubDocsRnMenu[a]);
          MySubWozwRnMenu[a] := TMenuItem.Create(Main_form.MnWozw);
          MySubWozwRnMenu[a].Caption :='Акт возврата по: '+RNTYP[a].FULL;
          MySubWozwRnMenu[a].OnClick:=MAIN_FORM.MnWozwDefault.OnClick;
          MySubWozwRnMenu[a].ImageIndex:=146;
          Main_form.MnWozw.Add(MySubWozwRnMenu[a]);
          MySubJouRnMenu[a] := TMenuItem.Create(Main_form.MnJou);
          MySubJouRnMenu[a].Caption :=RNTYP[a].FULL;
          MySubJouRnMenu[a].OnClick:=MAIN_FORM.MnJouRn.OnClick;
          MySubJouRnMenu[a].ShortCut:=TextToshortcut('Alt+SHift+'+inttostr(a));
          MySubJouRnMenu[a].ImageIndex:=RNTYP[a].JOU;
          Main_form.MnJou.Add(MySubJouRnMenu[a]);
      end;
      Main_form.MnJouKKM.ShortCut:=TextToshortcut('Alt+SHift+0');
      {Формирование линии перед приходными2}
      MySubDocsPn2Menu[0] := TMenuItem.Create(Main_form.MnDocs);
      MySubDocsPn2Menu[0].Caption := '-';
      Main_form.MnDocs.Add(MySubDocsPn2Menu[0]);
      MySubJouPn2Menu[0] := TMenuItem.Create(Main_form.MnJou);
      MySubJouPn2Menu[0].Caption := '-';
      Main_form.MnJou.Add(MySubJouPn2Menu[0]);
      {Формирование самих меню приходных2}
      for a:=1 to CntPNTYP do begin
          MySubDocsPn2Menu[a] := TMenuItem.Create(Main_form.MnPn);
          MySubDocsPn2Menu[a].Caption :=PNTYP[a].FULL;
          MySubDocsPn2Menu[a].OnClick:=MAIN_FORM.MnDocPn2.OnClick;
          MySubDocsPn2Menu[a].ShortCut:=TextToshortcut('Ctrl+'+inttostr(a));
          MySubDocsPn2Menu[a].ImageIndex:=PNTYP[a].DOC;
          Main_form.MnPn.Add(MySubDocsPn2Menu[a]);
          MySubWozwPnMenu[a] := TMenuItem.Create(Main_form.MnPnWozw);
          MySubWozwPnMenu[a].Caption :='Акт возврата по: '+PNTYP[a].FULL;
          MySubWozwPnMenu[a].OnClick:=MAIN_FORM.MnPnWozwDefault.OnClick;
          MySubWozwPnMenu[a].ImageIndex:=146;
          Main_form.MnPnWozw.Add(MySubWozwPnMenu[a]);
          MySubJouPn2Menu[a] := TMenuItem.Create(Main_form.MnJou);
          MySubJouPn2Menu[a].Caption :=PNTYP[a].FULL;
          MySubJouPn2Menu[a].OnClick:=MAIN_FORM.MnJouPn2.OnClick;
          MySubJouPn2Menu[a].ShortCut:=TextToshortcut('Ctrl+SHift+'+inttostr(a));
          MySubJouPn2Menu[a].ImageIndex:=PNTYP[a].JOU;
          Main_form.MnJou.Add(MySubJouPn2Menu[a]);
      end;
      OST_COLOR1:=-1;
      OST_COLOR2:=-1;
      OST_COLOR3:=-1;
      OST_COLOR4:=-1;
      OTG_COLOR1:=-1;
      OTG_COLOR2:=-1;
      OTG_COLOR3:=-1;
      OTG_COLOR4:=-1;

      OPEN_SQL(Datamodule1.QueryPrepare,'select cfg_value from cfg where cfg_name="TW_COLOR"');
      if not Datamodule1.QueryPrepare.eof then begin
        TW_COLOR:=Datamodule1.QueryPrepare.fieldByname('CFG_VALUE').asinteger;
      end;
      OPEN_SQL(Datamodule1.QueryPrepare,'select cfg_value from cfg where cfg_name="TW_FON"');
      if not Datamodule1.QueryPrepare.eof then begin
        TW_FON:=Datamodule1.QueryPrepare.fieldByname('CFG_VALUE').asinteger;
      end;


      Datamodule1.QueryPrepare.Close;
      Datamodule1.QueryPrepare.SQL.clear;
      Datamodule1.QueryPrepare.SQL.add('select CFG_SET1,CFG_VALUE FROM CFG WHERE CFG_NAME="OST_COLOR"');
      Datamodule1.QueryPrepare.Open;
      if Datamodule1.QueryPrepare.locate('CFG_SET1',1,[]) then
        OST_COLOR1:=Datamodule1.QueryPrepare.fieldbyname('CFG_VALUE').asinteger;
      if Datamodule1.QueryPrepare.locate('CFG_SET1',2,[]) then
        OST_COLOR2:=Datamodule1.QueryPrepare.fieldbyname('CFG_VALUE').asinteger;
      if Datamodule1.QueryPrepare.locate('CFG_SET1',3,[]) then
        OST_COLOR3:=Datamodule1.QueryPrepare.fieldbyname('CFG_VALUE').asinteger;
      if Datamodule1.QueryPrepare.locate('CFG_SET1',4,[]) then
        OST_COLOR4:=Datamodule1.QueryPrepare.fieldbyname('CFG_VALUE').asinteger;
      Datamodule1.QueryPrepare.Close;
      Datamodule1.QueryPrepare.SQL.clear;
      Datamodule1.QueryPrepare.SQL.add('select CFG_SET1,CFG_VALUE FROM CFG WHERE CFG_NAME="OTG_COLOR"');
      Datamodule1.QueryPrepare.Open;
      if Datamodule1.QueryPrepare.locate('CFG_SET1',1,[]) then
        OTG_COLOR1:=Datamodule1.QueryPrepare.fieldbyname('CFG_VALUE').asinteger;
      if Datamodule1.QueryPrepare.locate('CFG_SET1',2,[]) then
        OTG_COLOR2:=Datamodule1.QueryPrepare.fieldbyname('CFG_VALUE').asinteger;
      if Datamodule1.QueryPrepare.locate('CFG_SET1',3,[]) then
        OTG_COLOR3:=Datamodule1.QueryPrepare.fieldbyname('CFG_VALUE').asinteger;
      if Datamodule1.QueryPrepare.locate('CFG_SET1',4,[]) then
        OTG_COLOR4:=Datamodule1.QueryPrepare.fieldbyname('CFG_VALUE').asinteger;
      Datamodule1.QueryPrepare.Close;
      Datamodule1.IBTransaction1.Commit;
      TYP_KKM:=-1;
      delay(1);
      GET_DEFAULT;
      DataModule1.MainDicTransaction.Active:=False;
      DataModule1.MainDicRvid1.close;
      DataModule1.MainDicRvid1.open;
      Datamodule1.MainDicRVid.LoadFromDataSet(Datamodule1.MainDicRvid1, 0, lmCopy);

      DataModule1.MainDicMen1.close;
      DataModule1.MainDicMen1.open;
      Datamodule1.MainDicMen.LoadFromDataSet(Datamodule1.MainDicMen1, 0, lmCopy);

      DataModule1.MainDicSkl1.close;
      DataModule1.MainDicSkl1.open;
      Datamodule1.MainDicSkl.LoadFromDataSet(Datamodule1.MainDicSkl1, 0, lmCopy);

      DataModule1.MainDicZone1.close;
      DataModule1.MainDicZone1.open;
      Datamodule1.MainDicZone.LoadFromDataSet(Datamodule1.MainDicZone1, 0, lmCopy);


      DataModule1.MainDicShop1.close;
      DataModule1.MainDicShop1.open;
      Datamodule1.MainDicShop.LoadFromDataSet(Datamodule1.MainDicShop1, 0, lmCopy);

      DataModule1.MainDicPnvid1.close;
      DataModule1.MainDicPnvid1.open;
      Datamodule1.MainDicPnvid.LoadFromDataSet(Datamodule1.MainDicPnvid1, 0, lmCopy);

      DataModule1.MainDicRnvid1.close;
      DataModule1.MainDicRnvid1.open;
      Datamodule1.MainDicRnVid.LoadFromDataSet(Datamodule1.MainDicRnvid1, 0, lmCopy);

      DataModule1.MainDicPnTyp1.close;
      DataModule1.MainDicPnTyp1.open;
      Datamodule1.MainDicPnTyp.LoadFromDataSet(Datamodule1.MainDicPnTyp1, 0, lmCopy);

      DataModule1.MainDicRnTyp1.close;
      DataModule1.MainDicRnTyp1.open;
      Datamodule1.MainDicRnTyp.LoadFromDataSet(Datamodule1.MainDicRnTyp1, 0, lmCopy);

      DataModule1.MainDicSpisvid1.close;
      DataModule1.MainDicSpisvid1.open;
      Datamodule1.MainDicSpisvid.LoadFromDataSet(Datamodule1.MainDicSpisvid1, 0, lmCopy);

      DataModule1.MainDicDopFrm1.close;
      DataModule1.MainDicDopFrm1.open;
      Datamodule1.MainDicDopFrm.LoadFromDataSet(Datamodule1.MainDicDopFrm1, 0, lmCopy);

      DataModule1.MainDicOsnFrm1.close;
      DataModule1.MainDicOsnFrm1.open;
      Datamodule1.MainDicOsnFrm.LoadFromDataSet(Datamodule1.MainDicOsnFrm1, 0, lmCopy);

      DataModule1.MainDicAllFrm1.close;
      DataModule1.MainDicAllFrm1.open;
      Datamodule1.MainDicAllFrm.LoadFromDataSet(Datamodule1.MainDicAllFrm1, 0, lmCopy);

      DataModule1.MainDicTwSaler1.close;
      DataModule1.MainDicTwSaler1.open;
      Datamodule1.MainDicTwSaler.LoadFromDataSet(Datamodule1.MainDicTwSaler1, 0, lmCopy);

      DataModule1.MainDicValuta1.close;
      DataModule1.MainDicValuta1.open;
      Datamodule1.MainDicValuta.LoadFromDataSet(Datamodule1.MainDicValuta1, 0, lmCopy);

      DataModule1.MainDicTwKtg1.close;
      DataModule1.MainDicTwKtg1.open;
      Datamodule1.MainDicTwKtg.LoadFromDataSet(Datamodule1.MainDicTwKtg1, 0, lmCopy);



      DataModule1.MainDicTransaction.Active:=False;

      delay(1);

      IS_ANALIZ_TW:=False;
      IS_ANALIZ_PN:=False;
      IS_ANALIZ_RN:=False;
      Prepare_Form.timer1.enabled:=true;
      Application.Run;

    end;
  end;
  end;


  except
  on e: Exception do
  begin
    messbox(e.message, 'Ошибка запуска!', 0);
  end;


  end;
end.
