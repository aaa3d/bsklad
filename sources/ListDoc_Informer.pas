unit ListDoc_Informer;

interface

uses
  PopupListEx,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin,B_DBUtils,
  IBDatabase, IBCustomDataSet, Db, IBQuery, Menus, ExtCtrls, RxMemDS;

type
  TLIST_DOC_INFORMER = class(TForm)
    ToolBar1: TToolBar;
    BtnOpen: TToolButton;
    ToolButton8: TToolButton;
    BtnPropertis: TToolButton;
    ToolButton14: TToolButton;
    ToolButton16: TToolButton;
    BtnInterval: TToolButton;
    ToolButton1: TToolButton;
    StatusBar2: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    DOC_STATUS: TComboBox;
    ToolButton2: TToolButton;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBQuery1INFORMER_DATA_ID: TIntegerField;
    IBQuery1DOC_TEXT: TIBStringField;
    IBQuery1TM0: TDateTimeField;
    IBQuery1TM1: TDateTimeField;
    IBQuery1TM2: TDateTimeField;
    IBQuery1US_FIO0: TIBStringField;
    IBQuery1US_FIO1: TIBStringField;
    IBQuery1US_FIO2: TIBStringField;
    IBQuery1DOC_STATUS: TIntegerField;
    IBQuery1DOC_STATUS_DESC: TIBStringField;
    IBQuery1SKL_SHORT: TIBStringField;
    PopupMenu1: TPopupMenu;
    mnuSet1: TMenuItem;
    mnuSet2: TMenuItem;
    invis11: TMenuItem;
    invis21: TMenuItem;
    mnuSet3: TMenuItem;
    invis31: TMenuItem;
    Timer1: TTimer;
    IBQuery1DOC_ID: TIntegerField;
    IBQuery2: TIBQuery;
    N1: TMenuItem;
    N2: TMenuItem;
    IBQuery1shop_color: TIntegerField;
    IBQuery1status_color: TIntegerField;
    ToolButton3: TToolButton;
    old_list: TRxMemoryData;
    new_list: TRxMemoryData;
    old_listDOC_ID: TIntegerField;
    new_listDOC_ID: TIntegerField;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    btnAutoPrint: TCheckBox;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    US_FIO: TLabel;
    IBTransaction2: TIBTransaction;
    Button4: TButton;
    Button5: TButton;
    IBQuery1STATUS_TM: TDateTimeField;
    IBQuery1DOC_TM: TIBStringField;
    IBQuery1RN_US_ID: TIntegerField;
    IBQuery1US_FIO: TIBStringField;
    IBQuery1DOC_DATE: TDateTimeField;
    IBQuery1RN_SUMM: TFloatField;
    IBQuery1DOC_TYPE: TIBStringField;
    procedure BtnIntervalClick(Sender: TObject);
    procedure BtnPropertisClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure DOC_STATUSChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure invis11Click(Sender: TObject);
    procedure invis21Click(Sender: TObject);
    procedure invis31Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure IBQuery1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    dt1, dt2: TDateTime;
    can_refresh: boolean;
    ADD_DOC_ID: integer;
    procedure CM_MenuClosed(var msg: TMessage) ; message CM_MENU_CLOSED;
    procedure CM_EnterMenuLoop(var msg: TMessage) ; message CM_ENTER_MENU_LOOP;
    procedure CM_ExitMenuLoop(var msg: TMessage) ; message CM_EXIT_MENU_LOOP;


    procedure READY_COM_DATAMessage(var AMessage: TMessage); message
      gl_READY_COM_DATA;


  public
    procedure Refresh_List;
    { Public declarations }
  end;



implementation

uses DateInterval,OtgrRn, b_utils, Data1;

{$R *.DFM}


procedure TLIST_DOC_INFORMER.CM_EnterMenuLoop(var msg: TMessage) ;
begin
  can_refresh:=false;
end;

procedure TLIST_DOC_INFORMER.CM_ExitMenuLoop(var msg: TMessage) ;
begin
  can_refresh:=true;
