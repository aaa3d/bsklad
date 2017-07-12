unit EditZpUser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, Buttons, DualList, Db, IBCustomDataSet,
  IBQuery, IBDatabase;

type
  TEDIT_ZP_USER = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    BtnSave: TToolButton;
    BtnApply: TToolButton;
    DualListDialog2: TDualListDialog;
    DualListDialog1: TDualListDialog;
    WorkTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    USER_ROLE: TComboBox;
    TW: TEdit;
    tw2: TEdit;
    ZP_SELF_JOU: TEdit;
    ZP_ANOTHER_JOU: TEdit;
    BtnDynDic: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    ZP_SELF_SHOPS: TEdit;
    ZP_ANOTHER_SHOPS: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DualListDialog3: TDualListDialog;
    DualListDialog4: TDualListDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure BtnApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LoadZPDialogs;
    procedure BtnDynDicClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure USER_ROLEChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    ZP_SELF_JOU_STR, ZP_ANOTHER_JOU_STR: string;
    ZP_SELF_TWTREE_TYP, ZP_SELF_TWTREE_ID, ZP_ANOTHER_TWTREE_TYP, ZP_ANOTHER_TWTREE_ID: integer;
    ZP_USER_ROLE: integer;

    ZP_SELF_SHOP_STR, ZP_ANOTHER_SHOP_STR: string;

  end;

var
  EDIT_ZP_USER: TEDIT_ZP_USER;

implementation
uses Data1, DicTwDynGroup,B_DButils,B_Utils;

{$R *.DFM}

procedure TEDIT_ZP_USER.BtnApplyClick(Sender: TObject);
var
   r:double;
   ID2,i:integer;
begin
      try
      IBSAVE_CLEAR;
      IBSAVE_ADD('ZP_SELF_JOU',ZP_SELF_JOU_STR);
      IBSAVE_ADD('ZP_ANOTHER_JOU',ZP_ANOTHER_JOU_STR);

      IBSAVE_ADD('ZP_SELF_SHOPS',ZP_SELF_SHOP_STR);
      IBSAVE_ADD('ZP_ANOTHER_SHOPS',ZP_ANOTHER_SHOP_STR);

      IBSAVE_ADD('ZP_SELF_TWTREE_TYP',ZP_SELF_TWTREE_TYP);
      IBSAVE_ADD('ZP_ANOTHER_TWTREE_TYP',ZP_ANOTHER_TWTREE_TYP);
      IBSAVE_ADD('ZP_SELF_TWTREE_Id',ZP_SELF_TWTREE_ID);
      IBSAVE_ADD('ZP_ANOTHER_TWTREE_Id',ZP_ANOTHER_TWTREE_ID);

      IBSAVE_ADD('ZP_USER_ROLE',USER_ROLE.ItemIndex);

      r:=IBSAVE_DOC('KLN',EDIT_ZP_USER.tag);

      if r<0 then r:=sqrt(-1);

      Datamodule1.IBTransaction2.Commit;
      except
        Datamodule1.IBTransaction2.Rollback;

      end;

end;

procedure TEDIT_ZP_USER.FormShow(Sender: TObject);
begin

        IbQuery1.SQL.add('select * from KLN WHERE kln.KLN_ID=:KLN_ID ');

        IbQuery1.Parambyname('KLN_ID').asinteger:=EDIT_ZP_USER.tag;
        IbQuery1.open;


        ZP_SELF_JOU_STR:=IbQuery1.fieldbyname('ZP_SELF_JOU').asstring;
        ZP_ANOTHER_JOU_STR:=IbQuery1.fieldbyname('ZP_ANOTHER_JOU').asstring;
        ZP_SELF_SHOP_STR:=IbQuery1.fieldbyname('ZP_SELF_SHOPS').asstring;
        ZP_ANOTHER_SHOP_STR:=IbQuery1.fieldbyname('ZP_ANOTHER_SHOPS').asstring;

        ZP_SELF_TWTREE_TYP:=IbQuery1.fieldbyname('ZP_SELF_TWTREE_TYP').asinteger;
        ZP_ANOTHER_TWTREE_TYP:=IbQuery1.fieldbyname('ZP_ANOTHER_TWTREE_TYP').asinteger;
        ZP_SELF_TWTREE_ID:=IbQuery1.fieldbyname('ZP_SELF_TWTREE_ID').asinteger;
        ZP_ANOTHER_TWTREE_ID:=IbQuery1.fieldbyname('ZP_ANOTHER_TWTREE_ID').asinteger;
        USER_ROLE.ItemIndex:=IbQuery1.fieldbyname('ZP_USER_ROLE').asinteger;

         IbQuery1.close;


          LoadZPDialogs;

          USER_ROLEChange(nil);
end;


procedure TEDIT_ZP_USER.LoadZPDialogs;
var
   a:integer;
   s,s2:ansistring;
   s3,s4: string;
