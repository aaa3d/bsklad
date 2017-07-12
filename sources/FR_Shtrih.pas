unit FR_Shtrih;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, AddIn_TLB, StdCtrls, ComCtrls, VCLUtils, Mask, ToolEdit,
  CurrEdit, b_utils, menus, IBDatabase, Db, IBCustomDataSet, IBQuery,
  RxRichEd, DBRichEd, RxLookup;

type TOperation=record
    opString: string;
    opPrice: currency;
    opQuantity: double;
    opEd: string;
end;

type FRM_KKM = record
    ID: integer;
	  FRM_ID: integer;
    SerialNumber: string;
    BAUD_RATE: integer;
    COM_NUM: integer;
    header: TStringList;
    footer: TStringList;
    end;
type PFRM_KKM = ^FRM_KKM;

type
  TFRShtrih = class(TForm)
    FR: TDrvFR;
    Label4: TLabel;
    Label5: TLabel;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    KKM_NAME: TRxDBLookupCombo;
    RxDBRichEdit1: TRxDBRichEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpSumm: TRxCalcEdit;
    NalSumm: TRxCalcEdit;
    DeliverySumm: TRxCalcEdit;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Report1: TButton;
    Report0: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    DataSource1: TDataSource;
    CutCheck: TButton;
    Edit1: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RxCalcEdit1: TRxCalcEdit;
    RxCalcEdit2: TRxCalcEdit;
    btnOpenDrawer: TButton;
    Button9: TButton;

    function RegisterServer(): boolean ;
    function Connect(GenException: boolean; RetryCount: integer=0):boolean;
    function ResultCodeDescription: string;
    procedure Disconnect;
    procedure SetPort(portNum: integer; portSpeed: integer);
    procedure PrintString(s: string; fontNum: integer);
    procedure Clean;
    function ECRFlagsToStr(NBits: Integer): string;
    function FMFlagsToStr(NBits: Integer): string;

    procedure AddOp(opString: string; opPrice: currency; opQuantity: double; opEd: string);

    procedure PrintHeader;
    procedure PrintFooter;
    procedure Check(Code: integer);
    procedure ExecuteOP(opType: integer);
    procedure WaitForComplete;
    procedure ReportWithCleaning;
    procedure ReportWithoutCleaning;
    procedure ReportTax;
    procedure SetSumm(summ: currency; NDSType: integer; CashType: integer);
    procedure CashIncome(summ: currency);
    procedure CashOutCome(summ: currency);
    procedure CheckOpenDocument;
    procedure ContinuePrint;
    procedure CancelCheck;

    function GetRegValue(reg: integer): double ;


    procedure CheckError(errCode: integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NalSummChange(Sender: TObject);
    procedure Report1Click(Sender: TObject);
    procedure Report0Click(Sender: TObject);
    procedure NalSummEnter(Sender: TObject);
    function Prepare():boolean;
    function GetFrmNum(_frm_id: integer):integer ;
    function Current():PFRM_KKM  ;
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure KKM_NAMEChange(Sender: TObject);
    procedure CutCheckClick(Sender: TObject);
    procedure btnOpenDrawerClick(Sender: TObject);
    procedure OpenDrawer;
    procedure Button9Click(Sender: TObject);

  private
    { Private declarations }
    arrFrmKKM: array [0..15] of FRM_KKM;
    cntFrmKKM: integer;

  public
    { Public declarations }

    DocName: string;
    Operations: TList;
    FRM_ID: integer;
    SkidSumm: double;
    DiskontNumber: string;
    lastTW_Name: string;
    skl_name: string;
    
  end;

function DllRegisterServer(): integer;stdcall;external 'DrvFR.DLL';	//Регистрирует сервер

var
  FRShtrih: TFRShtrih;


implementation
uses b_dbutils, Data1, Mainform, KKMADD, KKMSUB, FRSTATUS, WaitForm;
{$R *.DFM}

function TFRShtrih.Current() : PFRM_KKM;
var i: integer;
	found: boolean;
begin
    found := false;
    for i := 0 to cntFrmKKM-1 do
    if arrFrmKKM[i].FRM_ID=FRM_ID then
    begin
     result:=@(arrFrmKKM[i]);
     found := true;
     break;
    end;
    if not found then
    	raise Exception.Create('Нет подключенных кассовых аппаратов, которые могут выбивать чеки от лица указанной фирмы!');



end;

function TFRShtrih.GetFrmNum(_frm_id: integer):integer ;
var i: integer;
begin
result:=-1;
  for i := 0 to cntFrmKKM do
    if arrFrmKKM[i].FRM_ID=_frm_id then
    begin
     result:=i;
     break;
    end;

end;

function TFRShtrih.Prepare():boolean;		//Инициализация Штрих-ФР-К
var
   T:ansistring;
   n, m: integer;

   retryCnt: integer;

   SCANER_COM_PORT, SCANER_COM_PORT2, DISPLAY_COM_PORT: integer;


begin
 // процедура подключается к ККМ АМС-100Ф, запрашивает заголовок и подвал чека, результат TRUE,
 // если все прошло успешно

  cntFrmKKM := 0;

  Clean;

  
  if not IS_KKM then
  result:=false
  else
  begin

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_ID, CFG_SET2 FROM CFG WHERE CFG_NAME=''POS_SCANER_COM_PORT'' and CFG_BIG=:COMPUTER_NAME and CFG_SET1=:SHOP_ID');
     DataModule1.IbGetDefault.ParamByName('COMPUTER_NAME').asstring:=COMPUTERNAME;
     DataModule1.IbGetDefault.ParamByName('SHOP_ID').asinteger:=SHOPID;
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof
      then SCANER_COM_PORT:=0
     else
     begin
        SCANER_COM_PORT:=DataModule1.IbGetDefault.FieldByName('CFG_SET2').asinteger;
     end;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_ID, CFG_SET2 FROM CFG WHERE CFG_NAME=''POS_SCANER_COM_PORT2'' and CFG_BIG=:COMPUTER_NAME and CFG_SET1=:SHOP_ID');
     DataModule1.IbGetDefault.ParamByName('COMPUTER_NAME').asstring:=COMPUTERNAME;
     DataModule1.IbGetDefault.ParamByName('SHOP_ID').asinteger:=SHOPID;
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof
      then SCANER_COM_PORT2:=0
     else
     begin
        SCANER_COM_PORT2:=DataModule1.IbGetDefault.FieldByName('CFG_SET2').asinteger;
     end;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_ID, CFG_SET2 FROM CFG WHERE CFG_NAME=''DISPLAY_COM_PORT'' and CFG_BIG=:COMPUTER_NAME and CFG_SET1=:SHOP_ID');
     DataModule1.IbGetDefault.ParamByName('COMPUTER_NAME').asstring:=COMPUTERNAME;
     DataModule1.IbGetDefault.ParamByName('SHOP_ID').asinteger:=SHOPID;
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof
      then DISPLAY_COM_PORT:=0
     else
     begin
        DISPLAY_COM_PORT:=DataModule1.IbGetDefault.FieldByName('CFG_SET2').asinteger;
     end;


    Datamodule1.QrKKM.Close;
    Datamodule1.KKMTransaction.Active:=False;
    Datamodule1.QrKKM.SQL.Text := 'select * from list_kkm where SHOP_ID=:SHOP_ID AND COMP_NAME=:COMP_NAME';
    Datamodule1.QrKKM.ParambyName('SHOP_ID').asinteger:=SHOPID;
    Datamodule1.QrKKM.ParambyName('COMP_NAME').asstring:=SystemComputerName;

    Datamodule1.QrKKM.Open;

	while not Datamodule1.QrKKM.Eof do
    begin
      arrFrmKKM[cntFrmKKM].ID:=0;
      arrFrmKKM[cntFrmKKM].FRM_ID := Datamodule1.QrKKM.FieldByName('FRM_ID').asinteger;
      arrFrmKKM[cntFrmKKM].SerialNumber := Datamodule1.QrKKM.FieldByName('MODEL_NUM').asstring;
      arrFrmKKM[cntFrmKKM].header := TStringList.Create;
      arrFrmKKM[cntFrmKKM].footer := TStringList.Create;

      //1 - соединиться с параметрами из базы
      //2 - если не получилось, произвести полный поиск

      //1
      if ((((Datamodule1.QrKKM.FieldByName('COM').asinteger>0)
        and (SCANER_COM_PORT<>Datamodule1.QrKKM.FieldByName('COM').asinteger))
        and (SCANER_COM_PORT2<>Datamodule1.QrKKM.FieldByName('COM').asinteger))
        and (DISPLAY_COM_PORT<>Datamodule1.QrKKM.FieldByName('COM').asinteger))
         then  //есть сохраненные параметры
      //Пропускать порт сканера
      begin
          FRShtrih.SetPort(Datamodule1.QrKKM.FieldByName('COM').asinteger,Datamodule1.QrKKM.FieldByName('COM_SPEED').asinteger);
          Show_Wait('Подключение к'+arrFrmKKM[cntFrmKKM].SerialNumber+' по адресу COM'+Datamodule1.QrKKM.FieldByName('COM').asstring, 0);
          RetryCnt:=0;
          fr.Connect;
          while ((fr.ResultCode=-3) and (RetryCnt < 10)) do //порт занят другим приложением , делаем повторы 5 секунд
          begin
            inc(RetryCnt);
            Sleep(500);
            fr.Connect;
          end;

          if fr.ResultCode=0 then //нет ошибок подключения
          begin
          		  if(fr.SerialNumber=arrFrmKKM[cntFrmKKM].SerialNumber) then
                begin
                	arrFrmKKM[cntFrmKKM].COM_NUM:=Datamodule1.QrKKM.FieldByName('COM').asinteger;
                	arrFrmKKM[cntFrmKKM].BAUD_RATE:=Datamodule1.QrKKM.FieldByName('COM_SPEED').asinteger;
                  arrFrmKKM[cntFrmKKM].ID :=Datamodule1.QrKKM.FieldByName('CFG_ID').asinteger;
                end;
                FR.Disconnect;
          end
          else
          if fr.ResultCode=-3 then //порт все еще занят, задержка не помогла
            Messbox('COM порт COM'+Datamodule1.QrKKM.FieldByName('COM').asstring+' занят другим приложением' , messError, 0)
          else //показать все другие ошибки
            Messbox('COM порт COM'+Datamodule1.QrKKM.FieldByName('COM').asstring+': '+resultcodedescription , messError, 0);

      end;

      if arrFrmKKM[cntFrmKKM].ID=0 then    //ККМ не найдена, поиск нпо всем портам на всех скоростях
      for n:=1 to 20 do
      begin

        if N=SCANER_COM_PORT then
          continue; //пропускать порт сканера
        if N=SCANER_COM_PORT2 then
          continue; //пропускать порт сканера
        if N=DISPLAY_COM_PORT then
          continue; //пропускать порт дисплея покупателя


        Show_Wait('Поиск ФР '+arrFrmKKM[cntFrmKKM].SerialNumber+' по адресу COM'+inttostr(n), round(100*n/10));
        FR.ComNumber:=n;
        fr.connect;
        RetryCnt:=0;
        while ((fr.ResultCode=-3) and (RetryCnt < 10)) do //порт занят другим приложением , делаем повторы 0.5 секунд
          begin
            inc(RetryCnt);
            Sleep(100);
            fr.connect;
          end;
        if fr.ResultCode=-3 then //порт все еще занят, задержка не помогла
            Messbox('COM порт COM'+inttostr(n)+' занят другим приложением' , messError, 0);

        if fr.ResultCode<>-3 then //не было ошибок что порт занят
        for m := 0 to 6 do   //ищем на всех скоростях
        begin
          FR.BaudRate  := m;
          fr.Connect;

          if (FR.ResultCode=0 ) then
          begin
          		if(fr.SerialNumber=arrFrmKKM[cntFrmKKM].SerialNumber) then
                begin
                	arrFrmKKM[cntFrmKKM].COM_NUM:=n;
                	arrFrmKKM[cntFrmKKM].BAUD_RATE:=m;
                    arrFrmKKM[cntFrmKKM].ID :=Datamodule1.QrKKM.FieldByName('CFG_ID').asinteger;
                    break;
                end;
                FR.Disconnect;
          end
        end;


        if arrFrmKKM[cntFrmKKM].ID>0 then
        begin
          //save
          try
            IBSAVE_CLEAR;
            IBSAVE_ADD('CFG_SET1', Datamodule1.QrKKM.FieldByName('CFG_ID').asinteger);
            IBSAVE_ADD('CFG_SET2', n);
            IBSAVE_ADD('CFG_SET3', m);
            IBSAVE_ADD('CFG_NAME', '$$LIST_KKM_COM_SETTINGS');
            IBSAVE_DOC('CFG', Datamodule1.QrKKM.FieldByName('COM_SETTINGS_CFG_ID').asinteger);
            datamodule1.IbSaveSQL.Transaction.Commit;
          except
            datamodule1.IbSaveSQL.Transaction.Rollback;
          end;
          break;
        end;
      end;

      WAIT_FORM.hide;



      if ((arrFrmKKM[cntFrmKKM].ID=0) and (not global_NoFindKKM)) then
      	Messbox('Нет соединения с ККМ Штрих ФР К №'+arrFrmKKM[cntFrmKKM].SerialNumber, messError, 0)
      else

      	result:=true;	///найдена хоть одна ККМ





      inc(cntFrmKKM);
      Datamodule1.QrKKM.Next;
    end;

    for n := 0 to cntFrmKKM-1 do
    begin

     // Формируем заголовок и подвал (CFG_SET1 = 0)
     Datamodule1.KKMTransaction.Active:=False;
     Datamodule1.QrKKM.SQL.Text := 'select * from cfg where cfg_name="$CHECK.HEADER" '+
     ' and ((cfg_set1=:KKM_ID) or (cfg_set1=0)) order by cfg_set2';
     Datamodule1.QrKKM.parambyname('KKM_ID').asinteger:=arrFrmKKM[n].ID;
     Datamodule1.QrKKM.Open;
      // Формируем заголовок

      arrFrmKKM[n].header.Clear;
      arrFrmKKM[n].footer.Clear;
	  while not Datamodule1.QrKKM.Eof do
      begin

        if Datamodule1.QrKKM.fieldbyname('CFG_set3').asinteger=1 then m:=1 else m:=2;

        T:=copy(Datamodule1.QrKKM.fieldbyname('CFG_VALUE').asstring, 2, length(Datamodule1.QrKKM.fieldbyname('CFG_VALUE').asstring));

        if Datamodule1.QrKKM.fieldbyname('CFG_set1').asinteger=0 then
          arrFrmKKM[n].footer.Add(inttostr(m)+T)
        else
          arrFrmKKM[n].header.Add(inttostr(m)+T);


        Datamodule1.QrKKM.next;
      end;

    end;






    Datamodule1.KKMTransaction.Active:=False;

  end;

  OutKkmError;
end;

function TFRShtrih.RegisterServer:boolean ;
begin
result:=true;
  try
	DllRegisterServer;
  except
  end;
end;

function TFRShtrih.FMFlagsToStr(NBits: Integer): string;
const BitStr:array[0..7,False..True]of string=(
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<не введена>','<введена>'),
  ('<нет>','<есть>'),
  ('< <80% >','< >80% >'),
  ('<корректна>','<повреждена>'),
  ('<закрыта>','<открыта>'),
  ('<не кончились>','<кончились>')
  );
begin
  Case NBits of
    0: Result := BitStr[0,Boolean(FR.FM1IsPresent)];
    1: Result := BitStr[1,Boolean(FR.FM2IsPresent)];
    2: Result := BitStr[2,Boolean(FR.LicenseIsPresent)];
    3: Result := BitStr[3,Boolean(FR.FMOverflow)];
    4: Result := BitStr[4,Boolean(FR.IsBatteryLow)];
    5: Result := BitStr[5,Boolean(FR.IsLastFMRecordCorrupted)];
    6: Result := BitStr[6,Boolean(FR.IsFMSessionOpen)];
    7: Result := BitStr[7,Boolean(FR.IsFM24HoursOver)];
    else Result := 'Неправильный номер бита';
  end;
end;


function TFRShtrih.ECRFlagsToStr(NBits: Integer): string;

const BitStr:array[0..15,False..True]of string=(
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<0 знаков>','<2 знака>'),
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<поднят>','<опущен>'),
  ('<поднят>','<опущен>'),
  ('<опущена>','<поднята>'),
  ('<закрыт>','<открыт>'),
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<нет>','<да>'),
  ('<6 знаков>','<3 знака>'));
begin
  Case NBits of
    0: Result := BitStr[0,Boolean(FR.JournalRibbonIsPresent)];
    1: Result := BitStr[1,Boolean(FR.ReceiptRibbonIsPresent)];
    2: Result := BitStr[3,Boolean(FR.SlipDocumentIsMoving)];
    3: Result := BitStr[2,Boolean(FR.SlipDocumentIsPresent)];
    4: Result := BitStr[4,Boolean(FR.PointPosition)];
    5: Result := BitStr[5,Boolean(FR.EKLZIsPresent)];
    6: Result := BitStr[6,Boolean(FR.JournalRibbonOpticalSensor)];
    7: Result := BitStr[7,Boolean(FR.ReceiptRibbonOpticalSensor)];
    8: Result := BitStr[8,Boolean(FR.JournalRibbonLever)];
    9: Result := BitStr[9,Boolean(FR.ReceiptRibbonLever)];
    10: Result := BitStr[10,Boolean(FR.LidPositionSensor)];
    11: Result := BitStr[11,Boolean(FR.isDrawerOpen)];
    12: Result := BitStr[12,Boolean(FR.isPrinterRightSensorFailure)];
    13: Result := BitStr[13,Boolean(FR.isPrinterLeftSensorFailure)];
    14: Result := BitStr[14,Boolean(FR.IsEKLZOverflow)];
    15: Result := BitStr[15,Boolean(FR.QuantityPointPosition)];
    else Result := 'Неправильный номер бита';
  end;
end;


procedure TFRShtrih.CheckOpenDocument;
begin
//проверить статус ФР, не открытый ли у него чек
  fr.GetShortECRStatus;
  if (fr.ECRMode = 8) then
    begin
      CheckError(fr.CheckSubTotal);
      case msgbox('Ошибка фискального регистратора','На фискальном регистраторе окрыт документ на сумму ' + floattostr(fr.Summ1)+'р.'
      +char(13)+'Его можно отменить [Отмена] или завершить [ОК]',MB_OKCANCEL) of
      mrOK:  begin
             	fr.StringForPrinting:='';//очистка строки для печати, т.к. она напечатается при закрытии чека
             	CheckError(fr.CloseCheck);		//если аборт - исключение
             	WaitForComplete;  //ждем окончания последней операции
  	     		PrintFooter;	    //печатаем подвал
  	     		WaitForComplete;
  	     		fr.StringQuantity:=2+2;	//проматывем документ, ожидаем окончания промотки, отрезаем чек
             	CheckError(fr.FeedDocument);
       	     	WaitForComplete;
  	     		CheckError(fr.CutCheck);
             end;

      mrCANCEL:
      	     begin
              	CheckError(fr.CancelCheck);
              	WaitForComplete;
                fr.StringQuantity:=1;
	      		CheckError(fr.FeedDocument);
  	      		WaitForComplete;
  	      		CheckError(fr.CutCheck);
             end;
      end;
 
    end;
end;

procedure TFRShtrih.CashIncome(summ: currency);
begin

   fr.Password:=30;
   fr.summ1:=summ;
   Connect(true);
   CheckOpenDocument;
   printheader;
   checkError(fr.CashIncome);
   WaitForComplete;
   fr.StringQuantity:=4;	//проматывем документ, ожидаем окончания промотки, отрезаем чек
   fr.FeedDocument;
   WaitForComplete;
   CheckError(fr.CutCheck);

   Disconnect;
end;
procedure TFRShtrih.CashOutCome(summ: currency);
begin
   fr.Password:=30;
   fr.summ1:=summ;
   Connect(true);
   CheckOpenDocument;
   printheader;
   checkError(fr.CashOutcome);
   WaitForComplete;
   fr.StringQuantity:=4;	//проматывем документ, ожидаем окончания промотки, отрезаем чек
   fr.FeedDocument;
   WaitForComplete;
   CheckError(fr.CutCheck);

   Disconnect;
end;

procedure TFRShtrih.SetSumm(summ: currency; NDSType: integer; CashType: integer);
begin
   fr.summ1:=0;
   fr.summ2:=0;
   fr.summ3:=0;
   fr.summ4:=0;
   fr.Tax1:=0;
   fr.Tax2:=0;
   fr.Tax3:=0;
   fr.Tax4:=0;

   if (CashType=1) then
   begin
	fr.summ2:=summ;
   end
   else
	fr.summ1:=summ;

   if (NDSType=1 ) then
   begin
	fr.Tax1:=NDSType;
   end;
   if (NDSType=-1) then    	//НДС 20%
   begin
	fr.Tax1:=2;
   end;


end;

function TFRShtrih.ResultCodeDescription: string;
begin
result := FR.ResultCodeDescription;
end;

procedure TFRShtrih.Check(Code: integer);
begin
  if (Code <> 0) then
    raise Exception.Create(fr.ResultCodeDescription);


end;

function TFRShtrih.Connect(GenException: boolean; RetryCount: integer): boolean;
var r: integer;
	n, m: integer;
    s: string;
    fullCnt: integer;

begin
// result:=false;
// if GenException then //так соединяется только при процедурах печати. выдает ошибку и вылетает
//   begin

//   msgbox('Connect to '+IntToStr(current^.FRM_ID), 'sdf', 0);

   if not global_nofindkkm  then
   begin


     FRShtrih.SetPort(current^.COM_NUM, current^.BAUD_RATE);
    if arrFrmKKM[GetFrmNum(FRM_ID)].ID =0 then
    	raise Exception.Create('ККМ не подключен или был неверно проинициализирован при запуске системы');


      fr.Connect;
      fullCnt:=RetryCount;
      while ((RetryCount>0) and (fr.resultCode =-3)) do //порт занят другим приложением
      begin
          Show_Wait('Подключение к ФР '+arrFrmKKM[cntFrmKKM].SerialNumber, round((fullCnt - retryCount)*100 / fullCnt));
          Application.ProcessMessages;
          Sleep(1000);

          fr.Connect;
          RetryCount:=RetryCount-1;
      end;

      WAIT_FORM.hide;

      if ((fr.ResultCode<>0) and (GenException ))then
        CheckError(fr.resultCode);

// 	    CheckError(FR.Connect);
//        result:=true;
//    FR.CutType:=true;
//   end
//   else
//   begin
//    KKM_FOUND:=false;
//
//
//   end;
   end
   else
    Result:=True;

end;

procedure TFRShtrih.Disconnect;
begin
// sb1.Panels[0].Text:='Завершение соединия с ФР...';
 FR.Disconnect;
// sb1.Panels[0].Text:='Соединие завершено с ФР...';
end;


procedure TFRShtrih.SetPort(portNum: integer; portSpeed: integer);
begin
   FR.ComNumber:=portNum;
   FR.BaudRate  := portSpeed;
end;

procedure TFRShtrih.PrintString(s: string; fontNum: integer);
var n: integer;
    ss: string;
begin
n:=36;
if ((fontNum=2) or (fontNum=4)) then n:=18;
if (fontNum=5) then n:=40;
FR.Password:=30;
FR.FontType := fontNum;
FR.UseJournalRibbon:=true;
FR.UseReceiptRibbon:=true;

    while ((length(s) > 0) ) do
     begin
       	ss:=copy(s, 1, n);
       	FR.StringForPrinting := ss;
  		CheckError(FR.PrintStringWithFont);
       	s:=copy(s, n+1, length(s));
     end;
end;

function TFRShtrih.GetRegValue(reg: integer): double ;
begin
      fr.RegisterNumber:=reg;
      fr.GetCashReg;

      result:= fr.ContentsOfCashRegister;
end;

procedure TFRShtrih.ExecuteOP(opType: integer);
var i: integer;
    op: ^TOperation;
    s: string;
    d: extended;
    summStr: string;
    quantityStr: string;
    lll: string;
begin
  try
//проверим, достаточно ли денег вносится в кассу

  d := fr.summ1+fr.summ2;
    if (d < OpSumm.Value) then
    begin
      if fr.Summ1 > 0 then
          fr.Summ1 := Opsumm.Value
      else if fr.Summ2 > 0 then
          fr.Summ2 := Opsumm.Value;
{
      24.05.2007 - при продаже по карте было удваивание суммы приписью и при пробитии.
      else
          fr.Summ1 := Opsumm.Value;
}

//21-07-2011      messbox('Недостаточно денег. Сообщите программисту номер документа. Чек будет выведен', 'Некритическая ошибка', 0);
    end;

    //ПРОВЕРИТЬ, ЕСЛИ ЭТО ВОЗВРАТ, ЧТО В КАССЕ ДОСТАТОЧНО ДЕНЕГ
    if opType=2 then
    begin
      fr.RegisterNumber:=241;
      fr.GetCashReg;

      if fr.ContentsOfCashRegister< d then
      begin
        messbox('Недостаточно денег для осуществления возврата.'+chr(13)+'В кассе '+floattostr(fr.ContentsOfCashRegister)+', надо вернуть '+floattostr(d), 'Некритическая ошибка', 0);
        exit;
      end;

    end;


    summStr := Format(' %.2f', [opsumm.value]);


  if not global_NoFindKKM then CheckOpenDocument;

  if not global_NoFindKKM then fr.GetShortECRStatus;
  if not global_NoFindKKM then if (fr.ECRMode = 8) then
   raise Exception.Create(fr.ResultCodeDescription);


  //Печатаем заголовок чека
  if not global_NoFindKKM then printheader;		//внутренний анализ ошибок  , если что - исключение
  if not global_NoFindKKM then PrintString(DocName + summStr, 1);

//  WaitForComplete;

  fr.Password:=30;	//пароль администратора
  fr.CheckType:=opType; //тип чека: 0 - продажа, 1 - возврат продажи, 2 - покупка, 3 - возврат покупки
  if not global_NoFindKKM then CheckError(fr.OpenCheck);         //Открываем чек , если что - исключение

  for i := 0 to Operations.Count-1 do
   begin
    op := Operations[i];


    if op.opEd<>'' then
    begin

      quantityStr:=formatfloat(' 0.0###', op.opQuantity);
      quantityStr:= quantityStr + ' '+op.opEd+' по '+formatfloat('0.00 руб', op.opPrice);
      quantityStr:='..........................................'+quantityStr;
      quantityStr:= copy(quantityStr, length(quantityStr) - 35, 36);

    end;
    
    fr.Price := op.opPrice*op.opQuantity;
    fr.quantity:=1;
    fr.StringForPrinting:=op.opString;
    s := op.opString;


    //Печатаем строки начала наименования товара
    //в конце устанавливаем конец строки
    while length(s)> 36 do
     begin
         fr.StringForPrinting := copy(s, 1, 36);
         if not global_NoFindKKM then CheckError(fr.PrintString);

         s:=copy(s, 37, length(s));
     end;
//     WaitForComplete;


    //Хвост строки
    fr.StringForPrinting := copy(s, 1, 36);
    if op.opEd<>'' then
    begin

      CheckError(fr.PrintString);

      //Здесь печатаем  строку .............17.3245 кв.м Х 189.00 руб
      fr.StringForPrinting := copy(quantityStr, 1, 36);
  //    CheckError(fr.PrintString);
    end;



    //в зависимости от типа чека выбираем тип операции
    if not global_NoFindKKM then
    case opType of
    0: CheckError(fr.Sale);
    2: CheckError(fr.ReturnSale);
    1: CheckError(fr.Buy);
    3: CheckError(fr.ReturnBuy);
    4: CheckError(fr.RepeatDocument);
    end;
//    WaitForComplete;
   end;




//  fr.summ1:=NalSumm.Value; //вносим в ФР наличные деньги, чтобы сдачу посчитал
  fr.StringForPrinting:='';//очистка строки для печати, т.к. она напечатается при закрытии чека
  
  if not global_NoFindKKM then CheckError(fr.CloseCheck);		//если аборт - исключение

  if not global_NoFindKKM then WaitForComplete;  //ждем окончания последней операции




  if not global_NoFindKKM then PrintFooter;	    //печатаем подвал

  lll:=' ';
  if (length(lasttw_Name) > 1)  then
        lll := lastTW_Name[1];
  PrintString(lll, 1);

//  WaitForComplete;
  fr.StringQuantity:=2+ 2;	//проматывем документ, ожидаем окончания промотки, отрезаем чек
  fr.FeedDocument;
  if not global_NoFindKKM then WaitForComplete;
  if not global_NoFindKKM then CheckError(fr.CutCheck);

  except
    on E: Exception do
      begin
         MsgBox('Ошибка фискального регистратора',e.message, MB_OK);
      end;
  end;




end;



procedure TFRShtrih.WaitForComplete;
var tickCount: integer;
begin
  tickCount:=0;
  fr.GetShortECRStatus;
  while (fr.ECRAdvancedMode >0) do
  begin
         if (fr.ResultCode > 0) then
          begin
        	msgbox('Ошибка',  FR.ResultCodeDescription, 0);
         end;

         if (tickCount > 100) then
         begin         
        	msgbox('Ошибка',  FR.ResultCodeDescription, 0);
                tickCount:=0;
         end;

        fr.GetShortECRStatus;
        delay(10);
        inc(tickCount);
  end;
end;

procedure TFRShtrih.PrintHeader;
var i: integer;
begin

  for i := 0 to Current^.header.Count-1 do
   PrintString(copy(current^.header[i], 2, length(Current^.header[i])-1), strtoint(copy(Current^.header[i], 1, 1)));


end;


procedure TFRShtrih.CheckError(errCode: integer);
begin
   if (errCode <> 0) then
   begin

	if (errCode<>107) then
        	raise Exception.Create('Описание ошибки: '+FR.ResultCodeDescription+char(13)+'Режим: '+FR.ECRModeDescription+char(13)+'Подрежим: '+FR.ECRAdvancedModeDescription);

        if (errCode=107) then	//клнчилась бумага
        while  ((FR.ECRAdvancedMode = 1) or (FR.ECRAdvancedMode = 2))   do	//кончилась бумага, ждем пока вставят
         begin
          msgBox('Ошибка фискального регистратора', 'Кончилась лента. '+char(13)+'Вставьте новую ленту и нажмите [ОК]', MB_OK);
          CheckError(FR.GetShortECRStatus);
          if  (FR.ECRAdvancedMode = 3) then	//после окончания бумаги
          begin
              CheckError(FR.ContinuePrint);
          end;
         end;

   end;

   if Current^.SerialNumber <> fr.SerialNumber then
   		raise Exception.Create('Описание ошибки: К COM'+inttostr(current^.COM_NUM)+' подключен неверный кассовый аппарат. Должен быть подключен аппарат с зав. номером '+Current^.SerialNumber+', а подключен '+fr.SerialNumber);




end;

procedure TFRShtrih.PrintFooter;
var i: integer;
begin


  PrintString('  ', 1);
  if (fr.summ1=0) then
    PrintString(b_utils.left('!!! БЕЗНАЛИЧНАЯ ОПЛАТА !!!', 36), 1);



  PrintString(b_utils.left('Кассир: '+CASHIER_NAME+'___________________', 36), 1);
  if SkidSumm>0.01 then
    PrintString('Сумма скидок: '+ formatfloat('0.00 руб', SkidSumm), 1);
  if DiskontNumber<>'' then
    PrintString(DiskontNumber, 1);

  PrintString('Итого: '+rub_Char(fr.summ1+fr.summ2), 1);



  for i := 0 to Current^.footer.Count-1 do
   PrintString(copy(current^.footer[i], 2, length(Current^.footer[i])-1), strtoint(copy(Current^.footer[i], 1, 1)));


{    PrintString(' ', 1);
    PrintString(' ', 1);
PrintString('      АКЦИЯ!', 2);
PrintString('        С 19 по 31 октября', 1);
PrintString('     Олимпийские распродажи', 1);
PrintString('   Ламинат 59.90, Плитка 7.98', 1);
PrintString('     Унитаз-компакт 1990.00', 1);
}


if skl_name<>'' then
    PrintString(skl_name, 2);
PrintString('   WWW.727282.RU', 2);
//    PrintString(' ', 1);

  SkidSumm:=0;
  DiskontNumber:='';
end;
                                         
procedure TFRShtrih.AddOp(opString: string; opPrice: currency; opQuantity: double; opEd: string);
var op: ^TOperation;
begin

   new(op);


   op.opString := inttostr(Operations.Count+1)+'. '+ opString;
   op.opPrice := opPrice;
   op.opQuantity := opQuantity;
   op.opEd:= opEd;
   Operations.Add(op);

   opSumm.Value := opSumm.Value + (op.opPrice*op.opQuantity);
   nalSumm.Value := opSumm.Value;

   lastTW_Name := opString;

end;

procedure TFRShtrih.FormCreate(Sender: TObject);
begin
    Operations := TList.Create;

end;

procedure TFRShtrih.FormDestroy(Sender: TObject);
var i: integer;
begin

  for i := 0 to cntFrmKKM do
  begin
   	ArrFrmKKM[i].header.Free;
    ArrFrmKKM[i].footer.Free;
  end;
  Operations.Free;
end;

procedure TFRShtrih.NalSummChange(Sender: TObject);
begin
	DeliverySumm.Value := NalSumm.Value - OpSumm.Value;
end;



procedure TFRShtrih.Clean;
var i: integer;
    op: ^TOperation;
begin


   for i := 0 to Operations.Count-1 do
   begin
    op := Operations[i];
    dispose(op);
   end;

   opSumm.value:=0;

   Operations.Clear;
   FR.Disconnect;
end;

procedure TFRShtrih.ReportWithCleaning;
var val193, val195: string;
v193, v195: double;
begin
Connect(true);

v193 := GetRegValue(193);
v195 := GetRegValue(195);
val193 := floattostr(v193);
val195 := floattostr(v195);

CheckOpenDocument;
printheader;
CheckError(fr.PrintReportWithCleaning);
WaitForComplete;

self.PrintString('5 = ' +val193, 1);
self.PrintString('7 = ' +val195, 1);
self.PrintString('5-7 = ' +floattostr(v193 - v195) , 1);
self.PrintString('   ', 1);

delay(1000);
WaitForComplete;
fr.StringQuantity:=4;	//проматывем документ, ожидаем окончания промотки, отрезаем чек
fr.FeedDocument;
WaitForComplete;
CheckError(fr.CutCheck);
Disconnect;
end;

procedure TFRShtrih.ReportTax;
begin
Connect(true);
CheckOpenDocument;
printheader;
CheckError(fr.PrintTaxReport);
WaitForComplete;
fr.StringQuantity:=4;	//проматывем документ, ожидаем окончания промотки, отрезаем чек
fr.FeedDocument;
WaitForComplete;
CheckError(fr.CutCheck);
Disconnect;
end;


procedure TFRShtrih.ReportWithoutCleaning;
var val193, val195: string;
v193, v195: double;
begin
Connect(true);
CheckOpenDocument;
printheader;
CheckError(fr.PrintReportWithoutCleaning);
WaitForComplete;

v193 := GetRegValue(193);
v195 := GetRegValue(195);
val193 := floattostr(v193);
val195 := floattostr(v195);
self.PrintString('5 = ' +val193, 1);
self.PrintString('7 = ' +val195, 1);
self.PrintString('5-7 = ' +floattostr(v193 - v195) , 1);
self.PrintString('   ', 1);

fr.StringQuantity:=4;	//проматывем документ, ожидаем окончания промотки, отрезаем чек
fr.FeedDocument;
WaitForComplete;
CheckError(fr.CutCheck);
Disconnect;
end;

procedure TFRShtrih.Report1Click(Sender: TObject);
begin
    KKM_NAME.enabled:=false;
    try
    ReportWithoutCleaning;
    finally
	    KKM_NAME.enabled:=true;
      fr.Disconnect;
    end;
end;

procedure TFRShtrih.Report0Click(Sender: TObject);
begin
	if (Messbox('Снять сменный отчет с гашением?',MessSubmit,4+48+256)=6) then
    begin

    KKM_NAME.enabled:=false;
    try
    ReportWithCleaning;
    finally
    KKM_NAME.enabled:=true;
    fr.Disconnect;
    end;
    end;
end;

procedure TFRShtrih.NalSummEnter(Sender: TObject);
begin
	nalSumm.SelectAll;
end;

procedure TFRShtrih.CancelCheck;
begin
  Connect(true);
  CheckError(fr.SysAdminCancelCheck);
  Disconnect;
  Clean;
end;


procedure TFRShtrih.ContinuePrint;
begin
    Connect(True);
	CheckError(fr.continuePrint);
    Disconnect;
end;


procedure TFRShtrih.FormShow(Sender: TObject);
begin

    ibquery1.Close;
  	ibtransaction1.Active:=False;
    ibquery1.parambyname('shop_id').asinteger := SHOPID;
    ibquery1.parambyname('comp_name').asstring := SystemComputerName;

    ibquery1.Open;
    ibquery1.First;
    KKM_NAME.Value := ibquery1.FieldByname('FRM_ID').asstring;
    FRM_ID := strtoint('0'+KKM_NAME.value);
    KKM_NAME.Enabled:=True;


end;

procedure TFRShtrih.Button3Click(Sender: TObject);
begin
    KKM_NAME.enabled:=false;
    try
	ReportTax;
    finally
    KKM_NAME.enabled:=true;
    fr.Disconnect;
    end;    
end;

procedure TFRShtrih.Button4Click(Sender: TObject);
begin
    application.createform(TKKM_ADD,KKM_ADD);
     KKM_ADD.showmodal;
     if KKM_ADD.tag=2 then begin
        if MODEL_KKM=4 then begin
          CashIncome(KKM_ADD.KKM_SUMM.value);
          main_form.GetStatusKKM;
        end;

     end;
     KKM_ADD.destroy;
     fr.Disconnect;
end;

procedure TFRShtrih.Button5Click(Sender: TObject);
begin
     application.createform(TKKM_SUB,KKM_SUB);
     KKM_SUB.showmodal;
     if KKM_SUB.tag=2 then begin
        if MODEL_KKM=4 then
        begin
          CashOutCome(KKM_SUB.KKM_SUMM.value);
          main_form.GetStatusKKM;
        end;
     end;
     KKM_SUB.destroy;
     fr.Disconnect;
end;

procedure TFRShtrih.Button6Click(Sender: TObject);
begin
  application.createForm(TFR_STATUS,FR_STATUS);
  FR_STATUS.showModal;
  FR_STATUS.destroy;
end;

procedure TFRShtrih.Button7Click(Sender: TObject);
begin
	ContinuePrint;
end;

procedure TFRShtrih.Button8Click(Sender: TObject);
begin
	CancelCheck;
end;

procedure TFRShtrih.KKM_NAMEChange(Sender: TObject);
begin
	FRM_ID := strtoint('0'+KKM_NAME.value);
end;

procedure TFRShtrih.CutCheckClick(Sender: TObject);
begin
  Connect(true);
  fr.StringQuantity:=2+ 2;	//проматывем документ, ожидаем окончания промотки, отрезаем чек
  fr.FeedDocument;
  WaitForComplete;
  CheckError(fr.CutCheck);
  Disconnect;
end;

procedure TFRShtrih.btnOpenDrawerClick(Sender: TObject);
begin
   OpenDrawer;
end;

procedure TFRShtrih.OpenDrawer;
var n, oldFRM: Integer;
begin
   fr.Disconnect;
   oldFRM := FRM_ID;
   for n := 0 to cntFrmKKM-1 do
    begin

     FRM_ID := arrFRMKKM[n].FRM_ID;

     Connect(false);
     fr.OpenDrawer;
     fr.Disconnect;
   end;

   FRM_ID := oldFRM;

end;

procedure TFRShtrih.Button9Click(Sender: TObject);
begin
  Connect(true);
  CheckError(fr.InterruptTest);
  Disconnect;
  Clean;
end;

end.
