unit InternetTwData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, jpeg, OleCtrls, SHDocVw,
  ATViewer, Menus, ExtDlgs,ShellAPI, IBDatabase, Data1, Db,
  IBCustomDataSet, IBQuery;

type TBuffer = array of Char;

type
  TINTERNET_TW_DATA = class(TForm)
    Splitter1: TSplitter;
    Label1: TLabel;
//    ATViewer1: TATViewer;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DrawGrid1: TDrawGrid;
    GroupBox2: TGroupBox;
    tw_info: TMemo;
    OpenDialog1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    Splitter2: TSplitter;
    ATViewer1: TATViewer;
    procedure DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DrawGrid1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure tw_infoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
    save: boolean;

    procedure SaveLoad;
  public
    { Public declarations }
    tw_id: integer;



    files_info : TStrings;

  end;


implementation

{$R *.DFM}

uses MainForm, b_dbutils ;







procedure CreateBuffer( Names : array of string; var P : TBuffer );
var I, J, L : Integer;
begin
for I := Low( Names ) to High( Names ) do
   begin
     L := Length( P );
     SetLength( P, L + Length( Names[ I ] ) + 1 );
     for J := 0 to Length( Names[ I ] ) - 1 do
       P[ L + J ] := Names[ I, J + 1 ];
     P[ L + J ] := #0;
   end;
SetLength( P, Length( P ) + 1 );
P[ Length( P )-1 ] := #0;
end;


function DeleteFiles( Handle : Hwnd; Src : array of string; Dest : string) : Integer;
var
SHFileOpStruct : TSHFileOpStruct;
SrcBuf : TBuffer;
begin
CreateBuffer( Src, SrcBuf );
with SHFileOpStruct do
   begin
     Wnd := Handle;
     wFunc := FO_DELETE ;
     pFrom := Pointer( SrcBuf );
     pTo := PChar( Dest );
     fFlags := FOF_NOCONFIRMATION or FOF_SILENT;
     fAnyOperationsAborted := False;
     hNameMappings := nil;
     lpszProgressTitle := nil;
   end;
Result := SHFileOperation( SHFileOpStruct );
SrcBuf := nil;
end;

function CopyFiles( Handle : Hwnd; Src : array of string; Dest : string;
Move : Boolean; AutoRename : Boolean ) : Integer;
var
SHFileOpStruct : TSHFileOpStruct;
SrcBuf : TBuffer;
begin
CreateBuffer( Src, SrcBuf );
with SHFileOpStruct do
   begin
     Wnd := Handle;
     wFunc := FO_COPY;
     if Move then wFunc := FO_MOVE;
     pFrom := Pointer( SrcBuf );
     pTo := PChar( Dest );
     fFlags := 0;
     if AutoRename then fFlags := FOF_RENAMEONCOLLISION;
     fAnyOperationsAborted := False;
     hNameMappings := nil;
     lpszProgressTitle := nil;
   end;
Result := SHFileOperation( SHFileOpStruct );
SrcBuf := nil;
end;


procedure TINTERNET_TW_DATA.SaveLoad;
begin



      if Check_Dostup('$DICTW.INTERNET_CHANGE') then
      begin

        IBSAVE_CLEAR;
        ibsave_add('tw_id', tw_id);
        ibsave_add('tw_info', tw_info.Text);
        ibsave_add('tw_files_info', files_info.text);
        ibsave_doc('INTERNET_TW_DATA', self.Tag);
        DataModule1.IbSaveSQL.Transaction.Commit;
      end;




     ibquery1.SQL.Text:='SELECT * FROM tw left join INTERNET_TW_DATA on  tw.tw_id=internet_tw_data.tw_id where tw.TW_ID=:tw_id';
     ibquery1.ParamByName('TW_ID').asinteger:=tw_id;
     ibquery1.Open;


     self.Tag:=ibquery1.fieldbyname('internet_tw_data_id').asinteger;
     if self.tag =0  then
      self.tag:=-1;
     begin
        caption:='Товар: '+ibquery1.fieldbyname('tw_art').asString + ' '+ ibquery1.fieldbyname('tw_nam').asString;

        tw_info.Text:=ibquery1.fieldbyname('tw_info').asString;

        files_info.Text:= ibquery1.fieldbyname('tw_files_info').asString;

        DrawGrid1.RowCount:=round(files_info.Count/2+0.5)+1;
        DrawGrid1.Repaint;
     end;

     ibquery1.Close;
     ibquery1.Transaction.Commit;

     save:=true;
end;



procedure TINTERNET_TW_DATA.DrawGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);

var j_image: TJPEGImage;

    filename: string;

    ext: string;

    number: integer;

begin
//onlyone_1024.jpg

  if ((aCol>0) and (aRow>0)) then
  begin

    number:=2* (aRow-1) + (aCol-1);

    if number >= files_info.Count then
      exit;



    filename:=ExtractFilePath(ParamStr(0))+'internet\'+files_info[number];
    ext:=extractfileext(filename);

    if ((ext = '.jpg') or (ext = '.jpeg')) then
    begin
      j_image:=TJPEGImage.Create;
      try
      j_image.LoadFromFile(filename);

      if aCol=1 then
        DrawGrid1.RowHeights[aRow]:=round(j_image.Height * DrawGrid1.ColWidths[aCol]/j_image.Width);

      DrawGrid1.Canvas.StretchDraw(Rect, j_image);
      except
      on e: Exception do
       DrawGrid1.Canvas.TextOut(Rect.left, Rect.Top, 'N/A '+extractfilename(filename) {e.Message});
      end;
      j_image.Destroy;
    end
    else
    begin
      DrawGrid1.Canvas.TextOut(Rect.left, Rect.Top, extractfilename(filename));
    end;
  end;
