unit LastSyncFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ToolEdit, Mask, MainForm;

type
  TLastSyncForm = class(TForm)
    ListBox1: TListBox;
    MaskEdit1: TMaskEdit;
    DateEdit1: TDateEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LastSyncForm: TLastSyncForm;

implementation

{$R *.DFM}

procedure TLastSyncForm.CheckBox1Click(Sender: TObject);
begin
   Button1.Enabled := CheckBox1.Checked;
end;

procedure TLastSyncForm.Button1Click(Sender: TObject);
var
  yy,mm,dd,h,m,s,msek:word;
  tm1:tdatetime;
begin

    try
       decodedate(Dateedit1.date,yy,mm,dd);
       h:=strtoint(copy(Maskedit1.text,1,2));
       m:=strtoint(copy(Maskedit1.text,4,2));
       s:=strtoint(copy(Maskedit1.text,7,2));
       Msek:=strtoint(copy(Maskedit1.text,10,3));
       tm1:=encodedate(yy,mm,dd)+encodetime(h,m,s,msek);

       SyncDate := DateTimeToTimeStamp(tm1);
       SyncShopNum := ArrShops[Listbox1.ItemIndex+1].ID;
       tag:=2;
       close;
    except
       Application.MessageBox('¬веденный диапазон времени неверный!','ќшибка',16);
    end;
end;

procedure TLastSyncForm.FormShow(Sender: TObject);
var i: integer;
begin
   ListBox1.Items.Clear;
   for i:= 1 to CntShops do
   begin
   ListBox1.Items.Add(ArrShops[i].name);
   end;
   ListBox1.ItemIndex := 0;
   checkbox1.Checked:=false;
   tag := 0;
end;

end.
