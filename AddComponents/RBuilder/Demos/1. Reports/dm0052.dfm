�
 TFRM0052 0��  TPF0Tfrm0052frm0052Left4Top� Width,HeightCaptionMultiple Sections: 3Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	ScaledOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelLabel1LeftTop	Width=HeightCaptionData Access  TLabelLabel2Left� TopWidth HeightCaptionReport  TLabelLabel3Left� TopAWidthaHeightCaptionTo Edit, double-click  TLabelLabel4LeftTop@WidthMHeightCaptionSection 1 - Data  TLabelLabel5LeftTop� WidthMHeightCaptionSection 2 - Data  TLabelLabel6LeftTop� WidthMHeightCaptionSection 3 - Data  TDataSourcedsEmployeeOrderDataSetqryEmployeeOrderLeft/Top_  TppBDEPipelineplEmployeeOrder
DataSourcedsEmployeeOrderUserNameEmployeeOrderLeftOTop_ TppFieldppField1	AlignmenttaRightJustify
FieldAliasEmpNo	FieldNameEmpNoFieldLength DataType	dtIntegerDisplayWidth Position   TppFieldppField2
FieldAliasLastName	FieldNameLastNameFieldLengthDisplayWidthPosition  TppFieldppField3
FieldAlias	FirstName	FieldName	FirstNameFieldLengthDisplayWidthPosition  TppFieldppField4
FieldAliasPhoneExt	FieldNamePhoneExtFieldLengthDisplayWidthPosition  TppFieldppField5
FieldAliasHireDate	FieldNameHireDateFieldLength DataType
dtDateTimeDisplayWidth
Position  TppFieldppField6	AlignmenttaRightJustify
FieldAliasSalary	FieldNameSalaryFieldLength DataTypedtDoubleDisplayWidth
Position  TppFieldppField7	AlignmenttaRightJustify
FieldAliasOrderNo	FieldNameOrderNoFieldLength DataTypedtDoubleDisplayWidth
Position  TppFieldppField8	AlignmenttaRightJustify
FieldAliasCustNo	FieldNameCustNoFieldLength DataTypedtDoubleDisplayWidth
Position  TppFieldppField9
FieldAliasSaleDate	FieldNameSaleDateFieldLength DataType
dtDateTimeDisplayWidth
Position  TppField	ppField10
FieldAliasShipDate	FieldNameShipDateFieldLength DataType
dtDateTimeDisplayWidth
Position	  TppField	ppField11	AlignmenttaRightJustify
FieldAliasEmpNo_1	FieldNameEmpNo_1FieldLength DataType	dtIntegerDisplayWidth
Position
  TppField	ppField12