end;

procedure TLIST_DOC_INFORMER.CM_MenuClosed(var msg: TMessage) ;
begin
  can_refresh:=true;
end;

procedure newDocBeep;
begin
  windows.Beep(700, 50);
   sleep(100);
   windows.Beep(700, 50);

   sleep(200);
   windows.Beep(600, 50);
   sleep(100);
   windows.Beep(600, 50);

   sleep(200);
   windows.Beep(700, 50);
   sleep(100);
   windows.Beep(700, 50);
end;

procedure TLIST_DOC_INFORMER.Refresh_List;
var id: integer;
beep_cnt: integer;
begin

  if can_refresh=false then
    exit;


  if  doc_status.DroppedDown then
    exit;

  Screen.Cursor:=crHourGlass;
  if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;


  Application.ProcessMessages;

  ibquery1.DisableControls;

  id := ibquery1.fieldbyname('INFORMER_DATA_ID').asinteger;

  old_list.LoadFromDataSet(ibquery1,0, lmCopy);
  new_list.EmptyTable;






  ibquery1.Close;
  ibquery1.ParamByName('dt1').asDateTime:=dt1;
  ibquery1.ParamByName('dt2').asDateTime:=dt2+1-SEKOND1;

  ibquery1.ParamByName('SHOW_STATUS').asInteger:=DOC_STATUS.ItemIndex;
  ibquery1.ParamByName('SHOP_ID').asInteger:=SHOPID;
  ibquery1.ParamByName('ADD_DOC_ID').asInteger:=ADD_DOC_ID;

  ibquery1.Open;

  while not ibquery1.Eof do
  begin
    if not (old_list.locate('DOC_ID', ibquery1.fieldbyName('doc_id').asInteger, [])) then
    begin
      new_list.Append;
      new_list.FieldByName('DOC_ID').asinteger:=ibquery1.fieldbyName('doc_id').asInteger;
      new_list.Post;
    end;


    ibquery1.next;
  end;

  ibquery1.First;


  ibquery1.Locate('INFORMER_DATA_ID', id, []);
  ibquery1.EnableControls;


  neW_list.First;

  beep_cnt:=0;
  while not new_list.Eof do
  begin

   inc(beep_cnt);
   if beep_cnt=1 then
     newDocBeep;

   if btnAutoprint.Checked then
   begin
//    b_dbutils.print_rn(new_list.FieldByName('DOC_ID').asInteger, false, false, true);

    PRINT_RN_MH3_SILENT(new_list.FieldByName('DOC_ID').asInteger);
   end;


   new_list.Next;
  end;


  ADD_DOC_ID:=-1;

  Screen.Cursor:=crDefault;
end;

procedure TLIST_DOC_INFORMER.BtnIntervalClick(Sender: TObject);
var old_state: boolean;
begin
  Application.createForm(TDate_interval,Date_Interval);
  Date_interval.Dt1.date:=DT1;
  Date_interval.Dt2.date:=DT2;
  Date_interval.Showmodal;
  if Date_interval.tag=2 then begin
    DT1:=Date_interval.Dt1.date;
    DT2:=Date_interval.Dt2.date;
    old_state:=btnAutoprint.Checked;
    btnAutoprint.Checked:=false;
    Refresh_list;
    btnAutoprint.Checked:=old_state;
  end;
  Date_interval.destroy;
  RxDbgrid1.setfocus;
end;

procedure TLIST_DOC_INFORMER.BtnPropertisClick(Sender: TObject);
var id: integer;
  doc_name: string;
begin
     SHOW_HISTORY_DOC('История по подбору документа '+doc_name,'INFORMER_DATA',id);
end;

procedure TLIST_DOC_INFORMER.ToolButton2Click(Sender: TObject);
var id: integer;
begin
        id:=ibquery1.fieldbyname('doc_id').asInteger;
  PRINT_RN(id);
end;

