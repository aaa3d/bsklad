unit SetDostup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, Db, RxMemDS,
  B_utils,B_DButils,Data1, IBCustomDataSet, IBQuery, IBDatabase, Menus,
  RXSplit, StdCtrls;

type
  TSET_DOSTUP = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    Panel3: TPanel;
    RxDBGrid2: TRxDBGrid;
    MemDost: TRxMemoryData;
    MemSubdost: TRxMemoryData;
    MemDostSHORT: TStringField;
    MemDostFULL: TStringField;
    DsDost: TDataSource;
    DsSubDost: TDataSource;
    MemSubdostUSDOSTUP_ID: TIntegerField;
    MemSubdostUSGROUP_ID: TIntegerField;
    MemSubdostIS: TIntegerField;
    MemSubdostIS_FULL: TStringField;
    MemSubdostUSGROUP_NAME: TStringField;
    GroupTransaction: TIBTransaction;
    QueryUsgroup: TIBQuery;
    QueryUsgroupUSGROUP_ID: TIntegerField;
    QueryUsgroupUSGROUP_NAME: TIBStringField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnOn: TMenuItem;
    MnOff: TMenuItem;
    RxSplitter1: TRxSplitter;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure DsDostDataChange(Sender: TObject; Field: TField);
    procedure DsSubDostDataChange(Sender: TObject; Field: TField);
    procedure MemSubdostCalcFields(DataSet: TDataSet);
    procedure MemDostAfterScroll(DataSet: TDataSet);
    procedure MnOnClick(Sender: TObject);
    procedure MnOffClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;                                                       

var
  SET_DOSTUP: TSET_DOSTUP;
  CANSCROLL:boolean;
  CANINSERT:boolean;
  CANSubINSERT:boolean;

implementation

uses Mainform;

{$R *.DFM}

procedure TSET_DOSTUP.FormShow(Sender: TObject);
begin
  // ���������� �������
  Top:=Main_Form.Top+22;
  Left:=Screen.DesktopLeft;
  Width:=Screen.Width;
  Height:=Screen.DesktopHeight-Main_Form.Top-22-28;
  GroupTransaction.Active:=False;
  QueryUsgroup.Close;
  QueryUsgroup.Open;
  MemDost.Disablecontrols;
  MemDost.EmptyTable;
  CANSCROLL:=false;
  CANINSERT:=True;
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$PRINT.NOPROW';
   MemDost.fieldbyname('FULL').asstring:='������ ������������� ����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.KLN_IS_FRM';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. ��������� �������� "�����"';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.CHANGE_TABEL';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. ��������� ���������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.CHANGE_PASSWORD';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. ����� ������ ������������� ������� (����� ������)';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.CHANGE_DATA';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. �������������� ����� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.CHANGE_DOSTUP';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. ����� ��������� �������, ������ ��� � �������� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.EDIT_KLN_SETTINGS';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. �������������� ������� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.EDIT_KLN_KTG';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. ��������� ��������� �������, ������������ ������, �����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.KLN_CHANGE_INN';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. ��������� ���';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.KLN_CHANGE_MANAGER_TABEL';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. ��������� ���������� ������ ���������';





  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.CAN_DELETE';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. �������� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.DETAL_KLN';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. �������� � ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_KLN.SHOW_BALANCE';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. �������� ������� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_KLN.CHANGE_CREDIT';
   MemDost.fieldbyname('FULL').asstring:='���������� ��������. ��������� ������� �������/���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.CAN_CREATE';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. �������� ������ � ������ �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.CAN_COPY';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. �������� ����� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.CAN_COPYFORMAT';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. ����������� ������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.CAN_EDIT';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. ��������� � ����������� ������ � ������ �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.CAN_DELETE';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. �������� ������ � ������ �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.DETAL_TW';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. �������� � ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.ANALIZ_TW';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. ������ ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.MARKETING_TW';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. ������������� ������ ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.SALER_CHANGE';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. ����� �������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.TWMONSHOP_CHANGE';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. �������������� ��� � ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.TWPRICE_CHANGE';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. �������������� ��� �����-�����';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.EDIT_SKLAD_PARAMS';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. �������������� ��������� ���������� ������';




