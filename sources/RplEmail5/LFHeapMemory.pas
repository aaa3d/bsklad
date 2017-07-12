unit LFHeapMemory;
{ ���������� ��� ����������� ���������� ������������ ������, ���� ������� -  }
{ ������� ������������ ������ ������ �� ���� ������� ������������ ����       }
{ ������ ���������� ���������� ������ � �������, ������� ShareMem, ����� ��� }
{ ������� �� ���������/������������ ������ ������ ����� ��� ����������.      }
{ �����: ������� ������, e-mail: ubik@sinn.ru                                }

interface

implementation

const
  // 2 ^ LFHeapSmallest - ����������� ������ ����������� ����� ������������
  // ������ (2^4=16 ����). ���� ���������� �������� ���� �������� �������, ��
  // ��� �� ����� ����� �������� 16 ����
  LFHeapSmallest = 4;
  // 2 ^ LFHeapBiggest - ������������ ������ ����� ������������ ������, �������
  // ����� ��������� �����������. ����� �������� ������� ����� �������� ��
  // ��������� ������������ ���������
  LFHeapBiggest  = 16;
  // ��� ������� �� ��������� ������ ������ ����������� �� ��������� �������
  // ������, �.�. ���� �������� �������� �������� � ��������� �������������
  // ���������: 16, 32, 64, ..., 64k, 128k, 256k, ... ��� ���� ����������
  // ���������� ���������� ������ �������� �� 0 �� 100% (� ������� - 50%).
  // ���� ������, ��� ������������ ������ �������� � ���������� � ������� ���,
  // �� ������ ������ �� ��������� �������� �����������. ��� ����� ��� �������
  // ��������� ����� ����� ������ ������ ����������� ����, ��� �� ��������� ��
  // �����, �.�. ����� ����� ������ ����� ��������� � ������� ���������� ����-
  // ������� �����.

  // TabsLimit - ������������ ���-�� �������� ������ ������� �����������, ����-
  // ��� ����� �������� � ����. ���� ��� �� ����������� ����������� ����� ����-
  // ������, �� ������ ����� ������� ������������ ��������� ������. ��������
  // ����������� ����������� � ����������� �� �������������������� �������� �
  // ������ � ����������.
  TabsLimit = 16384;

  // ��������� ������ ������ ���������� ����������� � ���, ��� � �����������
  // ������ ����������� ������ ��������� ����, � ��� ��������� �� �������������
  // ����� �������� � ���. � ���� ������ ��� ������� �� ���������/������������
  // ������ ����� ���������� �����������, � � ������������ ��������� �� ������
  // �� ���� �����. ��� ���������, �� ����� ������ ��� ������������ ������.

  kernel = 'kernel32.dll';


  type PInteger = ^Integer;

type
  TMemTabs = packed record
    Marker: integer; // ������ ���������� ����������� �������
    Blocks: array [1..TabsLimit] of pointer; // ��������� �� ����� ������
  end;

  TRTLCriticalSection = packed record
    DebugInfo: Pointer;
    LockCount: Longint;
    RecursionCount: Longint;
    OwningThread: Integer;
    LockSemaphore: Integer;
    Reserved: Integer;
  end;

procedure InitializeCriticalSection(var lpCriticalSection: TRTLCriticalSection); stdcall;
  external kernel name 'InitializeCriticalSection';
procedure EnterCriticalSection(var lpCriticalSection: TRTLCriticalSection); stdcall;
  external kernel name 'EnterCriticalSection';
procedure LeaveCriticalSection(var lpCriticalSection: TRTLCriticalSection); stdcall;
  external kernel name 'LeaveCriticalSection';
procedure DeleteCriticalSection(var lpCriticalSection: TRTLCriticalSection); stdcall;
  external kernel name 'DeleteCriticalSection';

var
  FreeMemTabs: array [LFHeapSmallest..LFHeapBiggest] of TMemTabs;
  LFHeapLock: TRTLCriticalSection;
  SysMemoryManager: TMemoryManager;

// Log2 ���������� ��������� ������� ������� ������ ��� �������� Value
function Log2(const Value: integer): integer;
var
  Mask, i: integer;
begin
  Result := 32;
  Mask := $00000001;
  for i := 0 to 31 do
  if Mask >= Value then
  begin
    Result := i;
    break;
  end else Mask := Mask shl 1;
end;

// RoundBlockSize ��������� ���������� ������� � ������� �������
// �� ��������� ������� ������, �� �� ������ HeapSmallest
procedure RoundBlockSize(var Size: integer);
const
  HeapSmallest = 1 shl LFHeapSmallest;
var
  n: integer;
begin
  if Size > HeapSmallest then
  begin
    n := 1 shl Log2(Size);
    if n <> Size then Size := n;
  end else Size := HeapSmallest;
