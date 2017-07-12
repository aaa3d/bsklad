unit ToolZoneDistribute;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Data1,
  Db, IBCustomDataSet, IBQuery, IBDatabase, Grids, DBGrids, RXDBCtrl,B_utils,B_DButils,
  RxMemDS, RxLookup, StdCtrls, ExtCtrls, Mask, ToolEdit;

type
  Ttool_zone_distribute = class(TForm)
    ShopTransaction: TIBTransaction;
    QueryShop: TIBQuery;
    DsShop: TDataSource;
    RxDBGrid1: TRxDBGrid;
    QueryShopSHOP_ID: TIntegerField;
    QueryShopSHOP_NAME: TIBStringField;
    RxMemoryData1: TRxMemoryData;
    DataSource1: TDataSource;
    RxMemoryData1tw_kol: TFloatField;
    RxMemoryData1zone_name: TStringField;
    RxMemoryData1zone_id: TIntegerField;
    Panel1: TPanel;
    tw_name: TLabel;
    tw_kol: TLabel;
    Button1: TButton;
    in_place_combo: TRxLookupEdit;
    Label1: TLabel;
    Button2: TButton;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    RxMemoryData1id: TIntegerField;
    MainDicZone1: TIBQuery;
    MainDicZone1ZONE_ID: TIntegerField;
    MainDicZone1SKL_ID: TIntegerField;
    MainDicZone1ZONE_NAME: TIBStringField;
    MainDicZone1ZONE_DESCR: TIBStringField;
    MainDicZone1TM: TDateTimeField;
    MainDSZone: TDataSource;
    IBQuery2: TIBQuery;
    procedure QueryShopAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure in_place_combo1Change(Sender: TObject);
    procedure in_place_combo1Exit(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure updateOst;
    procedure in_place_comboExit(Sender: TObject);
    procedure RxMemoryData1NewRecord(DataSet: TDataSet);
    procedure RxMemoryData1AfterPost(DataSet: TDataSet);
    procedure RxMemoryData1CalcFields(DataSet: TDataSet);
    procedure RxMemoryData1AfterEdit(DataSet: TDataSet);
    procedure RxMemoryData1tw_kolChange(Sender: TField);
    procedure Button2Click(Sender: TObject);
    procedure in_place_comboKeyPress(Sender: TObject; var Key: Char);
    procedure in_place_comboKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure RxDBGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure RxDBGrid1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    full_tw_kol: double;
    pns_id: integer;
    tw_id: integer;
    skl_id: integer;
  end;

var
  tool_zone_distribute: Ttool_zone_distribute;

implementation

uses SelectShop;

{$R *.DFM}

procedure Ttool_zone_distribute.QueryShopAfterOpen(DataSet: TDataSet);
var
   n:integer;
begin
     n:=QueryShop.recordcount;
     Select_Shop.Height:=(n)*20;

end;

procedure Ttool_zone_distribute.FormKeyPress(Sender: TObject; var Key: Char);
begin
//     IF KEY=#27 THEN CLOSE;
end;

procedure Ttool_zone_distribute.FormShow(Sender: TObject);
begin
  // ShopTransaction.Active:=False;
  //   QueryShop.Close;
   //  QueryShop.Open;
     tag:=0;


     ///загрузить распределение из ZONE_REG
     ibquery1.sql.Text:='SELECT zone_reg_id, zone_id, tw_kol, zone_name FROM ZONE_REG left join zone on zone.zone_id = zone_reg.zone_id WHERE DOC_IDS=:doc_ids ';
     ibquery1.ParamByName('doc_ids').asInteger := pns_id;

     ibquery1.Open;

     while not ibquery1.Eof do
     begin
        rxMemoryData1.Append;
        rxmemoryData1.FieldByName('tw_kol').asFloat:=ibquery1.fieldbyname('tw_kol').asfloat;
//        rxmemoryData1.FieldByName('tw_id').asFloat:=tw_id;
        rxmemoryData1.FieldByName('zone_id').asinteger:=ibquery1.fieldbyname('zone_id').asinteger;
        rxmemoryData1.FieldByName('zone_reg_id').asinteger:=ibquery1.fieldbyname('zone_reg_id').asinteger;
        rxmemoryData1.FieldByName('zone_name').asString:=ibquery1.fieldbyname('ZONE_NAME').asstring;
        ibquery1.next;
     end;

     ibquery1.close;


end;

procedure Ttool_zone_distribute.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     QueryShop.Close;
     ShopTransaction.Active:=False;
end;

procedure Ttool_zone_distribute.RxDBGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
//if (not Btn_Apply.enabled)
//        then exit;

 if ((RxDBGrid1.col=2) ) then
    begin

      begin


      //in_place_combo.Value:=RxMemoryData1.fieldByname('ZONE_ID').asstring;

      MainDicZone1.Close;
      MainDicZone1.Open;

      in_place_combo.Text:=RxMemoryData1.fieldByname('ZONE_name').asstring;
      in_place_combo.Visible := True;
//      in_place_combo.DoClick;
//      SendMessage(in_place_combo.Handle, cb_ShowDropDown, 1, 0)
      SendMessage(in_place_combo.handle, CB_SHOWDROPDOWN, Integer(True), 0);
      //in_place_combo.droppe

      end;
//      combo_kln_worktype.DropDown;
    end;
//    else
//    AllowEdit := true;
end;

procedure Ttool_zone_distribute.in_place_combo1Change(Sender: TObject);
begin
{   if in_place_combo.Value<>'' then
   begin

   MemZonePERS.Edit;
   MemZonePERS.fieldByname('ZONE_TO_NAME').asstring:=in_place_combo.DisplayValue;
   MemZonePERS.fieldByname('ZONE_TO_ID').asstring:=in_place_combo.Value;
   MemZonePERS.Post;
   in_place_combo.CloseUp(false);
   in_place_combo.Visible := false;


   end;
   }
end;

procedure Ttool_zone_distribute.in_place_combo1Exit(Sender: TObject);
begin
//   in_place_combo.CloseUp(false);
//  in_place_combo.Visible := false;
//rxMemoryData1.Post;
       // rxMemoryData1.FieldByName('ZONE_NAME').asString := in_place_combo.Text;
end;

procedure Ttool_zone_distribute.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//if (gdFocused in State) then
if (gdSelected in State) then

 if ((Column.Index = 1) or (DataCol = 1) ) then
    begin
      in_place_combo.Left := Rect.Left + RxDBGrid1.Left;
      in_place_combo.Top := Rect.Top + RxDBGrid1.top;
      in_place_combo.Width := Rect.Right - Rect.Left+2;
      in_place_combo.Visible := false;
//      in_place_combo_data.EmptyTable;

    end;

    in_place_combo.Visible := false;
end;

procedure Ttool_zone_distribute.Button1Click(Sender: TObject);
begin
        RxMemoryData1.Append;
end;


procedure TTool_zone_distribute.updateOst;
var ost: double;
i: integer;
ID: integer;
begin
//      if MemRNS.RecordCount>0 then begin
         ID:=RxMemoryData1.RecNo;
         RxMemoryData1.DisableControls;
         RxMemoryData1.First;
         ost:=full_tw_kol;

         while not RxMemoryData1.eof do begin
               ost:=ost-RxMemoryData1.fieldbyname('TW_KOL').asfloat;
               RxMemoryData1.next;
         end;
         RxMemoryData1.First;
         for i:=1 to ID-1 do RxMemoryData1.next;
         RxMemoryData1.EnableControls;
         rxmemoryData1.Edit;

        self.tw_kol.caption := FloatToStr(ost);
end;
procedure Ttool_zone_distribute.in_place_comboExit(Sender: TObject);
begin


//in_place_combo.
       // rxMemoryData1.Edit;
//        rxMemoryData1.FieldByName('ZONE_ID').asString := in_place_combo.LookupSource.DataSet.fieldbyName('ZONE_ID').asString;
//if (gdSelected in State) then
        if (   rxMemoryData1.State = dsBrowse) then
        exit;
        rxMemoryData1.FieldByName('ZONE_ID').asString:='';
        rxMemoryData1.FieldByName('ZONE_NAME').asString := in_place_combo.Text;


        self.MainDicZone1.First;
        while not MaindicZone1.eof do
        begin
                if (MaindicZone1.fieldbyName('zone_name').asstring = in_place_combo.Text) then
                begin
                        rxMemoryData1.FieldByName('ZONE_ID').asString:=MaindicZone1.fieldbyName('ZONE_ID').asstring;
                        break;
                end;
                MaindicZone1.next;
        end;

        in_place_combo.Visible:=false;
        //rxMemoryData1.Post;
end;

procedure Ttool_zone_distribute.RxMemoryData1NewRecord(DataSet: TDataSet);
begin
    //updateOst();
end;

procedure Ttool_zone_distribute.RxMemoryData1AfterPost(DataSet: TDataSet);
begin
           updateOst();
end;

procedure Ttool_zone_distribute.RxMemoryData1CalcFields(DataSet: TDataSet);
begin
        updateOst();
end;

procedure Ttool_zone_distribute.RxMemoryData1AfterEdit(DataSet: TDataSet);
begin
//updateOst();
end;

procedure Ttool_zone_distribute.RxMemoryData1tw_kolChange(Sender: TField);
begin
updateOst();
end;

procedure Ttool_zone_distribute.Button2Click(Sender: TObject);
var id: integer;
i: integer;
begin
//сохранение распределения
//1. сохранить зоны которые без кода
//2. сохранить движение товара в эти зоны
        ID:=RxMemoryData1.RecNo;
         RxMemoryData1.DisableControls;
         RxMemoryData1.First;
//         ost:=full_tw_kol;

         while not RxMemoryData1.eof do begin
              ibquery2.SQL.Text:='SELECT ZONE_ID FROM ZONE WHERE ZONE_NAME=:zone_name and skl_id=:skl_id';
              ibquery2.ParamByName('ZONE_NAME').asString := RxMemoryData1.FieldByName('ZONE_NAME').ASString;
              ibquery2.ParamByName('skl_id').asInteger := skl_id;

              ibquery2.Open;

              if (not ibquery2.Eof) then
              begin
                RxMemoryData1.Edit;
                RxMemoryData1.FieldByName('ZONE_ID').asInteger := ibquery2.fieldByName('ZONE_ID').asInteger;
                RxMemoryData1.Post;
              end

              else
//              if (RxMemoryData1.FieldByName('ZONE_ID').asstring = '') then
              begin
                IBSAVE_CLEAR;
                IBSAVE_ADD('ZONE_NAME', RxMemoryData1.FieldByName('ZONE_NAME').ASString);
                IBSAVE_ADD('SKL_ID', skl_id);
                id := IBSAVE_DOC('ZONE', -1);
                Datamodule1.IBTransaction2.Commit;
                RxMemoryData1.Edit;
                RxMemoryData1.FieldByName('ZONE_ID').asInteger := id;
                RxMemoryData1.Post;
              end;

              ibquery2.Close;


              IBSAVE_CLEAR;
              IBSAVE_ADD('ZONE_ID', RxMemoryData1.FieldByName('ZONE_ID').asInteger);
              IBSAVE_ADD('TW_ID', tw_id);
              IBSAVE_ADD('SKL_ID', skl_id);
              IBSAVE_ADD('TYP', 2);
              IBSAVE_ADD('TW_KOL', RxMemoryData1.FieldByName('tw_kol').asFloat);
              IBSAVE_ADD('DOC_IDS', pns_id);

              id := RxMemoryData1.FieldByName('zone_reg_id').asInteger;
              if (id = 0) then
                id := -1;
              id := IBSAVE_DOC('ZONE_REG', id);

              Datamodule1.IBTransaction2.Commit;
             // if (rxMemoryData1.FieldByName('zone_reg_id').asInteger < 1) then
              begin
                RxMemoryData1.Edit;
                RxMemoryData1.FieldByName('zone_reg_id').asInteger := id;
                RxMemoryData1.Post;
              end;

              RxMemoryData1.next;
         end;
         RxMemoryData1.First;
         for i:=1 to ID-1 do RxMemoryData1.next;
         RxMemoryData1.EnableControls;
         rxmemoryData1.Edit;

         Close;
end;

procedure Ttool_zone_distribute.in_place_comboKeyPress(Sender: TObject;
  var Key: Char);
begin
        IF KEY=#27 THEN
        in_place_combo.Visible:=false;

//        CLOSE
end;

procedure Ttool_zone_distribute.in_place_comboKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        SendMessage(in_place_combo.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure Ttool_zone_distribute.RxDBGrid1MouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
Handled:=true;
end;

procedure Ttool_zone_distribute.RxDBGrid1MouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
Handled:=true;
end;

procedure Ttool_zone_distribute.RxDBGrid1Enter(Sender: TObject);
begin
     in_place_combo.Visible:=false;
end;

end.
