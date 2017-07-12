unit PrintKKM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit,b_utils,b_dbutils,VclUtils;

type
  TPRINT_KKM = class(TForm)
    Label1: TLabel;
    MON1: TRxCalcEdit;
    MON2: TRxCalcEdit;
    Label2: TLabel;
    MON3: TRxCalcEdit;
    Label3: TLabel;
    procedure MON2Change(Sender: TObject);
    procedure MON2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
  private
    { Private declarations }
    CheckPrinted: boolean;
  public
    { Public declarations }
  end;

var
  PRINT_KKM: TPRINT_KKM;


implementation

{$R *.DFM}

procedure TPRINT_KKM.MON2Change(Sender: TObject);
begin
  MON3.value:=Mon2.value-Mon1.value;
end;

procedure TPRINT_KKM.MON2KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then close;
   if (key=#13 ) then begin
     key:=#0;
     if (not CheckPrinted) then
        begin
	    CheckPrinted:=true;
//     if Messbox('Напечатать чек на ККМ ?',MessSubmit,4+48+256)=6 then begin
    	    tag:=print_cash(Mon2.value,Mon3.value, label3.tag, label2.tag);
        sleep(2000);
        close;
        end
        else
         msgbox('Ошибка','Уже была попытка напечатать чек. '+chr(13)+'Для повторного вывода кассового чека закройте окно "Печать чека" и вызовите его снова', 0);
//     end;
   end;
end;

procedure TPRINT_KKM.FormShow(Sender: TObject);
begin
   MON2.setfocus;
   if ( label2.tag > 0) then mon2.ReadOnly:=true;
   CheckPrinted:=false;
end;

procedure TPRINT_KKM.btnCopyClick(Sender: TObject);
begin
  tag:=print_cash(Mon2.value,Mon3.value, label3.tag, label2.tag, true);
end;

end.