end;

procedure TINTERNET_TW_DATA.DrawGrid1Click(Sender: TObject);
var filename: string;
    ext: string;
    number: integer;
begin



  if  ((DrawGrid1.Col>0)and (DrawGrid1.Row>0)) then
  begin
    number:=2* (DrawGrid1.Row-1) + (DrawGrid1.Col-1);
    if number >= files_info.Count then
      exit;
    filename:=ExtractFilePath(ParamStr(0))+'internet\'+files_info[number];
    ext:=extractfileext(filename);

    if ext='.jpg' then
    begin

      Atviewer1.Open(filename);
      Atviewer1.Width:=AtViewer1.ImageWidth;
      Atviewer1.Height:=AtViewer1.ImageHeight;
    end
    else
    begin
      Atviewer1.Open(filename);
      Atviewer1.Width:=Self.Width - Atviewer1.Left - 30;
      Atviewer1.Height:=self.Height - 50;
    end;
  end

end;

procedure TINTERNET_TW_DATA.FormShow(Sender: TObject);
begin
     {Определяем местоположение}
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-28;

     files_info:=TStringList.Create;

     if not Check_Dostup('$DICTW.INTERNET_CHANGE') then
        DrawGrid1.PopupMenu:=nil;


//     PopupMenu1.


     SaveLoad;

{
     ibquery1.SQL.Text:='SELECT * FROM tw left join INTERNET_TW_DATA on  tw.tw_id=internet_tw_data.tw_id where tw.TW_ID=:tw_id';
     ibquery1.ParamByName('TW_ID').asinteger:=tw_id;
     ibquery1.Open;


     self.Tag:=ibquery1.fieldbyname('internet_tw_data_id').asinteger;
     if self.tag =0  then
      self.tag:=-1;
     begin
        caption:='Товар: '+ibquery1.fieldbyname('tw_art').asString + ' '+ ibquery1.fieldbyname('tw_nam').asString;


        files_info.Text:= ibquery1.fieldbyname('tw_files_info').asString;

        DrawGrid1.RowCount:=files_info.Count+1;
     end;

     ibquery1.Close;
}     




end;

procedure TINTERNET_TW_DATA.N1Click(Sender: TObject);
var filename: string;
  ext: string;
begin
    if OpenPictureDialog1.Execute then
    begin
      ext:=ExtractFileExt(OpenpictureDialog1.filename);

      if ((ext = '.JPG')
      or (ext='JPEG')
      or (ext='JPG')) then
        ext:='.jpg';

      filename:=ExtractFilePath(ParamStr(0))+'internet\'+inttostr(tw_id)+'_'+inttostr(round(TimeStampToMSecs( datetimetotimestamp(now))))+ext;

      CopyFiles(handle, [OpenPictureDialog1.filename],  filename, false, false);

      SetFileAttributes(PChar(filename), FILE_ATTRIBUTE_READONLY);

      files_info.Add (ExtractFileName(filename));

      SaveLoad;

    end;

end;

procedure TINTERNET_TW_DATA.FormDestroy(Sender: TObject);
begin
    files_info.Free;
end;

procedure TINTERNET_TW_DATA.N2Click(Sender: TObject);
var filename: string;
  ext: string;

begin


    if OpenDialog1.Execute then
    begin
      ext:=ExtractFileExt(OpenDialog1.filename);

      filename:=ExtractFilePath(ParamStr(0))+'internet\'+inttostr(tw_id)+'_'+inttostr(round(TimeStampToMSecs( datetimetotimestamp(now))))+'_'+extractfilename(OpenDialog1.filename);

      CopyFiles(handle, [OpenDialog1.filename],  filename, false, false);

      SetFileAttributes(PChar(filename), FILE_ATTRIBUTE_READONLY);

      files_info.Add (ExtractFileName(filename));

      SaveLoad;

    end;
end;

procedure TINTERNET_TW_DATA.tw_infoChange(Sender: TObject);
begin
  save:=false;



end;

procedure TINTERNET_TW_DATA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if ((save=false) and (Check_Dostup('$DICTW.INTERNET_CHANGE')))  then
     begin

      IBSAVE_CLEAR;
      ibsave_add('tw_id', tw_id);
      ibsave_add('tw_info', tw_info.Text);
      ibsave_add('tw_files_info', files_info.text);
      ibsave_doc('INTERNET_TW_DATA', self.Tag);
      DataModule1.IbSaveSQL.Transaction.Commit;
    end;
end;

procedure TINTERNET_TW_DATA.N5Click(Sender: TObject);
var filename: string;
    ext: string;
    number: integer;
begin
  if MessageDlg('Удалить запись?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    Exit;
  end;

  if  ((DrawGrid1.Col>0)and (DrawGrid1.Row>0)) then
  begin
    number:=2* (DrawGrid1.Row-1) + (DrawGrid1.Col-1);
    if number >= files_info.Count then
      exit;


    filename:=files_info[number];
    files_info.Delete(number);

    SaveLoad;
    SetFileAttributes(PChar(ParamStr(0)+'internet\'+filename), FILE_ATTRIBUTE_NORMAL);
    deletefiles(handle, [ExtractFilePath(ParamStr(0))+'internet\'+filename], '');

  end

end;

end.
