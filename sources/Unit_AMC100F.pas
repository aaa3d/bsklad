unit Unit_AMC100F;

interface

uses Controls,SysUtils,Windows,Forms,Classes;

type
//------------------------------------------------------------------------------
// Процедурные типы данных для организации передачи событий из библиотеки chon100.dll
//------------------------------------------------------------------------------
  TAppCheckPrepare = procedure(Progress: Integer); stdcall;
  TAppError = procedure (ErrorCode: Integer; ErrorMsg: PChar); stdcall;
  TAppEvent = procedure; stdcall;
//------------------------------------------------------------------------------



//------------------------------------------------------------------------------
//                       Объявление внешних функций
//------------------------------------------------------------------------------
  function cbAddBottomLine(Line: PChar): Integer; stdcall; external 'chon100.dll';
  function cbAddSale(Name: PChar; Price, Qty: Double; Section: Integer): Integer; stdcall; external 'chon100.dll';
  function cbAddTitleLine(Line: PChar): Integer; stdcall; external 'chon100.dll';
  function cbGetBottomLinesCount: Integer; stdcall; external 'chon100.dll';
  procedure cbClearBottom; stdcall; external 'chon100.dll';
  procedure cbSetCreditMode(Mode: Integer); stdcall; external 'chon100.dll';
  function cbGetCreditMode: Integer; stdcall; external 'chon100.dll';
  procedure cbClearSales; stdcall; external 'chon100.dll';
  procedure cbClearTitle; stdcall; external 'chon100.dll';
      function cbDeleteSale(Index: Integer): Integer; stdcall; external 'chon100.dll';
  function cbGetBottomLine(Index: Integer; var Line: PChar): Integer; stdcall; external 'chon100.dll';
  function cbGetDiscountValue: Integer; stdcall; external 'chon100.dll';
  function cbGetSale(Index: Integer; var Name: PChar; var Price, Qty: Double; var Section: Integer): Integer; stdcall; external 'chon100.dll';
  function cbGetTitleLine(Index: Integer; var Line: PChar): Integer; stdcall; external 'chon100.dll';
  function cbGetSalesCount: Integer; stdcall; external 'chon100.dll';
  procedure cbSetReturnMode(Mode: Integer); stdcall; external 'chon100.dll';
  function cbGetReturnMode: Integer; stdcall; external 'chon100.dll';
  function cbSetCash(Value: Double): Integer; stdcall; external 'chon100.dll';
  function cbGetCash: Double; stdcall; external 'chon100.dll';
  function cbSetDiscountValue(Value: Integer): Integer; stdcall; external 'chon100.dll';
  function cbSetLinesInSale(Value: Integer): Integer; stdcall; external 'chon100.dll';
  function cbGetLinesInSale: Integer; stdcall; external 'chon100.dll';
  function cbGetSum: Double; stdcall; external 'chon100.dll';
  function cbGetTitleLinesCount: Integer; stdcall; external 'chon100.dll';
      procedure cbSetClearBufMode(Mode: Integer); stdcall; external 'chon100.dll';
      function cbGetClearBufMode: Integer; stdcall; external 'chon100.dll';
  function RepeatCheck: Integer; stdcall; external 'chon100.dll';
  function ClearIndicator: Integer; stdcall; external 'chon100.dll';
  function ConnectKKM(Port: Integer): Integer; stdcall; external 'chon100.dll';
  procedure DisconnectKKM; stdcall; external 'chon100.dll';
  function GetDiscountMode: Integer; stdcall; external 'chon100.dll';           
      function GetErrorCode: Integer; stdcall; external 'chon100.dll';
  function GetErrorMsg: PChar; stdcall; external 'chon100.dll';
  function Feed(LineCount: Integer): Integer; stdcall; external 'chon100.dll';
  function GetBroughtSum(var Sum: Double): Integer; stdcall; external 'chon100.dll';
  function GetCashSum(var Sum: Double): Integer; stdcall; external 'chon100.dll';
  function GetKKMNum(var KKMNum: Integer): Integer; stdcall; external 'chon100.dll';
  function GetKLNum(var KLNum: Integer): Integer; stdcall; external 'chon100.dll';
  function GetNI(var NI: Double): Integer; stdcall; external 'chon100.dll';
  function GetRemovedQty(var Qty: Integer): Integer; stdcall; external 'chon100.dll';
  function GetRemovedSum(var Sum: Double): Integer; stdcall; external 'chon100.dll';
  function GetReturnedSum (var Sum: Double): Integer; stdcall; external 'chon100.dll';
  function GetReturnedSumOnSection (Section: Integer; var Sum: Double): Integer; stdcall; external 'chon100.dll';
  function GetSaleCountOnSection(Section: Integer; var SaleCount: Integer): Integer; stdcall; external 'chon100.dll';
  function GetSaleNum(var SaleNum: Integer): Integer; stdcall; external 'chon100.dll';
  function GetSalesSumOnSection (Section: Integer; var Sum: Double): Integer; stdcall; external 'chon100.dll';
  function GetSalesSumWithNDEC (var Sum: Double): Integer; stdcall; external 'chon100.dll';
  function GetSalesSumWithoutNDEC (var Sum: Double): Integer; stdcall; external 'chon100.dll';
  function GetKKMVers: Integer; stdcall; external 'chon100.dll';
  function Lock: Integer; stdcall; external 'chon100.dll';
  function PrintBarCode(Code: PChar; DigitFlag: Integer): Integer; stdcall; external 'chon100.dll';
  function ReadSaleFromKL(SaleNum: Integer; var Section, Credit, Discount: Integer; var Sum: Double): Integer; stdcall; external 'chon100.dll';
  procedure StartWaiting(StopFlag: Integer); stdcall; external 'chon100.dll';
  procedure StopWaiting; stdcall; external 'chon100.dll';
  procedure SetSupplierCode(Code: PChar); stdcall; external 'chon100.dll';
  function UnLock: Integer; stdcall; external 'chon100.dll';
  function WaitingStatus: Integer; stdcall; external 'chon100.dll';
  procedure SetChPrepareEvent(Ptr: TAppCheckPrepare); stdcall; external 'chon100.dll';
  procedure SetErrorEvent(Ptr: TAppError); stdcall; external 'chon100.dll';
  procedure SetQueryEvent(Ptr: TAppEvent); stdcall; external 'chon100.dll';
  procedure SetCloseCheckEvent(Ptr: TAppEvent); stdcall; external 'chon100.dll';





implementation

uses MainForm;



end.