procedure TLIST_DOC_INFORMER.BtnOpenClick(Sender: TObject);
var id: integer;
begin

        id:=ibquery1.fieldbyname('doc_id').asInteger;
        Application.CreateForm(TOtgr_RN,Otgr_RN);

        Otgr_RN.tag:=ID;
        Otgr_RN.showModal;
        Otgr_RN.destroy;
end;

procedure TLIST_DOC_INFORMER.DOC_STATUSChange(Sender: TObject);
begin
btnAutoPrint.Checked:=false;
Refresh_List;
end;

procedure TLIST_DOC_INFORMER.FormCreate(Sender: TObject);
var mi: TMenuItem;
begin
  can_refresh:=false;
  doc_status.ItemIndex:=0;
  DT1:=date();
  DT2:=date();

  ADD_DOC_ID:=-1;



  ibquery2.SQL.Text:='select  cfg_set2,  (select kln_data.kln_short from kln_data(cfg.cfg_set2)) us_fio '+
  ' from cfg where cfg.cfg_name=''INFORMER_SKL_OTG_US'' and cfg_set1= '+inttostr(shopid);

  ibquery2.Open;
  while not ibquery2.Eof do
  begin
            mi:=TMenuItem.Create(popupMenu1);
            mi.Tag:=ibquery2.fieldByName('cfg_set2').asinteger;
            mi.OnClick:=invis11Click;
            mi.Caption:=ibquery2.fieldByName('us_fio').AsString;
            mnuSet1.Add(mi);

            mi:=TMenuItem.Create(popupMenu1);
            mi.Tag:=ibquery2.fieldByName('cfg_set2').asinteger;
            mi.OnClick:=invis21Click;
            mi.Caption:=ibquery2.fieldByName('us_fio').AsString;
            mnuSet2.Add(mi);

            mi:=TMenuItem.Create(popupMenu1);
            mi.Tag:=ibquery2.fieldByName('cfg_set2').asinteger;
            mi.OnClick:=invis31Click;
            mi.Caption:=ibquery2.fieldByName('us_fio').AsString;
            mnuSet3.Add(mi);
    ibquery2.Next;
  end;




  can_refresh:=true;
end;

procedure TLIST_DOC_INFORMER.RxDBGrid1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var point: TPoint;
begin
//  can_refresh:=false;
  exit;
  if ibquery1.FieldByName('doc_status').asinteger=4 then
    exit;


  point := RxDBGrid1.ClientToScreen(MousePos);
  PopupMenu1.Popup(point.X, point.Y);
  
end;

procedure TLIST_DOC_INFORMER.invis11Click(Sender: TObject);
var us_id: integer;
  id: integer;
begin
  can_refresh:=true;
  us_id:=TMenuItem(Sender).Tag;
  id:=ibquery1.fieldbyname('INFORMER_DATA_ID').asInteger;


  try
    IBSAVE_CLEAR;
    IBSAVE_ADD('DOC_STATUS', 1);
    IBSAVE_ADD('US_ID1', us_id);
    IBSAVE_DOC('INFORMER_DATA', id);
    Datamodule1.IBTransaction2.Commit;

  except
    Datamodule1.IBTransaction2.rollback;
  end;



  refresh_list;
end;

procedure TLIST_DOC_INFORMER.invis21Click(Sender: TObject);
var us_id: integer;
  id: integer;
begin
  can_refresh:=true;
  us_id:=TMenuItem(Sender).Tag;
  id:=ibquery1.fieldbyname('INFORMER_DATA_ID').asInteger;


  try
    IBSAVE_CLEAR;
    IBSAVE_ADD('DOC_STATUS', 2);
    IBSAVE_ADD('US_ID2', us_id);
    IBSAVE_DOC('INFORMER_DATA', id);
    Datamodule1.IBTransaction2.Commit;

  except
    Datamodule1.IBTransaction2.rollback;
  end;



  refresh_list;
end;

procedure TLIST_DOC_INFORMER.invis31Click(Sender: TObject);
var us_id: integer;
  id: integer;