{  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT';
   MemDost.fieldbyname('FULL').asstring:='������ �����-�����';
}

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.TWPRICE_PRINT_CHANGE';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. ��������� �������� "������ � ����� �����"';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.INTERNET_CHANGE';
   MemDost.fieldbyname('FULL').asstring:='���������� �������. ��������� ������� ��������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.VIEW$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ������� �������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.VIEW_ANY$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ������� �������. �������� ����� ������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.NEW$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ������� �������. �������� ������ ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.DEL$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ������� �������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.EDIT_DEL_ANY$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ������� �������. ��������������/�������� ����� ������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.DISABLE_TEMPORARY$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ������� �������. ������ �������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.DISABLE_PRIVATE$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ������� �������. ������ �������� ������';

//*************************
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.VIEW$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ����� ��������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.VIEW_ANY$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ����� ��������. �������� ����� ����� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.NEW$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ����� ��������. �������� ����� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.DEL$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ����� ��������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.EDIT_DEL_ANY$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ����� ��������. ��������������/�������� ����� ����� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.DISABLE_TEMPORARY$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ����� ��������. ������ �������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.DISABLE_PRIVATE$';
   MemDost.fieldbyname('FULL').asstring:='���������� ������������ ����� ��������. ������ �������� ������';
//*************************

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_KLN';
   MemDost.fieldbyname('FULL').asstring:='�����������. ���������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_NDS';
   MemDost.fieldbyname('FULL').asstring:='�����������. ������ ���';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICPROPKTG';
   MemDost.fieldbyname('FULL').asstring:='�����������. ��������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_SHOP';
   MemDost.fieldbyname('FULL').asstring:='�����������. �������� � ����';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_SKL';
   MemDost.fieldbyname('FULL').asstring:='�����������. ���������� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_TW';
   MemDost.fieldbyname('FULL').asstring:='�����������. ������. ������ �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_TWKTG';
   MemDost.fieldbyname('FULL').asstring:='�����������. ������. ��������� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_USLUGI.SHOW';
   MemDost.fieldbyname('FULL').asstring:='�����������. ������. ��������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DOC.DOSTUP';
   MemDost.fieldbyname('FULL').asstring:='���������. ������ � ����';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DOC.AKT_WOZW_POST.NEW';
   MemDost.fieldbyname('FULL').asstring:='���������. ����� ��� �������� ����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DOC.AKT_WOZW.NEW';
   MemDost.fieldbyname('FULL').asstring:='���������. ����� ��� �������� �� ����������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.DOSTUP';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ������ � ����';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.SHOW';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.NEW';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ����� ���������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.COMMENT';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ���������� ������������';




  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID1';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ���� ������� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID2';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ���� ������ �� �����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID3';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ���� ������ �� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID4';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ���� �������� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID5';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ���� Internet-���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID6';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ���� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID7';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ������������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID7.UNACTIVE';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ���������� ������������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID8';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ���� ������ �� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.READ_ALL';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ���� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID2';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ������ �� �����������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY_PER.ANY_FRM';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ������ �� ����������� �� ����� �����';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID3';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ������ �� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID4';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� �������� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID5';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� Internet-���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID6';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID7';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ������������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID8';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. �������� ������ �� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY.UTW1';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ������ �� �������. ����������� ���������� �� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY.UTW2';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ������ �� �������. ����������� ���������� �� ����';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY.PODP';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ������ �� �������. �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY.UTW';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ������ �� �������. �����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY.OPL';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ������ �� �������. ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY.WYP';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ������ �� �������. ����������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$EMAIL.ZAY_PREV_SOST';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ������� ������������ ������ �� ������� � ���������� ���������';


  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.MET1';
   MemDost.fieldbyname('FULL').asstring:='����������� �����. ��������� � ����� ������� � 1';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.DOSTUP';
   MemDost.fieldbyname('FULL').asstring:='������. ������ � ����';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.1S';
   MemDost.fieldbyname('FULL').asstring:='������.����� � 1�-������������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.KURS_MONEY';
   MemDost.fieldbyname('FULL').asstring:='������.����� �����. ����� ����� ���������������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.KURS_RN';
   MemDost.fieldbyname('FULL').asstring:='������.����� �����. ����� ����� ��������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.KURS_PN';
   MemDost.fieldbyname('FULL').asstring:='������.����� �����. ����� ����� ��������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.CLOSEDIR';
   MemDost.fieldbyname('FULL').asstring:='������.�������� �������. �������� ������� ����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.CLOSEWORK';
   MemDost.fieldbyname('FULL').asstring:='������.�������� �������. �������� ������� ������������������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.CARD.SUMM';
   MemDost.fieldbyname('FULL').asstring:='������. ������ �� ���������� ������. ������ �� ������������� �����';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.CARD.NUM';
   MemDost.fieldbyname('FULL').asstring:='������. ������ �� ���������� ������. �������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.CARD.ADD_SUMM';
   MemDost.fieldbyname('FULL').asstring:='������. ���������� �����. ���������� ����� �� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.CARD.SKID_NUM';
   MemDost.fieldbyname('FULL').asstring:='������. ���������� �����. ���������� �������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.KLN.MERGE';
   MemDost.fieldbyname('FULL').asstring:='������. ����������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.MAKE_COMPLEX_RN';
   MemDost.fieldbyname('FULL').asstring:='������. �������� ������� ��������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM';
   MemDost.fieldbyname('FULL').asstring:='�����������������. ������ � ����';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM.TIME';
   MemDost.fieldbyname('FULL').asstring:='�����������������. ��������� ����-������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM.TW';
   MemDost.fieldbyname('FULL').asstring:='�����������������. ��������� �������� � ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM.JOU';
   MemDost.fieldbyname('FULL').asstring:='�����������������. ����������������� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM.KONTAKT';
   MemDost.fieldbyname('FULL').asstring:='�����������������. ����������������� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM.LINKNOTABLE';
   MemDost.fieldbyname('FULL').asstring:='�����������������. �������, ����������� �� �������������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM.LINKNOFIELD';
   MemDost.fieldbyname('FULL').asstring:='�����������������. ����, ����������� �� �������������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.DOSTUP';
   MemDost.fieldbyname('FULL').asstring:='�������. ������ � ����';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.DOSTUP.SHOW_DELETED';
   MemDost.fieldbyname('FULL').asstring:='�������. �������� ��������� ����������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.GARANT_TALON.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ ����������� �������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.GARANT_TALON.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ����������� �������. �������� ������������ ������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.DISKONT.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ ���������� ����. ��������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.KKM.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ �������� �������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.KKM.EDIT_MYSHOP';
   MemDost.fieldbyname('FULL').asstring:='������ �������� �������. �������������� � ����� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.KKM.EDIT_REMOTESHOP';
   MemDost.fieldbyname('FULL').asstring:='������ �������� �������. �������������� � "�����" ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZREMON.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ������ �� ����������. �������� � ��������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZREMON.UTW';
   MemDost.fieldbyname('FULL').asstring:='������ ������ �� ����������. �����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZREMON.SUBDOC';
   MemDost.fieldbyname('FULL').asstring:='������ ������ �� ����������. �������� ���� �� ����������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZTRINDEF.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ������ �� ������� � ����. �������� � ��������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZTRINDEF.UTW';
   MemDost.fieldbyname('FULL').asstring:='������ ������ �� ������� � ����. �����������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZTRINDEF.DEL';
   MemDost.fieldbyname('FULL').asstring:='������ ������ �� ������� � ����. ��������';

  queryWork.SQL.Text:='SELECT * FROM CFG where CFG_NAME=''TRINDEF_STAT'' order by cfg_set2';
  queryWork.Open;

  while not queryWork.Eof do
  begin
    MemDost.Append;
    MemDost.fieldbyname('SHORT').asstring:='$JOU.ZTRINDEF.'+queryWork.fieldByName('cfg_set1').asString;
    MemDost.fieldbyname('FULL').asstring:='������ ������ �� ������� � ����. ����������� �� ������ �������: '+queryWork.fieldByName('cfg_Value').asString;

    queryWork.next;
  end;
  querywork.Close;


  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZTRINDEF.SUBDOC';
   MemDost.fieldbyname('FULL').asstring:='������ ������ �� ������� � ����. �������� ���� ���������� � �����������';





  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PO.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ���������. �������� � ��������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PO.VIEW_REMOTESHOP';
   MemDost.fieldbyname('FULL').asstring:='������ ���������. �������� ��������� ������ ��������';



  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PN.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PN.PRINT';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ������ ���������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PN.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PN.KOMM.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ��������� � ������� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PN.ANALIZ';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ������ ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_PN';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_PN.KOMM';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ��������� � ������� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_WOZW_PN';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ���� �������� ����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_PN';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ������ � �������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_PN.KOMM';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ������ � �������� ��������� � ������� ��������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='JOU$.PN.ADMIN_DOC_PN';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ��������� ���������� � ����������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_WOZW_PN';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ������ � �������� ���� �������� ����������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.SALE.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ������. �������� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.SALE.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ ������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.SALE.DELETE';
   MemDost.fieldbyname('FULL').asstring:='������ ������. �������� �������';


  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ���������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.REZ.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ��������� ���������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.CHANGE_TABEL';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ����� ������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='JOU$.RN.ADMIN_DOC_RN';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ��������� ���������� � ����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.NEW_WOZW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ���� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RNKKM.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� � ������ ��������� �� ������ ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ��������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.ANALIZ';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ������ ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_RN';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ���������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_RN_REZ';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ��������� ���������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_RN_1';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ��������� ��� �������� ������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_RN_50000';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ��������� �� �������� �� 30 000';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_RN_100000';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ��������� �� �������� �� 100 000';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_WOZW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ���� ��������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_WOZW_BNAL';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ���� �������� ����, ����2';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_RN';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ������ � �������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_RN_REZ';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ������ � �������� ��������� ���������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$EDIT.SAVEDISCONT';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������������� ������� � ��������� ��� ������ ��������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_WOZW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ������ � �������� ���� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.CHANGE';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� � ������ � ��������, �� ��������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.DELETE';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. �������� ��������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.PRINT_OLD_RND';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ���������. ������ �� � ��������� ������� ������� (�� 20.03.2005)';


  MemDost.Append;
  MemDost.fieldbyname('SHORT').asstring:='JOU.VIPISKA.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ �������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='JOU.VIPISKA.CREATE';
   MemDost.fieldbyname('FULL').asstring:='������ �������. �������� ����� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='JOU.VIPISKA.PROV';
   MemDost.fieldbyname('FULL').asstring:='������ �������. �������� �������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.VIPISKA.UNPROW';
   MemDost.fieldbyname('FULL').asstring:='������ �������. ������ � �������� �������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='JOU.VIPISKA.DELETE';
   MemDost.fieldbyname('FULL').asstring:='������ �������. �������� �������';






  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PSORT.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ ����� �����������. ��������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PSORT.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ����� �����������. �������� ����';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_PSORT';
   MemDost.fieldbyname('FULL').asstring:='������ ����� �����������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_PSORT';
   MemDost.fieldbyname('FULL').asstring:='������ ����� �����������. ������ � ��������';
  MemDost.Append;

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.SPIS.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ ����� ��������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.SPIS.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ����� ��������. �������� ����';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.SPIS.ANALIZ';
   MemDost.fieldbyname('FULL').asstring:='������ ����� ��������. ������ ����';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_SPIS';
   MemDost.fieldbyname('FULL').asstring:='������ ����� ��������. �������� ���� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_SPIS';
   MemDost.fieldbyname('FULL').asstring:='������ ����� ��������. ������ � �������� ���� ��������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_SPIS_WOZW';
   MemDost.fieldbyname('FULL').asstring:='������ ����� ��������. �������� ������ ���� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_SPIS_WOZW';
   MemDost.fieldbyname('FULL').asstring:='������ ����� ��������. ������ � �������� ������ ���� ��������';





  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PER.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� �����������. ��������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PER.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� �����������. �������� ���������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_PER_LIMITED';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� �����������. �������� � ����� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_PER_LIMITED';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� �����������. ������ � �������� � ����� ��������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_PER';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� �����������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_PER';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� �����������. ������ � ��������';

 MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZONE_PER.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ����������� ����� ������. �������� ���������';
 MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_ZONE_PER';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ����������� ����� ������. ���������� ���������';
 MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UN_PROVODKA_ZONE_PER';
   MemDost.fieldbyname('FULL').asstring:='������ ��������� ����������� ����� ������. ������ � �������� ���������';








  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ST.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ ������. ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ST.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ������. �������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.STF.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ ������-������. ��������';


  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.REMON.SHOW';
   MemDost.fieldbyname('FULL').asstring:='������ ����� ����������. ��������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.REMON.NEW';
   MemDost.fieldbyname('FULL').asstring:='������ ����� ����������. �������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_REMON';
   MemDost.fieldbyname('FULL').asstring:='�������� ����� ����������';


  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='REMIND.NEW';
   MemDost.fieldbyname('FULL').asstring:='�����������. �������� � ������������� �����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='REMIND.SHOW_ALL';
   MemDost.fieldbyname('FULL').asstring:='�����������. �������� ����������� ���� �������������';





  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.DOSTUP';
   MemDost.fieldbyname('FULL').asstring:='������. ������ � ����';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.ANALITIKA';
   MemDost.fieldbyname('FULL').asstring:='������. ���������...';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.OST';
   MemDost.fieldbyname('FULL').asstring:='������. ����������� ����� �� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.OSTNUL';
   MemDost.fieldbyname('FULL').asstring:='������. ����� �� ������������� ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.TORG.PERS';
   MemDost.fieldbyname('FULL').asstring:='������. ������������ ����� � ��������. �����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.TORG.PERS_ZAKUP';
   MemDost.fieldbyname('FULL').asstring:='������. ������������ ����� � ��������. �������� ��������� � ����������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.TORG.PERS.SHOP';
   MemDost.fieldbyname('FULL').asstring:='������. ������������ ����� � ��������. ����� �� "������" ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.TORG.PERS.DOGOVOR_AGENTA';
   MemDost.fieldbyname('FULL').asstring:='������. ������������ ����� � ��������. ������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.TORG.PERS.TABEL_NACENKA';
   MemDost.fieldbyname('FULL').asstring:='������. ������������ ����� � ��������. ������� �� ��������� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.ITOG.REPORT_NAC_TABLE_GROUP';
   MemDost.fieldbyname('FULL').asstring:='������. �������� ������. ���������� ������ �� ������� �� �������';



  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.MONEY';
   MemDost.fieldbyname('FULL').asstring:='������. ����� � ����� �� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.PRIBYL.PERS';
   MemDost.fieldbyname('FULL').asstring:='������. ������������ ����� � �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.ITOG';
   MemDost.fieldbyname('FULL').asstring:='������. �������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.VEDOM_NALOG';
   MemDost.fieldbyname('FULL').asstring:='������. ��������� �������� ������� �� �������������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.PRIBYL.WIDE';
   MemDost.fieldbyname('FULL').asstring:='������. ����������� ����� � �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.PRIBYL.WIDE.ALL_TWTREE';
   MemDost.fieldbyname('FULL').asstring:='������. ����������� ����� � �������.���������� �� ���� ������� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.MINOST';
   MemDost.fieldbyname('FULL').asstring:='������. ����� � ����������� �������� � ������������ � �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.INN';
   MemDost.fieldbyname('FULL').asstring:='������. ������ � ���������. ������� ���';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.CARD';
   MemDost.fieldbyname('FULL').asstring:='������. ������ � ���������. ������������ ����������� ����';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.CARD_ONE_SHOP';
   MemDost.fieldbyname('FULL').asstring:='������. ������ � ���������. '+CAP_REPORT_CARD_ONE_SHOP;
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.POST';
   MemDost.fieldbyname('FULL').asstring:='������. ������ � ���������. ������ � ������������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.OSNSKID';
   MemDost.fieldbyname('FULL').asstring:='������. ����������� ������ ��������������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.STAT';
   MemDost.fieldbyname('FULL').asstring:='������. ������� ����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.POL';
   MemDost.fieldbyname('FULL').asstring:='������. ��������� � ��������. ������������ ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.OTG';
   MemDost.fieldbyname('FULL').asstring:='������. ��������� � ��������. ������������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.MARKET.KONK';
   MemDost.fieldbyname('FULL').asstring:='������. ������������� ������������. ������� �����������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.MARKET.OLD';
   MemDost.fieldbyname('FULL').asstring:='������. ������������� ������������. ����� �� ���������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.TW.CHANGE';
   MemDost.fieldbyname('FULL').asstring:='������. �������� �������, ���������� �� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.KORR';
   MemDost.fieldbyname('FULL').asstring:='������. �����-������� �� ��������� ���';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.ONE_STFAKT';
   MemDost.fieldbyname('FULL').asstring:='������. ������ ����-������� �� ������ ��������� ���������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$OTGRUZ';
   MemDost.fieldbyname('FULL').asstring:='�������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$OTGRUZ.ALL_SKL';
   MemDost.fieldbyname('FULL').asstring:='�������� ������ �� ���� �������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$OTGRUZ.SKL_ID=25';
   MemDost.fieldbyname('FULL').asstring:='�������� ������ � ������ �����7�';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$OTGRUZ.SKL_ID=1322019';
   MemDost.fieldbyname('FULL').asstring:='�������� ������ � ������ �����7��';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$OTGRUZ.SKL_ID=1322004';
   MemDost.fieldbyname('FULL').asstring:='�������� ������ � ������ �����7�';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$OTGRUZ.SKL_ID=1322017';
   MemDost.fieldbyname('FULL').asstring:='�������� ������ � ������ ���������';




  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$POL';
   MemDost.fieldbyname('FULL').asstring:='��������� ������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$POL.ALL_SKL';
   MemDost.fieldbyname('FULL').asstring:='��������� ������ �� ���� �������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$POL.SKL_ID=25';
   MemDost.fieldbyname('FULL').asstring:='��������� ������ � ������ �����7�';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$POL.SKL_ID=1322019';
   MemDost.fieldbyname('FULL').asstring:='��������� ������ � ������ �����7��';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$POL.SKL_ID=1322004';
   MemDost.fieldbyname('FULL').asstring:='��������� ������ � ������ �����7�';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$POL.SKL_ID=1322017';
   MemDost.fieldbyname('FULL').asstring:='��������� ������ � ������ ���������';





  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ZP.ON';
   MemDost.fieldbyname('FULL').asstring:='������ ��������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$KKM.ON';
   MemDost.fieldbyname('FULL').asstring:='������ � ����������-�������� �������';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SHOW.ZAKUP';
   MemDost.fieldbyname('FULL').asstring:='�������� ���������� ���';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$FIND.PN';
   MemDost.fieldbyname('FULL').asstring:='�������� ���������� � ���������� ������';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='EDIT_MONEY_DOPUSK';
   MemDost.fieldbyname('FULL').asstring:='��������� ������� � ��������� �����';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='MAKE_VN_REAL_WOZW';
   MemDost.fieldbyname('FULL').asstring:='������������ ���������� ��������� � ����������';


