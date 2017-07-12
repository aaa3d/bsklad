{*************************************************}
{                                                 }
{             FIBPlus Script, version 1.5         }
{                                                 }
{     Copyright by Nikolay Trifonov, 2003-2004    }
{                                                 }
{           E-mail: t_nick@mail.ru                }
{                                                 }
{*************************************************}

����� ������ ������� ������ ��������� ��� FibPlus, ������� �� ��������� ��� �������
� ����� ������� �� ��� ���� � �������� ����. ��� ���� �������� ����������
������������ ������������� �� ��������� � ������������ ������������ �� IBX, 
�� ��� ���� ��� ���������� ���� � ����� �������� ��������� ����������� �����
"execute procedure", "create or alter", "describe" � �.�., ���� ������ � IBX.
��������� ������� �������� � ���������� ������������ �����������, �������� � 
"��� �����������" (www.atstariff.com), Blazetop (www.blazetop.com).

������ FibPlus Script ������������ ��� ���������� ��������, ��������:

==========
DECLARE EXTERNAL FUNCTION TIMETOSECONDS 
    TIME
    RETURNS INTEGER BY VALUE
    ENTRY_POINT 'TimeToSeconds' MODULE_NAME 'nntudf';

ALTER PROCEDURE SP_GET_ROUNDMINUTES (
    DURATION TIME)
RETURNS (
    DURATION_ROUNDMINUTES INTEGER)
AS
declare variable duration_hour integer;
declare variable duration_minute integer;
declare variable duration_second integer;
declare variable dontusefirstseconds integer;
BEGIN
  select Z(extract(hour from :duration)), Z(extract(minute from :duration)), Z(extract(second from :duration))
  from rdb$database
  into :duration_hour, :duration_minute, :duration_second;

  SUSPEND;
END ;
=========

������� ��������� �� ����� � ��������� �������� DataBase � Transaction.
������ ����� ��������� �������� LastDDLQueryLog � LastDMLQueryLog.
�������� ������� � ��� ���� � ��������� ������, � ������� ����� ������������
��������� ����������� �������. ������� ������������� ��� �������� ����������
"����� �� ������� � ���� ������� ������� �����".

��� ����������������� ������ �� FIBPlus ������ ���� 5.0 ���������� 
��������� � FIBDatabase.pas ��������� RemoveDatabase �� ������ 
protected � ������ public � ����������������� FibPlus.


������ �������������:

===
FIBScript1.Script.Assign(ListSQL);
FIBScript1.AutoDDL := False;
if FIBScript1.ValidateScript then FIBScript1.ExecuteScript;
if FIBScript1.Transaction.InTransaction then FIBScript1.Transaction.Commit;
===


�������������:
  Serge Buzadzhy, Serg Vostrikov � �������� Devrace �� �������� ����������.
  Dmitriy Kovalenko (Devrace)
  Pavel Shibanov (Devrace)
  Nikolai Voynov


��� ������:

v1.5 �� 25.07.2004
 1. public ��������  SQLParser � ����� �� ������ ������� �� ��� �������������.
 2. ���������� �� ������ ��� ������ �� �������, ��������� #13,#9,#10,#0,'(',')'
 3. ������ ������� ��� ������� ������� DESCRIBE PROCEDURE PARAMETRE.
 4. � TokenizeNextLine ������� ������� ������ � ������� �� �������� 
    ���������/�������� �� ����������� ������������ ��� ��������� ����������� 
    �������� CurrentLine.
 5. ��������� DoConnect - ����������� ���������� ������ � ������.
 6. ��������� DoCreate - ������ ������������ �� ��� ��������.
 7. ������� ������� ������ FOnParse � TpFIBScript.ParserParse.
 8. Rollback ��� �������� ��������� �� ������.
 9. ��������� ��������� ����-������, ������� ������������ IBExpert. (���� 
    ����� � ������ yascript by Vladimir A. Bakhvaloff).
10. �������� ��������� pFIBExtract (� �������������� ���������� �����, � ����� 
    ���������� ������� describe IBExpert).

v1.4 �� 28.05.2004
 1. ��������� �������.
 2. ����� �� uses IB_Services �� �������������.
 3. � TpFIBParseKind �������� stmtALTER - ��� ALTER DATABASE ADD - ���� 
    ����������������.
 4. �������� property EndLine: Integer read FEndLine; - ��� ���� ����� 
    ����� ����������� ������ ������������ ��� ���������� ��������� ������ 
    �������� ����������.
 5. ������� �������� ��������� ��� CurrentLine (ScriptIndex) - �� 
    ��������� ��������������� ������ ������ ���������� - ����������� 
    ���������� �����������.
 6. ��������� ����� ���������� (SET TERM).
 7. ������� ��������� RECREATE ��� �� ������������� ��� DDL �����������.
 8. ������� ��������� CREATE /* */ PROCEDURE ...
 9. ������ ���� ��� ������� �� ��������� �������������� EXECUTE PROCEDURE 
    ������ ��������� � ��������.

v1.3 �� 20.05.2004
 1. ���� �������� � ����������� ������ ALTER TRIGGER ... INACTIVE/ACTIVE.
 2. �� ������ ������������ DML �������.

v1.2 �� 28.04.2004
 1. ��������� ���������� ������� DESCRIBE, ��������� ������� ��������� 
    ���������� � ������ IBEScript �� IBExpert. ������ ��� ����, ����� 
    ������� �������� �������, ���������� �������� � ������� 
    ��� �������:
    DESCRIBE TABLE DATASETS_INFO '���������� �� ���������� ������';
    � ��� ����: 
    DESCRIBE FIELD NAME TABLE PRODUCTS '������������';
    FibScript ��� �������� ��� ������� �� ��������������� ������� �
    ��������� ��������.

v1.1 �� 21.02.2004
 1. ���������� ������ � ����������� ��������� DML ��������.


Nikolay Trifonov
E-mail: t_nick@mail.ru