begin
  can_refresh:=true;
  us_id:=TMenuItem(Sender).Tag;
  id:=ibquery1.fieldbyname('INFORMER_DATA_ID').asInteger;


  try
    IBSAVE_CLEAR;
    IBSAVE_ADD('DOC_STATUS', 3);
    IBSAVE_DOC('INFORMER_DATA', id);
    Datamodule1.IBTransaction2.Commit;

  except
    Datamodule1.IBTransaction2.rollback;
  end;



  refresh_list;
end;

procedure TLIST_DOC_INFORMER.Timer1Timer(Sender: TObject);
begin
  refresh_list;






end;

procedure TLIST_DOC_INFORMER.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if Field.fieldName='DOC_STATUS_DESC' then
  begin
    if ibquery1.FieldByName('status_COLOR').asinteger>0 then
      Background:=ibquery1.FieldByName('status_COLOR').asinteger;
  end;

  if Field.fieldName='DOC_TEXT' then
  begin
    Background:=ibquery1.FieldByName('SHOP_COLOR').asinteger;
  end;

end;

procedure TLIST_DOC_INFORMER.ToolButton3Click(Sender: TObject);
begin
  refresh_list;
end;

procedure TLIST_DOC_INFORMER.ToolButton6Click(Sender: TObject);
begin
        if (ibquery1.fieldbyname('doc_type').asString='RN') then
                PRINT_MH1_MH3(2, ibquery1.fieldbyname('doc_id').asInteger, 2);
        if (ibquery1.fieldbyname('doc_type').asString='PER') then
                PRINT_MH1_MH3(3, ibquery1.fieldbyname('doc_id').asInteger, 2);
end;

{
1. открыто окно списка накладных.
2а. поднесли наколадную к считывателю - она выбралась в списке.
2б. поднесли бэйдж - в панели выбралась фамилия и активировались кнопки
2с. нажали нужную кнопку

}

procedure TLIST_DOC_INFORMER.READY_COM_DATAMessage(var AMessage: TMessage);
var barcode_id: integer;
barcode_typ: integer;   //-1000 - РН, -2000 - бэйдж

ID: integer;