{
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT';
   MemDost.fieldbyname('FULL').asstring:='������ �����-�����';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT_MONEY1';
   MemDost.fieldbyname('FULL').asstring:='���� ����� �����. �������� ������� ���';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT_MONEY2';
   MemDost.fieldbyname('FULL').asstring:='���� ����� �����. �������� ������-������� ���';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT_MONEY3';
   MemDost.fieldbyname('FULL').asstring:='���� ����� �����. �������� ���� ���';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT_MONEY4';
   MemDost.fieldbyname('FULL').asstring:='���� ����� �����. �������� ���� �����';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT_MONEY5';
   MemDost.fieldbyname('FULL').asstring:='���� ����� �����. �������� ���������� ���';
}



  CANINSERT:=False;
  CANSCROLL:=True;

  MemDost.Post;
  MemDost.First;
  MemDost.Enablecontrols;
end;

procedure TSET_DOSTUP.DsDostDataChange(Sender: TObject; Field: TField);
begin
     if (MemDOST.State in [dsInsert]) and ( not CanInsert) then MemDOST.Cancel;
end;

procedure TSET_DOSTUP.DsSubDostDataChange(Sender: TObject;
  Field: TField);
begin
     if (MemSUBDOST.State in [dsInsert]) and ( not CanSubInsert) then MemSUBDOST.Cancel;