FieldAliasShipToContact	FieldNameShipToContactFieldLengthDisplayWidthPosition  TppField	ppField13
FieldAliasShipToAddr1	FieldNameShipToAddr1FieldLengthDisplayWidthPosition  TppField	ppField14
FieldAliasShipToAddr2	FieldNameShipToAddr2FieldLengthDisplayWidthPosition  TppField	ppField15
FieldAlias
ShipToCity	FieldName
ShipToCityFieldLengthDisplayWidthPosition  TppField	ppField16
FieldAliasShipToState	FieldNameShipToStateFieldLengthDisplayWidthPosition  TppField	ppField17
FieldAlias	ShipToZip	FieldName	ShipToZipFieldLength
DisplayWidth
Position  TppField	ppField18
FieldAliasShipToCountry	FieldNameShipToCountryFieldLengthDisplayWidthPosition  TppField	ppField19
FieldAliasShipToPhone	FieldNameShipToPhoneFieldLengthDisplayWidthPosition  TppField	ppField20
FieldAliasShipVIA	FieldNameShipVIAFieldLengthDisplayWidthPosition  TppField	ppField21
FieldAliasPO	FieldNamePOFieldLengthDisplayWidthPosition  TppField	ppField22
FieldAliasTerms	FieldNameTermsFieldLengthDisplayWidthPosition  TppField	ppField23
FieldAliasPaymentMethod	FieldNamePaymentMethodFieldLengthDisplayWidthPosition  TppField	ppField24
FieldAlias
ItemsTotal	FieldName
ItemsTotalFieldLength DataType
dtCurrencyDisplayWidth
Position  TppField	ppField25	AlignmenttaRightJustify
FieldAliasTaxRate	FieldNameTaxRateFieldLength DataTypedtDoubleDisplayWidth
Position  TppField	ppField26
FieldAliasFreight	FieldNameFreightFieldLength DataType
dtCurrencyDisplayWidth
Position  TppField	ppField27
FieldAlias
AmountPaid	FieldName
AmountPaidFieldLength DataType
dtCurrencyDisplayWidth
Position   TQueryqryEmployeeOrderActive	DatabaseNameDBDEMOSSQL.Strings	select * from employee, orders$where orders.EmpNo = employee.EmpNo order by employee.EmpNo LeftTop_  TTabletblCustomerActive	DatabaseNameDBDEMOS	TableNameCUSTOMER.DBLeft	Top  TDataSource
dsCustomerDataSettblCustomerLeft*Top  TppBDEPipeline
plCustomer
DataSource
dsCustomerUserNameCustomerLeftLTop  	TppReport	ppReport1PrinterSetup.BinNameDefaultPrinterSetup.DocumentName	ppReport1PrinterSetup.PaperNameLetter 8 � x 11 inPrinterSetup.PrinterNameDefaultPrinterSetup.mmMarginBottom�PrinterSetup.mmMarginLeft�PrinterSetup.mmMarginRight�PrinterSetup.mmMarginTop�PrinterSetup.mmPaperHeightiC PrinterSetup.mmPaperWidth\K UserNameReport
DeviceTypeScreenLeft� TopVersion5.0mmColumnWidth  TppTitleBandppReport1TitleBand1mmBottomOffset mmHeight�@ mmPrintPosition  TppLabelppReport1Label9UserNameppReport1Label9Caption
Title PageFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBold Transparent	mmHeight�mmLeftmmTopmmWidthHFBandType  TppLabelppReport1Label13UserNameppReport1Label13	AlignmenttaCenterCaption(Marine Adventures & Sunken Treasures Co.Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBoldfsItalic Transparent	mmHeight
 mmLeft\�  mmTop+�  mmWidth  BandType  TppLabelppStockListLabel21UserNameppStockListLabel21	AlignmenttaCenterCaptionTable of ContentsFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBoldfsItalic Transparent	mmHeight
 mmLeftu# mmTopq mmWidth��  BandType  TppLabelppStockListLabel23UserNameppStockListLabel23	AlignmenttaCenterCaptionSection 1.....Customer ListFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.Style Transparent	mmHeight�mmLeftu# mmTop� mmWidth��  BandType  TppLabelppReport1Label14UserNameppReport1Label14	AlignmenttaCenterCaptionSection 2.....Sales By EmployeeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.Style Transparent	mmHeight�mmLeftu# mmTop� mmWidth�  BandType  TppLabelppReport1Label10UserNameppReport1Label10	AlignmenttaCenterCaptionAnnual Report for 1997Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBoldfsItalic Transparent	mmHeight
 mmLeftH�  mmTopi�  mmWidth' BandType  TppLabelppReport1Label11UserNameppReport1Label11	AlignmenttaCenterCaptionPrepared ByFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBoldfsItalic Transparent	mmHeight�mmLeft<Z mmTop� mmWidthIeBandType  TppLabelppReport1Label12UserNameppReport1Label12	AlignmenttaCenterCaptionAuthor Andreesen & Co.Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBoldfsItalic Transparent	mmHeight�mmLeft�( mmTop�- mmWidth��  BandType  TppLabelppReport1Label1UserNameppReport1Label1	AlignmenttaCenterCaptionSection 3.....Stock PortfolioFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.Style Transparent	mmHeight�mmLeftu# mmTop2� mmWidth�  BandType   TppDetailBandppReport1DetailBand1PrintHeight	phDynamicmmBottomOffset mmHeight/bmmPrintPosition  TppSubReportppReport1SubReport1UserNameppReport1SubReport1CaptionSection 1 - Customer List	ExpandAllNewPrintJobParentPrinterSetupPrintBehavior	pbSectionTraverseAllDatammHeight�mmLeft mmTopM	mmWidth� BandTypemmBottomOffset mmOverFlowOffset mmStopPosition  TppChildReport
ppCustListAutoStopDataPipeline
plCustomerPrinterSetup.BinNameAuto SelectPrinterSetup.DocumentName
ppCustListPrinterSetup.OrientationpoLandscapePrinterSetup.PaperNameLetter 8 1/2 x 11 inPrinterSetup.PrinterNameDefaultPrinterSetup.mmMarginBottom�PrinterSetup.mmMarginLeft�PrinterSetup.mmMarginRight�PrinterSetup.mmMarginTop�PrinterSetup.mmPaperHeight\K PrinterSetup.mmPaperWidthiC Template.FileName*P:\Dev\Piparti3\DEMOS\Reports\custlist.RTMUnitsutMillimetersUserNameReportLeft� Top_Version5.0 PrommColumnWidth  TppHeaderBandppCustListHeadermmBottomOffset mmHeight�ZmmPrintPosition  TppLabelppCustListLabel1UserNameppCustListLabel1	AlignmenttaCenterCaption(Marine Adventures & Sunken Treasures Co.Font.CharsetDEFAULT_CHARSET
Font.ColorclNavy	Font.NameTimes New Roman	Font.Size
Font.StylefsBoldfsItalic Transparent	mmHeight�mmLefte@ mmTop+mmWidth�� BandType   TppLabelppCustListLabel2UserNameppCustListLabel2CaptionCustomer ListFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBoldfsItalic Transparent	mmHeight�mmLeftM	mmTop+mmWidth'aBandType   TppLabelppCustListLabel3UserNameppCustListLabel3CaptionCompanyFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBold Transparent	mmHeight�mmLeftmmTop.CmmWidthABandType   TppLabelppCustListLabel4UserNameppCustListLabel4CaptionStateFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBold Transparent	mmHeight�mmLeft� mmTop.CmmWidth,$BandType   TppLabelppCustListLabel6UserNameppCustListLabel6CaptionContactFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBold Transparent	mmHeight�mmLeftX�  mmTop.CmmWidth�5BandType   TppLabelppCustListLabel7UserNameppCustListLabel7CaptionPhoneFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBold Transparent	mmHeight�mmLeft�� mmTop.CmmWidth`*BandType   TppLabelppCustListLabel8UserNameppCustListLabel8CaptionAddressFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBold Transparent	mmHeight�mmLeftg mmTop.CmmWidth�8BandType   TppLabelppCustListLabel9UserNameppCustListLabel9CaptionCityFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBold Transparent	mmHeight�mmLeft�� mmTop.CmmWidth�BandType   TppLineppCustListLine1UserNameppCustListLine1	Pen.WidthParentWidth	PositionlpBottomWeight       ��?mmHeight+mmLeft mmTop�UmmWidth� BandType    TppDetailBandppCustListDetailmmBottomOffset mmHeight�mmPrintPosition  	TppDBTextppCustListDBText2UserNameppCustListDBText2	DataFieldCompanyDataPipeline
plCustomerFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeftmmTop"mmWidth�  BandType  	TppDBTextppCustListDBText8UserNameppCustListDBText8	DataFieldCityDataPipeline
plCustomerFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft�� mmTop"mmWidth��  BandType  	TppDBTextppCustListDBText3UserNameppCustListDBText3	DataFieldContactDataPipeline
plCustomerFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeftX�  mmTop"mmWidthݕ  BandType  	TppDBTextppCustListDBText4UserNameppCustListDBText4	DataFieldPhoneDataPipeline
plCustomerFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft�� mmTop"mmWidthS�  BandType  	TppDBTextppCustListDBText5UserNameppCustListDBText5	DataFieldAddr1DataPipeline
plCustomerFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeftg mmTop"mmWidth�  BandType  	TppDBTextppCustListDBText6UserNameppCustListDBText6	DataFieldStateDataPipeline
plCustomerFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft� mmTop+mmWidthRfBandType   TppFooterBandppCustListFootermmBottomOffset mmHeightW)mmPrintPosition  TppSystemVariableppCustListCalc1UserNameCustListCalc1VarTypevtPrintDateTimeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeftM	mmTop�mmWidthRfBandType  TppSystemVariableppCustListCalc3UserNameCustListCalc3	AlignmenttaRightJustifyVarTypevtPageSetDescFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft�� mmTop�mmWidth�;BandType     TppSubReportppReport1SubReport2UserNameppReport1SubReport2CaptionSection 2 - Sales by Employee	ExpandAllNewPrintJobParentPrinterSetupPrintBehavior	pbSectionResetPageNoTraverseAllDatammHeight�mmLeft mmTopW)mmWidth� BandTypemmBottomOffset mmOverFlowOffset mmStopPosition  TppChildReport
ppEmpSalesAutoStopDataPipelineplEmployeeOrderPrinterSetup.BinNameDefaultPrinterSetup.DocumentName
ppEmpSalesPrinterSetup.PaperNameLetter (8 � x 11 in)PrinterSetup.PrinterNameDefaultPrinterSetup.mmMarginBottom�PrinterSetup.mmMarginLeft�PrinterSetup.mmMarginRight�PrinterSetup.mmMarginTop�PrinterSetup.mmPaperHeightiC PrinterSetup.mmPaperWidth\K Template.FileName*P:\Dev\Piparti3\DEMOS\Reports\salesemp.RTMUserNameReportLeft� Top_Version5.0 PrommColumnWidth�  TppHeaderBandppEmpSalesHeaderBand1mmBottomOffset mmHeightaImmPrintPosition  TppLabelppEmpSalesLabel6UserNameppEmpSalesLabel6	AlignmenttaRightJustifyCaptionSales by EmployeeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBoldfsItalic Transparent	mmHeight�mmLeftEmmTopmmWidth BandType   TppLabelppOrderDetailLabel1UserNameppOrderDetailLabel1	AlignmenttaCenterCaption(Marine Adventures & Sunken Treasures Co.Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBoldfsItalic Transparent	mmHeight�mmLeft_�  mmTopmmWidth�� BandType    TppDetailBandppEmpSalesDetailBand1mmBottomOffset mmHeight�mmPrintPosition  	TppDBTextppEmpSalesDBText7UserNameppEmpSalesDBText7	DataFieldOrderNoDataPipelineplEmployeeOrderFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.Style Transparent	mmHeight�mmLeft؋ mmTopmmWidth>BandType  	TppDBTextppEmpSalesDBText8UserNameppEmpSalesDBText8	AlignmenttaRightJustifyAutoSize		DataField
ItemsTotalDataPipelineplEmployeeOrderDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.Style Transparent	mmHeight�mmLeft~� mmTopmmWidth>BandType  TppLineppEmpSalesLine2UserNameppEmpSalesLine2	Pen.ColorclSilver	Pen.WidthParentHeight	PositionlpLeftWeight       � @mmHeight�mmLeft mmTop mmWidth�BandType  TppLineppEmpSalesLine3UserNameppEmpSalesLine3	Pen.ColorclSilver	Pen.WidthParentHeight	PositionlpRightWeight       � @mmHeight�mmLeft� mmTop mmWidth�BandType  TppLabelppLabelContinuedOnPrintppLabelContinuedPrintUserNameppLabelContinuedReprintOnOverFlow		AlignmenttaRightJustifyCaptionContinued...Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.Style Transparent	VisiblemmHeight�mmLefttjmmTop+mmWidthYHBandType   TppFooterBandppEmpSalesFooterBand1mmBottomOffset mmHeight�3mmPrintPosition  TppSystemVariableppOrderDetailCalc2UserNameOrderDetailCalc2VarTypevtPrintDateTimeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft	mmTop�mmWidthRfBandType  TppSystemVariableppOrderDetailCalc3UserNameOrderDetailCalc3	AlignmenttaRightJustifyVarTypevtPageSetDescFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft�� mmTop�mmWidth�;BandType  TppSystemVariableppEmpSalesCalc1UserNameEmpSalesCalc1VarTypevtPrintDateTimeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft	mmTop�mmWidthRfBandType  TppSystemVariableppEmpSalesCalc2UserNameEmpSalesCalc2	AlignmenttaRightJustifyVarTypevtPageSetDescFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft�� mmTop�mmWidth�;BandType   TppGroupppEmpSalesGroup1	BreakNameEmpNoDataPipelineplEmployeeOrderUserNameEmpSalesGroup1mmNewColumnThreshold mmNewPageThreshold  TppGroupHeaderBandppEmpSalesGroupHeaderBand1mmBottomOffset mmHeight�/mmPrintPosition  TppShapeppEmpSalesShape1UserNameppEmpSalesShape1Brush.ColorclSilverParentHeight	ParentWidth		Pen.ColorclSilvermmHeight�/mmLeft mmTop mmWidth� BandTypeGroupNo   TppLabelppEmpSalesLabel1UserNameppEmpSalesLabel1Caption	Salesman:ColorclSilverFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeftmmTopmmWidth?EBandTypeGroupNo   	TppDBTextppEmpSalesDBText1UserNameppEmpSalesDBText1ColorclSilver	DataField	FirstNameDataPipelineplEmployeeOrderFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBoldfsItalic Transparent	mmHeight�mmLefttjmmTopmmWidth]BandTypeGroupNo   	TppDBTextppEmpSalesDBText3UserNameppEmpSalesDBText3ColorclSilver	DataFieldLastNameDataPipelineplEmployeeOrderFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBoldfsItalic Transparent	mmHeight�mmLefttjmmTop�mmWidth|BandTypeGroupNo   TppLabelppEmpSalesLabel2UserNameppEmpSalesLabel2CaptionSalaryColorclSilverFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeftaU mmTop�mmWidth`*BandTypeGroupNo   	TppDBTextppEmpSalesDBText2UserNameppEmpSalesDBText2ColorclSilver	DataFieldEmpNoDataPipelineplEmployeeOrderFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft�QmmTopmmWidth�BandTypeGroupNo   TppLabelppEmpSalesLabel3UserNameppEmpSalesLabel3	AlignmenttaRightJustifyCaptionSales AmountColorclSilverFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBold Transparent	WordWrap	mmHeight$#mmLeft�� mmTop"mmWidth�4BandTypeGroupNo   TppLabelppEmpSalesLabel4UserNameppEmpSalesLabel4CaptionOrder NumberColorclSilverFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBold Transparent	WordWrap	mmHeight!mmLeftϊ mmTop<mmWidth�3BandTypeGroupNo   TppLabelppEmpSalesLabel5UserNameppEmpSalesLabel5	AlignmenttaRightJustifyCaptionNetColorclSilverFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBold Transparent	WordWrap	mmHeight�mmLeft�� mmTop�mmWidth�BandTypeGroupNo   	TppDBTextppEmpSalesDBText5UserNameppEmpSalesDBText5ColorclSilver	DataFieldPhoneExtDataPipelineplEmployeeOrderDisplayFormat!\X99999;0; Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBold SuppressRepeatedValues	Transparent	mmHeight�mmLeft7�  mmTop"mmWidth>BandTypeGroupNo    TppGroupFooterBandppEmpSalesGroupFooterBand1BeforePrint%ppEmpSalesGroupFooterBand1BeforePrintmmBottomOffset mmHeight�4mmPrintPosition  	TppDBCalcppDBCalcSumSalesUserNameppDBCalcSumSales	AlignmenttaRightJustifyAutoSize		DataField
ItemsTotalDataPipelineplEmployeeOrderDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBold 
ResetGroupppEmpSalesGroup1Transparent	mmHeight�mmLeft� mmTop^mmWidthtjBandTypeGroupNo   TppLineppEmpSalesLine1UserNameppEmpSalesLine1StylelsDoubleWeight       ��?mmHeight�mmLeft�� mmTop	mmWidth�YBandTypeGroupNo   	TppDBText
ppDBSalaryUserName
ppDBSalaryAutoSize		DataFieldSalaryDataPipelineplEmployeeOrderDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBoldfsItalic Transparent	mmHeight�mmLeft�= mmTop^mmWidthO(BandTypeGroupNo   TppLineppEmpSalesLine4UserNameppEmpSalesLine4	Pen.ColorclSilver	Pen.WidthParentWidth	Weight       � @mmHeightM	mmLeft mmTop
 mmWidth� BandTypeGroupNo   TppLineppEmpSalesLine5UserNameppEmpSalesLine5	Pen.ColorclSilver	Pen.WidthPositionlpLeftWeight       � @mmHeight
 mmLeft mmTop mmWidth�BandTypeGroupNo   TppLineppEmpSalesLine6UserNameppEmpSalesLine6	Pen.ColorclSilver	Pen.WidthPositionlpRightWeight       � @mmHeight
 mmLeft� mmTop mmWidth�BandTypeGroupNo   TppVariable	ppCalcNetUserName
ppCalcNet1	CalcOrder DataTypedtDoubleDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBoldfsItalic Transparent	mmHeight�mmLeftݡ mmTop^mmWidth�0BandTypeGroupNo       TppSubReportppReport1SubReport3UserNameppReport1SubReport3CaptionSection 3 - Stock Portfolio	ExpandAllNewPrintJobParentPrinterSetupPrintBehavior	pbSectionTraverseAllDatammHeight�mmLeft mmTopHFmmWidth� BandTypemmBottomOffset mmOverFlowOffset mmStopPosition  TppChildReportppReport1ChildReport1AutoStopDataPipelineplStockPrinterSetup.BinNameAuto SelectPrinterSetup.DocumentNameppStockListPrinterSetup.PaperNameLetter (8 � x 11 in)PrinterSetup.PrinterNameDefaultPrinterSetup.mmMarginBottom�PrinterSetup.mmMarginLeft�PrinterSetup.mmMarginRight�PrinterSetup.mmMarginTop�PrinterSetup.mmPaperHeightiC PrinterSetup.mmPaperWidth\K Template.FileName5P:\Dev\Piparti3\DEMOS\Reports\Nard\stockportfolio.RTMUserNameReportLeft� Top|Version5.0 PrommColumnWidth  TppHeaderBandppStockListHeadermmBottomOffset mmHeight`mmPrintPosition  TppLineppStockListLine6UserNameppStockListLine6	Pen.WidthParentWidth	PositionlpBottomWeight       ��?mmHeight�mmLeft mmTop�QmmWidth� BandType   TppLabelppReport1ChildReport1Label2UserNameppReport1ChildReport1Label2	AlignmenttaRightJustifyCaptionStock Portfolio AnlaysisFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBoldfsItalic Transparent	mmHeight�mmLeft"mmTop+mmWidtho�  BandType   TppLabelppReport1ChildReport1Label1UserNameppReport1ChildReport1Label1	AlignmenttaCenterCaption(Marine Adventures & Sunken Treasures Co.Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBoldfsItalic Transparent	mmHeight�mmLeft��  mmTop"mmWidth�� BandType    TppDetailBandppStockListDetailBeforePrintppStockListDetailBeforePrintmmBottomOffset mmHeight��  mmPrintPosition  TppLineppStockListLine5UserNameppStockListLine5	Pen.WidthWeight       ��?mmHeight�mmLeft�  mmTop�mmWidth�' BandType  TppLineppStockListLine1UserNameppStockListLine1	Pen.WidthWeight       ��?mmHeight�mmLeft~� mmTop�mmWidth�' BandType  	TppDBTextppStockListDBText2UserNameppStockListDBText2	AlignmenttaRightJustify	DataFieldBETADataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft� mmTopd�  mmWidth>&BandType  	TppDBTextppStockListDBText3UserNameppStockListDBText3AutoSize		DataFieldCO_NAMEDataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size
Font.StylefsBold Transparent	mmHeightpmmLeft mmTopW)mmWidth/bBandType  	TppDBTextppStockListDBText4UserNameppStockListDBText4	AlignmenttaRightJustify	DataField	CUR_PRICEDataPipelineplStockDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft�� mmTop�5mmWidth�/BandType  TppLabelppStockListLabel2UserNameppStockListLabel2CaptionBetaFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeftX� mmTop�tmmWidth�BandType  TppLabelppStockListLabel4UserNameppStockListLabel4CaptionCurrentFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft�� mmTop!mmWidthW)BandType  	TppDBTextppStockListDBText1UserNameppStockListDBText1	DataFieldEXCHANGEDataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft*�  mmTop�5mmWidth�1BandType  TppLabelppStockListLabel5UserNameppStockListLabel5CaptionExchangeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft*�  mmTop"mmWidth�4BandType  	TppDBTextppStockListDBText5UserNameppStockListDBText5	DataFieldINDUSTRYDataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft��  mmTop�5mmWidth�1BandType  TppLabelppStockListLabel6UserNameppStockListLabel6CaptionIndustryFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft��  mmTop"mmWidth�/BandType  	TppDBTextppStockListDBText6UserNameppStockListDBText6	AlignmenttaRightJustify	DataFieldOUTLOOKDataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft؋ mmTop�5mmWidthF'BandType  	TppDBTextppStockListDBText7UserNameppStockListDBText7	AlignmenttaRightJustify	DataField	P_E_RATIODataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft��  mmTopv�  mmWidthF'BandType  TppLabelppStockListLabel7UserNameppStockListLabel7CaptionOutlookFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft�� mmTop!mmWidthq,BandType  TppLabelppStockListLabel8UserNameppStockListLabel8Caption
P.E. RatioFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft*�  mmTop�tmmWidth�4BandType  	TppDBTextppStockListDBText8UserNameppStockListDBText8	AlignmenttaRightJustify	DataField	PRICE_CHGDataPipelineplStockDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft#� mmTop�5mmWidth>BandType  TppLabelppStockListLabel9UserNameppStockListLabel9CaptionChangeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft�� mmTop!mmWidth`*BandType  TppLabelppStockListLabel10UserNameppStockListLabel10CaptionRankFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeftQ  mmTop�tmmWidth�BandType  	TppDBTextppStockListDBText9UserNameppStockListDBText9	DataField	PROJ_GRTHDataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft 8 mmTop�5mmWidthF'BandType  	TppDBTextppStockListDBText10UserNameppStockListDBText10	AlignmenttaRightJustify	DataFieldRANKDataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft��  mmTopv�  mmWidthF'BandType  TppLabelppStockListLabel11UserNameppStockListLabel11CaptionProj. GrowthFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft 8 mmTop"mmWidth7DBandType  	TppDBTextppStockListDBText11UserNameppStockListDBText11	DataFieldRATINGDataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft"W mmTopd�  mmWidthF'BandType  TppLabelppStockListLabel12UserNameppStockListLabel12CaptionRatingFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft"W mmTop�tmmWidth,$BandType  	TppDBTextppDBTextRcmndationUserNameppDBTextRcmndation	DataField
RCMNDATIONDataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft�� mmTopd�  mmWidth>BandType  TppLabelppStockListLabel13UserNameppStockListLabel13CaptionRecommendationFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft�� mmTop�tmmWidth_BandType  	TppDBTextppStockListDBText13UserNameppStockListDBText13	DataFieldRISKDataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft{X mmTopd�  mmWidth>BandType  TppLabelppStockListLabel14UserNameppStockListLabel14CaptionRiskFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft{X mmTop�tmmWidth�BandType  	TppDBTextppStockListDBText14UserNameppStockListDBText14	AlignmenttaCenter	DataFieldSAFETYDataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft� mmTopd�  mmWidth,$BandType  TppLabelppStockListLabel15UserNameppStockListLabel15CaptionSafetyFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft� mmTop�tmmWidth$#BandType  	TppDBTextppDBTextSymbolUserNameppDBTextSymbolAutoSize		DataFieldSYMBOLDataPipelineplStockFont.CharsetDEFAULT_CHARSET
Font.ColorclNavy	Font.Name
Wide Latin	Font.Size
Font.StylefsItalic Transparent	mmHeight�mmLeft mmTopM	mmWidth�NBandType  	TppDBTextppStockListDBText16UserNameppStockListDBText16	AlignmenttaRightJustify	DataFieldYRL_HIGHDataPipelineplStockDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft`6 mmTop�5mmWidth�/BandType  TppLabelppStockListLabel17UserNameppStockListLabel17CaptionYear HiFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeft�= mmTop!mmWidthO(BandType  	TppDBTextppStockListDBText17UserNameppStockListDBText17	AlignmenttaRightJustify	DataFieldYRL_LOWDataPipelineplStockDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeft�� mmTop�5mmWidth�4BandType  TppLabelppStockListLabel18UserNameppStockListLabel18CaptionYear LoFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeftS� mmTop!mmWidth`*BandType  TppLabelppStockListLabel3UserNameppStockListLabel3	AlignmenttaCenterAutoSizeCaptionPricingFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBoldfsItalic mmHeight�mmLeftJ mmTopgmmWidth�4BandType  TppLineppStockListLine2UserNameppStockListLine2	Pen.WidthWeight       ��?mmHeightpmmLeft!�  mmTopRfmmWidth�' BandType  TppLabelppStockListLabel16UserNameppStockListLabel16	AlignmenttaCenterAutoSizeCaptionVital StatsFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBoldfsItalic mmHeight�mmLeftQ  mmTop_mmWidth?EBandType  TppLineppStockListLine3UserNameppStockListLine3	Pen.WidthWeight       ��?mmHeight�mmLeft�� mmTopRfmmWidth�' BandType  TppLabelppStockListLabel19UserNameppStockListLabel19	AlignmenttaCenterAutoSizeCaptionRecomendationFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBoldfsItalic mmHeight�mmLeft�@ mmTop_mmWidth�mBandType  TppLineppStockListLine4UserNameppStockListLine4	Pen.WidthParentWidth	PositionlpBottomWeight       ��?mmHeight�mmLeft mmTopw�  mmWidth� BandType  TppLabelppStockListLabel20UserNameppStockListLabel20	AlignmenttaCenterAutoSizeCaptionGeneralFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.StylefsBoldfsItalic mmHeight�mmLeftH�  mmTop^mmWidth?EBandType   TppFooterBandppStockListFootermmBottomOffset mmHeightW)mmPrintPosition  TppSystemVariableppStockListCalc1UserNameStockListCalc1VarTypevtPrintDateTimeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeftM	mmTop�mmWidthRfBandType  TppSystemVariableppStockListCalc3UserNameStockListCalc3	AlignmenttaRightJustifyVarTypevtPageSetDescFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameTimes New Roman	Font.Size

Font.Style Transparent	mmHeight�mmLeftN� mmTop�mmWidth�;BandType       TTabletblStockActive	DatabaseNameDBDEMOS	IndexNameSYMBOL	TableName
MASTER.DBFLeftTop�   TDataSourcedsStockDataSettblStockLeft.Top�   TppBDEPipelineplStock
DataSourcedsStockUserNameStockLeftPTop�    