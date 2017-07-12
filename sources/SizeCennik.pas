unit SizeCennik;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, RxLookup;

type
  TSIZE_CENNIK = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Button5: TButton;
    FRM: TRxDBLookupCombo;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SIZE_CENNIK: TSIZE_CENNIK;

implementation

uses Data1;

{$R *.DFM}

procedure TSIZE_CENNIK.FormShow(Sender: TObject);
begin
     tag:=-1;
end;

procedure TSIZE_CENNIK.Button1Click(Sender: TObject);
var i: integer;
begin

     if (frm.Value <> '-1') then
     begin
         DataModule1.MemCennik.first;
         while not DataModule1.MemCennik.Eof do
         begin
                DataModule1.MemCennik.Edit;
                DataModule1.MemCennik.FieldByName('FRM_NAME').asstring:=frm.Text;
                DataModule1.MemCennik.Post;
                DataModule1.MemCennik.Next;
         end;
     end;

     tag:=0;
     close;
end;

procedure TSIZE_CENNIK.Button2Click(Sender: TObject);
var i: integer;
begin

     if (frm.Value <> '-1') then
     begin
         DataModule1.MemCennik.first;
         while not DataModule1.MemCennik.Eof do
         begin
                DataModule1.MemCennik.Edit;
                DataModule1.MemCennik.FieldByName('FRM_NAME').asstring:=frm.Text;
                DataModule1.MemCennik.Post;
                DataModule1.MemCennik.Next;
         end;
     end;

     tag:=1;
     close;

end;

procedure TSIZE_CENNIK.Button3Click(Sender: TObject);
var i: integer;
begin

     if (frm.Value <> '-1') then
     begin
         DataModule1.MemCennik.first;
         while not DataModule1.MemCennik.Eof do
         begin
                DataModule1.MemCennik.Edit;
                DataModule1.MemCennik.FieldByName('FRM_NAME').asstring:=frm.Text;
                DataModule1.MemCennik.Post;
                DataModule1.MemCennik.Next;
         end;
     end;
     tag:=2;
     Close;
end;

procedure TSIZE_CENNIK.Button4Click(Sender: TObject);
var i: integer;
begin

     if (frm.Value <> '-1') then
     begin
         DataModule1.MemCennik.first;
         while not DataModule1.MemCennik.Eof do
         begin
                DataModule1.MemCennik.Edit;
                DataModule1.MemCennik.FieldByName('FRM_NAME').asstring:=frm.Text;
                DataModule1.MemCennik.Post;
                DataModule1.MemCennik.Next;
         end;
     end;
     tag:=3;
     close;
end;

procedure TSIZE_CENNIK.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        key:=#0;
        close;
     end;
end;

procedure TSIZE_CENNIK.Button5Click(Sender: TObject);
var i: integer;
begin

     if (frm.Value <> '-1') then
     begin
         DataModule1.MemCennik.first;
         while not DataModule1.MemCennik.Eof do
         begin
                DataModule1.MemCennik.Edit;
                DataModule1.MemCennik.FieldByName('FRM_NAME').asstring:=frm.Text;
                DataModule1.MemCennik.Post;
                DataModule1.MemCennik.Next;
         end;
     end;
     tag:=4;
     close;
end;

end.