end;

procedure TSET_DOSTUP.MemSubdostCalcFields(DataSet: TDataSet);
begin
     if MemSubdost.fieldbyname('IS').asinteger>0
     then MemSubdost.fieldbyname('IS_FULL').asstring:='��������'
     else MemSubdost.fieldbyname('IS_FULL').asstring:='���';
end;

procedure TSET_DOSTUP.MemDostAfterScroll(DataSet: TDataSet);
begin
  if Canscroll then begin
    MemSubdost.Disablecontrols;
    MemSubdost.emptyTable;
    CanSubInsert:=true;
    QueryUsgroup.First;
    while not QueryUsgroup.eof do begin
      MemSubdost.Append;
      MemSubdost.fieldbyname('USGROUP_ID').asinteger:=QueryUsgroup.fieldbyname('USGROUP_ID').asinteger;
      MemSubdost.fieldbyname('USGROUP_NAME').asstring:=QueryUsgroup.fieldbyname('USGROUP_NAME').asstring;
      Worktransaction.active:=False;
      ADD_SQL(QueryWork,'select USDOSTUP_ID from USDOSTUP where USDOSTUP_NAME=:USDOSTUP_NAME and USGROUP_ID=:USGROUP_ID');
      QueryWork.parambyname('USDOSTUP_NAME').asstring:=MemDOST.fieldbyname('SHORT').asstring;
      QueryWork.parambyname('USGROUP_ID').asinteger:=QueryUsgroup.fieldbyname('USGROUP_ID').asinteger;
      QueryWork.Open;
      if QueryWork.eof then begin
        MemSubdost.fieldbyname('USDOSTUP_ID').asinteger:=-1;
        MemSubdost.fieldbyname('IS').asinteger:=0;
      end else begin
        MemSubdost.fieldbyname('USDOSTUP_ID').asinteger:=QueryWork.fieldbyname('USDOSTUP_ID').asinteger;
        MemSubdost.fieldbyname('IS').asinteger:=1;
      end;
      MemSubdost.Post;
      QueryUsgroup.next;
    end;
    CanSubInsert:=False;
    MemSubdost.First;
    MemSubdost.Enablecontrols;
  end;