begin
{Заполняем DualListDialog}
     s4:='';
     s3:='';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(IBQuery1,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     DualListDialog1.Title:='Список типов расходных накладных';
     DualListDialog1.List1.Clear;
     DualListDialog1.List2.Clear;
     while not IBQuery1.eof do begin

           if POS('%'+IBQuery1.fieldByname('RNTYP_ID').asstring+'%', zp_self_jou_str) >0  then
           BEGIN
             DualListDialog1.List2.Add(IBQuery1.fieldByname('RNTYP_SHORT').asstring);
             if s4<>'' then
              s4:=s4+',';

             s4:=s4+IBQuery1.fieldByname('RNTYP_SHORT').asstring;
           END
           ELSE
             DualListDialog1.List1.Add(IBQuery1.fieldByname('RNTYP_SHORT').asstring);
           IBQuery1.next;
     end;
     ZP_SELF_JOU.text:=s4;

   s4:='';
     s3:='';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(IBQuery1,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     DualListDialog2.Title:='Список типов расходных накладных';
     DualListDialog2.List1.Clear;
     DualListDialog2.List2.Clear;
     while not IBQuery1.eof do begin

           if POS('%'+IBQuery1.fieldByname('RNTYP_ID').asstring+'%', zp_another_jou_str) >0  then
           BEGIN
             DualListDialog2.List2.Add(IBQuery1.fieldByname('RNTYP_SHORT').asstring);
             if s4<>'' then
              s4:=s4+',';

             s4:=s4+IBQuery1.fieldByname('RNTYP_SHORT').asstring;
           END
           ELSE
             DualListDialog2.List1.Add(IBQuery1.fieldByname('RNTYP_SHORT').asstring);
           IBQuery1.next;
     end;
     ZP_another_JOU.text:=s4;


    s4:='';
     s3:='';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(IBQuery1,'select SHOP_NAME,SHOP_ID from SHOP WHERE VISIBLE=1 order by SHOP_NAME');
     DualListDialog3.Title:='Список магазинов';
     DualListDialog3.List1.Clear;
     DualListDialog3.List2.Clear;
     while not IBQuery1.eof do begin

           if POS('%'+IBQuery1.fieldByname('SHOP_ID').asstring+'%', zp_self_shop_str) >0  then
           BEGIN
             DualListDialog3.List2.Add(IBQuery1.fieldByname('SHOP_NAME').asstring);
             if s4<>'' then
              s4:=s4+',';

             s4:=s4+IBQuery1.fieldByname('SHOP_NAME').asstring;
           END
           ELSE
             DualListDialog3.List1.Add(IBQuery1.fieldByname('SHOP_NAME').asstring);
           IBQuery1.next;
     end;
     zp_self_shops.text:=s4;



     s4:='';
     s3:='';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(IBQuery1,'select SHOP_NAME,SHOP_ID from SHOP WHERE VISIBLE=1 order by SHOP_NAME');
     DualListDialog4.Title:='Список магазинов';
     DualListDialog4.List1.Clear;
     DualListDialog4.List2.Clear;
     while not IBQuery1.eof do begin

           if POS('%'+IBQuery1.fieldByname('SHOP_ID').asstring+'%', zp_another_shop_str) >0  then
           BEGIN
             DualListDialog4.List2.Add(IBQuery1.fieldByname('SHOP_NAME').asstring);
             if s4<>'' then
              s4:=s4+',';

             s4:=s4+IBQuery1.fieldByname('SHOP_NAME').asstring;
           END
           ELSE
             DualListDialog4.List1.Add(IBQuery1.fieldByname('SHOP_NAME').asstring);
           IBQuery1.next;
     end;
     ZP_another_SHOPS.text:=s4;












//     загрузить названия групп товаров.
     WorkTransaction.Active:=False;
     OPEN_SQL(IBQuery1,'select TWDYNGROUP_NAM from TWDYNGROUP WHERE TWDYNGROUP_ID='+inttostr(ZP_SELF_TWTREE_ID));
     tw.Text:=IBQuery1.FieldByName('TWDYNGROUP_NAM').asString;

     WorkTransaction.Active:=False;
     OPEN_SQL(IBQuery1,'select TWDYNGROUP_NAM from TWDYNGROUP WHERE TWDYNGROUP_ID='+inttostr(ZP_ANOTHER_TWTREE_ID));
     tw2.Text:=IBQuery1.FieldByName('TWDYNGROUP_NAM').asString;
     WorkTransaction.Active:=False;





end;



procedure TEDIT_ZP_USER.BitBtn1Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
   s3,s4: string;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(IBQuery1,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     s:='';
     s2:='';
     if DualListDialog1.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog1.list2.Count do begin
            if IBQuery1.Locate('RNTYP_SHORT',DualListDialog1.List2.Strings[a-1],[])
            then begin
                 s:=s+'%'+IBQuery1.fieldByname('RNTYP_ID').asstring;
                 s2:=s2+' '+IBQuery1.fieldByname('RNTYP_SHORT').asstring+',';
            end;
        end;
        s := s+'%';
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        ZP_SELF_JOU_STR:=s;
        ZP_SELF_JOU.text:=s2;
     end;
end;

procedure TEDIT_ZP_USER.BitBtn2Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(IBQuery1,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     s:='';
     s2:='';
     if DualListDialog2.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog2.list2.Count do begin
            if IBQuery1.Locate('RNTYP_SHORT',DualListDialog2.List2.Strings[a-1],[])
            then begin
                 s:=s+'%'+IBQuery1.fieldByname('RNTYP_ID').asstring;
                 s2:=s2+' '+IBQuery1.fieldByname('RNTYP_SHORT').asstring+',';
            end;
        end;
        s := s+'%';
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        ZP_ANOTHER_JOU_STR:=s;
        ZP_ANOTHER_JOU.text:=s2;
     end;
end;

procedure TEDIT_ZP_USER.BtnDynDicClick(Sender: TObject);
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.btnSelect.visible:=true;
     if ZP_SELF_TWTREE_TYP<3 then
      DIC_TW_DYN_GROUP.btnSelect.tag := ZP_SELF_TWTREE_ID;

     DIC_TW_DYN_GROUP.showmodal;
     if DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin

      tw.Text:='* '+ DIC_TW_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      ZP_SELF_TWTREE_ID:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID;
      ZP_SELF_TWTREE_TYP:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_TW_DYN_GROUP.Destroy;
end;

procedure TEDIT_ZP_USER.SpeedButton2Click(Sender: TObject);
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.btnSelect.visible:=true;
     if ZP_ANOTHER_TWTREE_TYP<3 then
      DIC_TW_DYN_GROUP.btnSelect.tag := ZP_ANOTHER_TWTREE_ID;

     DIC_TW_DYN_GROUP.showmodal;
     if DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin

      tw2.Text:='* '+ DIC_TW_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      ZP_ANOTHER_TWTREE_ID:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID;
      ZP_ANOTHER_TWTREE_TYP:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_TW_DYN_GROUP.Destroy;
end;

procedure TEDIT_ZP_USER.BtnSaveClick(Sender: TObject);
begin
   btnApply.Click();
   close;
end;

procedure TEDIT_ZP_USER.BitBtn3Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
   s3,s4: string;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(IBQuery1,'select SHOP_NAME,SHOP_ID from SHOP WHERE VISIBLE=1 order by SHOP_NAME');
     s:='';
     s2:='';
     if DualListDialog3.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog3.list2.Count do begin
            if IBQuery1.Locate('SHOP_NAME',DualListDialog3.List2.Strings[a-1],[])
            then begin
                 s:=s+'%'+IBQuery1.fieldByname('SHOP_ID').asstring;
                 s2:=s2+' '+IBQuery1.fieldByname('SHOP_NAME').asstring+',';
            end;
        end;
        s := s+'%';
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        ZP_SELF_SHOP_STR:=s;
        ZP_SELF_SHOPS.text:=s2;
     end;
end;

procedure TEDIT_ZP_USER.BitBtn4Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
   s3,s4: string;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(IBQuery1,'select SHOP_NAME,SHOP_ID from SHOP WHERE VISIBLE=1 order by SHOP_NAME');
     s:='';
     s2:='';
     if DualListDialog4.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog4.list2.Count do begin
            if IBQuery1.Locate('SHOP_NAME',DualListDialog4.List2.Strings[a-1],[])
            then begin
                 s:=s+'%'+IBQuery1.fieldByname('SHOP_ID').asstring;
                 s2:=s2+' '+IBQuery1.fieldByname('SHOP_NAME').asstring+',';
            end;
        end;
        s := s+'%';
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        ZP_ANOTHER_SHOP_STR:=s;
        ZP_ANOTHER_SHOPS.text:=s2;
     end;
end;

procedure TEDIT_ZP_USER.SpeedButton1Click(Sender: TObject);
begin
ZP_SELF_TWTREE_TYP:=0;
ZP_SELF_TWTREE_ID:=0;
tw.Text:='';
end;

procedure TEDIT_ZP_USER.SpeedButton3Click(Sender: TObject);
begin
ZP_ANOTHER_TWTREE_TYP:=0;
ZP_ANOTHER_TWTREE_ID:=0;
tw2.Text:='';
end;

procedure TEDIT_ZP_USER.USER_ROLEChange(Sender: TObject);
begin
    tw.Visible:=(USER_ROLE.ItemIndex<>2);
    tw2.Visible:=(USER_ROLE.ItemIndex<>2);
    btnDynDic.Visible:=(USER_ROLE.ItemIndex<>2);
    speedbutton1.Visible:=(USER_ROLE.ItemIndex<>2);
    speedbutton2.Visible:=(USER_ROLE.ItemIndex<>2);
    speedbutton3.Visible:=(USER_ROLE.ItemIndex<>2);
    label79.Visible:=(USER_ROLE.ItemIndex<>2);
    label80.Visible:=(USER_ROLE.ItemIndex<>2);


end;

end.
