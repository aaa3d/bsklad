unit LFHeapMemory;
{ Надстройка над стандартным менеджером динамической памяти, цель которой -  }
{ снизить фрагментацию блоков памяти за счёт ведения собственного пула       }
{ Модуль желательно подключать первым в проекте, подобно ShareMem, чтобы все }
{ запросы на выделение/освобождение памяти прошли через эту надстройку.      }
{ Автор: Алексей Изюмов, e-mail: ubik@sinn.ru                                }

interface

implementation

const
  // 2 ^ LFHeapSmallest - минимальный размер выделяемого блока динамической
  // памяти (2^4=16 байт). Если приложение запросит блок меньшего размера, то
  // ему всё равно будет выделено 16 байт
  LFHeapSmallest = 4;
  // 2 ^ LFHeapBiggest - максимальный размер блока динамической памяти, который
  // будет обработан надстройкой. Блоки большего размера будут переданы на
  // обработку стандартному менеджеру
  LFHeapBiggest  = 20;
  // При запросе на выделение памяти размер округляется до ближайшей степени
  // двойки, т.е. весь диапазон размеров сводится к некоторым фиксированным
  // значениям: 16, 32, 64, ..., 64k, 128k, 256k, ... При этом перекрытие
  // требуемого количества памяти составит от 0 до 100% (в среднем - 50%).
  // Если учесть, что фрагментация памяти приводит к перекрытию в десятки раз,
  // то данная потеря не считается особенно болезненной. Тем более при попытке
  // увеличить объём блока памяти велика вероятность того, что он останется на
  // месте, т.к. новый объём вполне может вписаться в пределы фактически выде-
  // ленного блока.

  // TabsLimit - максимальное кол-во огрызков памяти каждого типоразмера, кото-
  // рое может хранится в пуле. Если пул по конкретному типоразмеру будет пере-
  // полнен, то запрос будет передан стандартному менеджеру памяти. Величина
  // подбирается эмпирически в зависимости от несбалансированности запросов к
  // памяти у приложения.
  TabsLimit = 16384;

  // Идеальный случай работы надстройки заключается в том, что в определённый
  // момент потребление памяти достигает пика, и все указатели на освобождаемые
  // блоки попадают в пул. В этом случае все запросы на выделение/освобождение
  // памяти будут обработаны надстройкой, и к стандартному менеджеру не попадёт
  // ни один вызов. Как следствие, не будет причин для фрагментации памяти.

  kernel = 'kernel32.dll';


  type PInteger = ^Integer;

type
  TMemTabs = packed record
    Marker: integer; // индекс последнего помещённого огрызка
    Blocks: array [1..TabsLimit] of pointer; // указатели на блоки памяти
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

// Log2 возвращает ближайшую большую степень двойки для величины Value
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

// RoundBlockSize выполняет округление размера в большую сторону
// до ближайшей степени двойки, но не меньше HeapSmallest
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

// GetMemSize - возвращает размер блока памяти, выделенного стандартным менед-
// жером памяти. Размер хранится по смещению -4 от начала блока и имеет размер
// Integer. Биты 0, 1, 31 используются под флаги, поэтому сбрасываем их.
function GetMemSize(P: pointer): integer;
begin
  Dec(integer(P), 4);
  Result := PInteger(P)^ and not Integer($80000003);
end;

// функция LFHeapGetMem пытается сначала выделить блок памяти из собственного
// пула, а в случае отсутствия блоков такого размера передаёт запрос стандарт-
// ному обработчику
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
        // получаем указатель на блок памяти
        Result := Blocks[Marker];
        Blocks[Marker] := nil;
        Dec(Marker);
        fPooled := true; // fPooled = true - память успешно выделена из пула
      end;
    finally
      LeaveCriticalSection(LFHeapLock);
    end;
  end;
  // если память выделить не удалось, просим у стандартного менеджера
  if not fPooled then
    Result := SysMemoryManager.GetMem(Size);
end;

// функция LFHeapFreeMem первым делом старается сохранить освобождаемый блок
// памяти в пуле для заданного размера. Однако, если пул уже забит, то скрепя
// сердце, вызывает функцию освобождения стандартного менеджера памяти
function LFHeapFreeMem(P: Pointer): Integer;
var
  MemSize, MemGran: integer;
begin
  // определяем, в какой пул можем сохранить указатель на блок памяти
  MemSize := GetMemSize(P);
  MemGran := Log2(MemSize);
  if MemSize < (cardinal(1) shl MemGran) then Dec(MemGran);

  // если размерчик подходит к тому, что хранится в пуле, то обрабатываем
  // иначе - передаём вызов стандартному менеджеру (для блоков больше, чем
  // 2 ^ LFHeapBiggest)
  if (MemGran >= LFHeapSmallest) and (MemGran <= LFHeapBiggest) then
  begin
    EnterCriticalSection(LFHeapLock);
    try
      // проверяем маркер на переполнение
      with FreeMemTabs[MemGran] do
      if Marker < high(Blocks) then
      begin
        // сохраняем в указатель по месту маркера+1
        Inc(Marker);
        Blocks[Marker] := P;
        Result := 0{cHeapOk};
      end else Result := SysMemoryManager.FreeMem(P);
    finally
      LeaveCriticalSection(LFHeapLock);
    end;
  end else Result := SysMemoryManager.FreeMem(P);
end;

// Функция LFHeapReallocMem работает только в сторону увеличения размера блока.
// Если новый размер вписывается в фактический размер блока, который всегда
// округляется в большую сторону до степени двойки, то перемещения не происходит.
// Если же требуется перемещение, то новый блок выделяется опять же через над-
// стройку. В случае, когда размер блока хотят уменьшить, ничего не происходит,
// т.е. блок остаётся на месте
function LFHeapReallocMem(P: Pointer; Size: Integer): Pointer;
var
  n: integer;
  np: pointer;
begin
  RoundBlockSize(Size);
  n := GetMemSize(P);
  if n < Size then
  begin
    // выполняем перемещение блока через свои функции
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