end;

procedure TSET_DOSTUP.MnOnClick(Sender: TObject);
var
   r:double;
begin
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select USDOSTUP_ID from USDOSTUP where USDOSTUP_NAME=:USDOSTUP_NAME and USGROUP_ID=:USGROUP_ID');
     QueryWork.parambyname('USDOSTUP_NAME').asstring:=MemDOST.fieldbyname('SHORT').asstring;
     QueryWork.parambyname('USGROUP_ID').asinteger:=MemSubDOST.fieldbyname('USGROUP_ID').asinteger;
     QueryWork.Open;
     if QueryWork.eof then begin
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       try
         IBSAVE_CLEAR;
         IBSAVE_ADD('USGROUP_ID',MemSubdost.fieldbyname('USGROUP_ID').asinteger);
         IBSAVE_ADD('USDOSTUP_NAME',MemDOST.fieldbyname('SHORT').asstring);
         if IBSAVE_DOC('USDOSTUP',-1)<0 then r:=Sqrt(-1);
         Datamodule1.IBTransaction2.Commit;
         MemSubdost.edit;
         MemSubdost.Fieldbyname('IS').asinteger:=1;
         MemSubdost.Post;
       except
         Datamodule1.IBTransaction2.Rollback;
       end;
       Datamodule1.IBTransaction2.StartTransaction;
     end;
