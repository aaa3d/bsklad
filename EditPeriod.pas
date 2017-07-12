unit EditPeriod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DBUtils, Mask, ToolEdit, StdCtrls, Menus, ComCtrls,
  ToolWin, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TEdit_PERIOD = class(TForm)
    ToolBar1: TToolBar;
    BtnSave: TToolButton;
    PopupMenu1: TPopupMenu;
    MnSave: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    USGROUP_NAME: TEdit;
    OLD_DATE: TDateEdit;
    NEW_DATE: TDateEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label4: TLabel;
    WHI: TEdit;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure BtnSaveClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_PERIOD: TEdit_PERIOD;

implementation

{$R *.DFM}

procedure TEdit_PERIOD.BtnSaveClick(Sender: TObject);
var
   NEWID:integer;
   R:double;
   DT1,DT2,dt:tdatetime;
begin
  if trim(Whi.text)='' then Messbox('Не указана причина смены даты закрытия периода!',MessSystem,48) else begin
     // Запрашиваем две даты - закрытие периода администратором и закрытие периода директором
     // Запросили административную дату
     WorkTransaction.Active:=false;
     OPEN_SQL(QueryWork,'select min(date_value) as date_value from cfg where cfg_name="$CONST_CLOSE_PERIOD_ADM" and cfg_set1=2');
     if QueryWork.eof then dt1:=encodedate(1990,1,1) else dt1:=QueryWork.fieldByname('date_value').asdatetime;
     // Запросили дату директора
     WorkTransaction.Active:=false;
     OPEN_SQL(QueryWork,'select min(date_value) as date_value from cfg where cfg_name="$CONST_CLOSE_PERIOD_DIR" and cfg_set1=2');
     if QueryWork.eof then dt2:=encodedate(1990,1,1) else dt2:=QueryWork.fieldByname('date_value').asdatetime;
     if ((new_date.date+1)<dt1) or ((new_date.date+1)<dt2) then begin
       if dt1>dt2 then dt:=dt1 else dt:=dt2;
       messbox('Нельзя открыть период датой раньше, чем '+date_sokr(dt)+' !',MessSystem,48);
     end else begin
       // смена даты разрешена!
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       Try
          IBSAVE_CLEAR;
          IBSAVE_ADD('PERIOD_CLOSE',strtodatetime(datetostr(NEW_DATE.date)+' 23:59:59'));
          IBSAVE_ADD('US_ID',USERID);
          IBSAVE_ADD('MESS','Закрыт по '+date_sokr(NEW_DATE.date)+'. '+WHI.text);
          IBSAVE_ADD('USGROUP_ID',EDIT_PERIOD.tag);
          NEWID:=IBSAVE_DOC('PERIOD',-1);
          if NEWID<0 then r:=Sqrt(-1);
          Datamodule1.IBTransaction2.Commit;
          Datamodule1.IBTransaction2.Active:=False;
          TAG:=-NEWID;
          close;
       Except
          Datamodule1.IBTransaction2.Rollback;
          Messbox('Ошибка при сохранении новой даты закрытия периода!',MessError,16);
       End;
       Datamodule1.IBTransaction2.Active:=False;
     end;
  end;
end;

procedure TEdit_PERIOD.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

end.