begin
  try

  
       barcode_id:=AMessage.WParam;
       barcode_typ:=AMessage.LParam;
       if (barcode_typ = -1000) then
       begin

            ADD_DOC_ID:=barcode_id;
            refresh_list;
            ADD_DOC_ID:=-1;
            ibquery2.Transaction.Active:=false;
            ibquery2.SQL.Text:='SELECT RN_PROW, rn_date FROM RN WHERE RN_ID=:RN_ID and bg_abs(doc_deleted)=0';
            ibquery2.ParamByName('RN_ID').asInteger:=barcode_id;

            ibquery2.open;
            if ibquery2.Eof then
            begin
              messbox('Накладная не найдена в системе. '+chr(13)+'Код '+inttostr(barcode_id)+chr(13)+'Запишите и сообщите программисту', 'ОШИБКА', 0);
            end
            else
            begin
              if ibquery2.fieldbyname('rn_prow').asinteger=0 then
              begin
                        messbox('Накладная не проведена. '+chr(13)+'Код '+inttostr(barcode_id)+chr(13)+'Запишите и сообщите программисту', 'ОШИБКА', 0);
              end
              else
              begin
                 //TO DO здесь можно открыть форму управления накладной
                 //или выделить ее
                ibquery1.DisableControls;
                ibquery1.First;

                if ( not ibquery1.Locate('DOC_ID', barcode_id, [])) then
                begin
                        messbox('Накладная не найдена в текущем отображении. '+chr(13)+'Код '+inttostr(barcode_id)+chr(13)+'Запишите и сообщите программисту', 'ОШИБКА', 0);
                end;

                ibquery1.EnableControls;


                US_FIO.Caption :=  'Поднесите бэйдж';
                US_FIO.tag:= 0;
                Button1.Enabled:=false;
                Button2.Enabled:=false;
                Button3.Enabled:=false;

              end
            end;

            ibquery2.Close;
        end;


       if (barcode_typ = -3000) then
       begin

            ADD_DOC_ID:=barcode_id;
            refresh_list;
            ADD_DOC_ID:=-1;
            ibquery2.Transaction.Active:=false;
            ibquery2.SQL.Text:='SELECT PER_PROW, per_date FROM PER WHERE PER_ID=:PER_ID';
            ibquery2.ParamByName('PER_ID').asInteger:=barcode_id;

            ibquery2.open;
            if ibquery2.Eof then
            begin
              messbox('Накладная не найдена в системе. '+chr(13)+'Код '+inttostr(barcode_id)+chr(13)+'Запишите и сообщите программисту', 'ОШИБКА', 0);
            end
            else
            begin
              if ibquery2.fieldbyname('per_prow').asinteger=0 then
              begin
                        messbox('Накладная не проведена. '+chr(13)+'Код '+inttostr(barcode_id)+chr(13)+'Запишите и сообщите программисту', 'ОШИБКА', 0);
              end
              else
              begin
                 //TO DO здесь можно открыть форму управления накладной
                 //или выделить ее
                ibquery1.DisableControls;
                ibquery1.First;

                if ( not ibquery1.Locate('DOC_ID', barcode_id, [])) then
                begin
                        messbox('Накладная не найдена в текущем отображении. '+chr(13)+'Код '+inttostr(barcode_id)+chr(13)+'Запишите и сообщите программисту', 'ОШИБКА', 0);
                end;

                ibquery1.EnableControls;


                US_FIO.Caption :=  'Поднесите бэйдж';
                US_FIO.tag:= 0;
                Button1.Enabled:=false;
                Button2.Enabled:=false;
                Button3.Enabled:=false;

              end
            end;

            ibquery2.Close;
        end;


        if (barcode_typ = -2000) then
        begin
            ibquery2.Transaction.Active:=false;
            ibquery2.SQL.Text:='SELECT KLN_FULL FROM KLN_DATA(:id)';
            ibquery2.ParamByName('id').asInteger:=barcode_id;

            ibquery2.open;
            if ibquery2.Eof then
            begin
              messbox('Пользователь не обнаружен в системе. '+chr(13)+'Код '+inttostr(barcode_id)+chr(13)+'Запишите и сообщите программисту', 'ОШИБКА', 0);
              US_FIO.Caption :=  'Пользователь не обнаружен в системе.';
              US_FIO.tag:= 0;



              Button1.Enabled:=false;
              Button2.Enabled:=false;
              Button3.Enabled:=false;
            end
            else
            begin
                //включить кнопки
                //вывести надпись/фамилию
                US_FIO.Caption :=  ibquery2.FieldByName('KLN_FULL').asString;
                US_FIO.tag:= barcode_id;

                Button1.Enabled:=(ibquery1.FieldByName('doc_status').asInteger= 0);
                Button2.Enabled:=(ibquery1.FieldByName('doc_status').asInteger= 1);
                Button3.Enabled:= (ibquery1.FieldByName('doc_status').asInteger= 1) or (ibquery1.FieldByName('doc_status').asInteger= 2);

                if (ibquery1.FieldByName('doc_status').asInteger= 0) then //автоматически брать в нгабор при поднесении бэйджа
                begin
                  US_FIO.Caption :=  ibquery2.FieldByName('KLN_FULL').asString + '.  Автовзятие в набор';
                  US_FIO.tag:= barcode_id;
                  Button1.Click;
                end


            end;

            

            ibquery2.Close;

        end;

  except
   on e: Exception do
     messbox(e.message, e.message, 0);
  end;



//  statusBar1.Panels[0].Text:='Ввод со сканера штрих кода';
//  statusBar1.Panels[1].Text:=gl_LAST_BAR_CODE;
end;

procedure TLIST_DOC_INFORMER.Button1Click(Sender: TObject);
var us_id: integer;
    id: integer;