end;

procedure TSET_DOSTUP.MnOffClick(Sender: TObject);
var
   r:double;
begin
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select USDOSTUP_ID from USDOSTUP where USDOSTUP_NAME=:USDOSTUP_NAME and USGROUP_ID=:USGROUP_ID');
     QueryWork.parambyname('USDOSTUP_NAME').asstring:=MemDOST.fieldbyname('SHORT').asstring;
     QueryWork.parambyname('USGROUP_ID').asinteger:=MemSubDOST.fieldbyname('USGROUP_ID').asinteger;
     QueryWork.Open;
     if not QueryWork.eof then begin
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       try
         if NOT IBDELETE_DOC('USDOSTUP',QueryWork.fieldbyname('USDOSTUP_ID').asinteger) then r:=Sqrt(-1);
         Datamodule1.IBTransaction2.Commit;
         MemSubdost.edit;
         MemSubdost.Fieldbyname('IS').asinteger:=0;
         MemSubdost.Post;
       except
         Datamodule1.IBTransaction2.Rollback;
       end;
       Datamodule1.IBTransaction2.StartTransaction;
     end;
end;

procedure TSET_DOSTUP.Button1Click(Sender: TObject);
var f: textfile;
    s1, s2: string;
begin
 assignfile(f, 'dostup.csv');
 rewrite(f);

 memdost.First;
 while not memdost.Eof do
 begin

     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select * from usgroup, usdostup where usgroup.usgroup_id=usdostup.usgroup_id and usdostup.usdostup_name=:USDOSTUP_NAME');
     QueryWork.parambyname('USDOSTUP_NAME').asstring:=MemDOST.fieldbyname('SHORT').asstring;
     QueryWork.Open;
     while not QueryWork.Eof do
     begin
      s1:= QueryWork.FieldbyName('USGROUP_NAME').asstring;
	  s2:= MemDost.fieldbyname('FULL').asstring;
	  writeln(f, s1+';'+s2);
      QueryWOrk.Next;
     end;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;


  	 memdost.Next;

 end;
 closefile(f);
end;

end.
