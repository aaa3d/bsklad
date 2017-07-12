unit EditCardSkidCoupon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit, RXCtrls, ComCtrls;

type
  TEDIT_CARDSKID_COUPON = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    SUMM: TRxCalcEdit;
    CNT: TRxCalcEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    DESCR: TEdit;
    Label4: TLabel;
    WORK_DT_START: TDateEdit;
    Label5: TLabel;
    WORK_DT_END: TDateEdit;
    Label6: TLabel;
    NUMBER: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    WORK_TM_START: TDateTimePicker;
    WORK_TM_END: TDateTimePicker;
    WORK_DAYS: TRxCheckListBox;
    Label9: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_CARDSKID_COUPON: TEDIT_CARDSKID_COUPON;

implementation

{$R *.DFM}

procedure TEDIT_CARDSKID_COUPON.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TEDIT_CARDSKID_COUPON.Button1Click(Sender: TObject);
begin
   tag:=2;
   close;
end;

procedure TEDIT_CARDSKID_COUPON.FormShow(Sender: TObject);
begin
  tag:=0;
end;

procedure TEDIT_CARDSKID_COUPON.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then begin
    key:=#0;
    close;
  end;
end;

end.