begin
  us_id:=US_FIO.Tag;
  id:=ibquery1.fieldbyname('INFORMER_DATA_ID').asInteger;


  try
    IBSAVE_CLEAR;
    IBSAVE_ADD('DOC_STATUS', 1);
    IBSAVE_ADD('US_ID0', us_id);
    IBSAVE_DOC('INFORMER_DATA', id);
    Datamodule1.IBTransaction2.Commit;

  except
    Datamodule1.IBTransaction2.rollback;
  end;

  US_FIO.Caption :=  '';
  US_FIO.tag:= 0;
  Button1.Enabled:=false;
  Button2.Enabled:=false;
  Button3.Enabled:=false;


  refresh_list;
end;

procedure TLIST_DOC_INFORMER.Button2Click(Sender: TObject);
var us_id: integer;
    id: integer;
begin
  us_id:=US_FIO.Tag;
  id:=ibquery1.fieldbyname('INFORMER_DATA_ID').asInteger;


  try
    IBSAVE_CLEAR;
    IBSAVE_ADD('DOC_STATUS', 2);
    IBSAVE_ADD('US_ID1', us_id);
    IBSAVE_DOC('INFORMER_DATA', id);
    Datamodule1.IBTransaction2.Commit;

  except
    Datamodule1.IBTransaction2.rollback;
  end;

  US_FIO.Caption :=  '';
  US_FIO.tag:= 0;
  Button1.Enabled:=false;
  Button2.Enabled:=false;
  Button3.Enabled:=false;


  refresh_list;
end;

procedure TLIST_DOC_INFORMER.Button3Click(Sender: TObject);
var us_id: integer;
    id: integer;
begin
  us_id:=US_FIO.Tag;
  id:=ibquery1.fieldbyname('INFORMER_DATA_ID').asInteger;

           
  try
    IBSAVE_CLEAR;
    IBSAVE_ADD('DOC_STATUS', 3);
    if (ibquery1.FieldByName('doc_status').asInteger= 1) then
            IBSAVE_ADD('US_ID1', us_id);
    IBSAVE_ADD('US_ID2', us_id);
    IBSAVE_DOC('INFORMER_DATA', id);
    Datamodule1.IBTransaction2.Commit;

  except
    Datamodule1.IBTransaction2.rollback;
  end;

  US_FIO.Caption :=  '';
  US_FIO.tag:= 0;
  Button1.Enabled:=false;
  Button2.Enabled:=false;
  Button3.Enabled:=false;


  refresh_list;
end;

procedure TLIST_DOC_INFORMER.FormKeyPress(Sender: TObject; var Key: Char);
var old_state: boolean;
begin
  if KEY='-' then begin
     {Сдвигаем даты на одну раньше}
     DT1:=DT1-1;
     DT2:=DT2-1;
    old_state:=btnAutoprint.Checked;
    btnAutoprint.Checked:=false;
    Refresh_list;
    btnAutoprint.Checked:=old_state;
     Key:=#0;
  end;
  if KEY='+' then begin
     {Сдвигаем даты на одну раньше}
     DT1:=DT1+1;
     DT2:=DT2+1;
    old_state:=btnAutoprint.Checked;
    btnAutoprint.Checked:=false;
    Refresh_list;
    btnAutoprint.Checked:=old_state;
     Key:=#0;
  end;
end;

procedure TLIST_DOC_INFORMER.Button4Click(Sender: TObject);
var amessage: TMessage;
begin
        amessage.WParam := 521929149;
        amessage.LParam := -1000;

        READY_COM_DATAMessage(amessage);

end;

procedure TLIST_DOC_INFORMER.Button5Click(Sender: TObject);
var amessage: TMessage;
begin
          amessage.WParam := 2646704;
        amessage.LParam := -2000;

        READY_COM_DATAMessage(amessage);
end;

procedure TLIST_DOC_INFORMER.IBQuery1AfterScroll(DataSet: TDataSet);
begin
        US_FIO.Caption :=  'Поднесите бэйдж';
        US_FIO.tag:= 0;
        Button1.Enabled:=false;
        Button2.Enabled:=false;
        Button3.Enabled:=false;
end;

end.
