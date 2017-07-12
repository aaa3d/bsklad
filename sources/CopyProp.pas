unit CopyProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit;

type
  TCOPY_PROP = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    MON1: TRxCalcEdit;
    PERCENT1: TRxCalcEdit;
    GroupBox2: TGroupBox;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    MON2: TRxCalcEdit;
    PERCENT2: TRxCalcEdit;
    Button1: TButton;
    Button2: TButton;
    RadioButton7: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  COPY_PROP: TCOPY_PROP;

implementation

{$R *.DFM}

procedure TCOPY_PROP.FormShow(Sender: TObject);
begin
   tag:=0;
end;

procedure TCOPY_PROP.Button2Click(Sender: TObject);
begin
    close;
end;

procedure TCOPY_PROP.Button1Click(Sender: TObject);
begin
   tag:=2;
   close;
end;

procedure TCOPY_PROP.RadioButton1Click(Sender: TObject);
begin
    MON1.enabled:=RadioButton2.checked;
    PERCENT1.enabled:=RadioButton3.checked;
end;

procedure TCOPY_PROP.RadioButton4Click(Sender: TObject);
begin
    MON2.enabled:=RadioButton5.checked;
    PERCENT2.enabled:=RadioButton6.checked;
end;

end.