end;

// GetMemSize - ���������� ������ ����� ������, ����������� ����������� �����-
// ����� ������. ������ �������� �� �������� -4 �� ������ ����� � ����� ������
// Integer. ���� 0, 1, 31 ������������ ��� �����, ������� ���������� ��.
function GetMemSize(P: pointer): integer;
begin
  Dec(integer(P), 4);
  Result := PInteger(P)^ and not Integer($80000003);
end;

// ������� LFHeapGetMem �������� ������� �������� ���� ������ �� ������������
// ����, � � ������ ���������� ������ ������ ������� ������� ������ ��������-
// ���� �����������
function LFHeapGetMem(Size: Integer): Pointer;
var
  MemGran: integer;
  fPooled: boolean;
begin
  RoundBlockSize(Size);
  MemGran := Log2(Size);
  fPooled := false;
  if (MemGran >= LFHeapSmallest) and (MemGran <= LFHeapBiggest) then
  begin
    EnterCriticalSection(LFHeapLock);
    try
      with FreeMemTabs[MemGran] do
      if Marker >= low(Blocks) then
      begin
        // �������� ��������� �� ���� ������
        Result := Blocks[Marker];
        Blocks[Marker] := nil;
        Dec(Marker);
        fPooled := true; // fPooled = true - ������ ������� �������� �� ����
      end;
    finally
      LeaveCriticalSection(LFHeapLock);
    end;
  end;
  // ���� ������ �������� �� �������, ������ � ������������ ���������
  if not fPooled then
    Result := SysMemoryManager.GetMem(Size);
end;

// ������� LFHeapFreeMem ������ ����� ��������� ��������� ������������� ����
// ������ � ���� ��� ��������� �������. ������, ���� ��� ��� �����, �� ������
// ������, �������� ������� ������������ ������������ ��������� ������
function LFHeapFreeMem(P: Pointer): Integer;
var
  MemSize, MemGran: integer;
begin
  // ����������, � ����� ��� ����� ��������� ��������� �� ���� ������
  MemSize := GetMemSize(P);
  MemGran := Log2(MemSize);
  if MemSize < (cardinal(1) shl MemGran) then Dec(MemGran);

  // ���� ��������� �������� � ����, ��� �������� � ����, �� ������������
  // ����� - ������� ����� ������������ ��������� (��� ������ ������, ���
  // 2 ^ LFHeapBiggest)
  if (MemGran >= LFHeapSmallest) and (MemGran <= LFHeapBiggest) then
  begin
    EnterCriticalSection(LFHeapLock);
    try
      // ��������� ������ �� ������������
      with FreeMemTabs[MemGran] do
      if Marker < high(Blocks) then
      begin
        // ��������� � ��������� �� ����� �������+1
        Inc(Marker);
        Blocks[Marker] := P;
        Result := 0{cHeapOk};
      end else Result := SysMemoryManager.FreeMem(P);
    finally
      LeaveCriticalSection(LFHeapLock);
    end;
  end else Result := SysMemoryManager.FreeMem(P);
end;

// ������� LFHeapReallocMem �������� ������ � ������� ���������� ������� �����.
// ���� ����� ������ ����������� � ����������� ������ �����, ������� ������
// ����������� � ������� ������� �� ������� ������, �� ����������� �� ����������.
// ���� �� ��������� �����������, �� ����� ���� ���������� ����� �� ����� ���-
// �������. � ������, ����� ������ ����� ����� ���������, ������ �� ����������,
// �.�. ���� ������� �� �����
function LFHeapReallocMem(P: Pointer; Size: Integer): Pointer;
var
  n: integer;
  np: pointer;
begin
  RoundBlockSize(Size);
  n := GetMemSize(P);
  if n < Size then
  begin
    // ��������� ����������� ����� ����� ���� �������
    EnterCriticalSection(LFHeapLock);
    try
      np := LFHeapGetMem(Size);
      Move(p^, np^, n);
      LFHeapFreeMem(p);
      Result := np;
    finally
      LeaveCriticalSection(LFHeapLock);
    end;
  end else Result := P;
end;

procedure InitMemoryManager;
var
  LFHMemoryManager: TMemoryManager;
begin
  LFHMemoryManager.GetMem := LFHeapGetMem;
  LFHMemoryManager.FreeMem := LFHeapFreeMem;
  LFHMemoryManager.ReallocMem := LFHeapReallocMem;
  InitializeCriticalSection(LFHeapLock);
  GetMemoryManager(SysMemoryManager);
  SetMemoryManager(LFHMemoryManager);
end;

initialization
  FillChar(FreeMemTabs, sizeof(FreeMemTabs), 0);
  if not IsMemoryManagerSet then InitMemoryManager;
end.
