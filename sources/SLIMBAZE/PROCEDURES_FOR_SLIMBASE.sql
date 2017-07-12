SET TERM ^ ;

create or alter procedure SLIM_BASE_REMOVE_RNS (
    RNS_ID integer)
returns (
    RN0_ID integer,
    RNS0_ID integer,
    TW_KOL double precision,
    PNS0_ID integer,
    RE0_KOL double precision,
    RNS1_ID integer,
    PNS1_ID integer,
    RE1_KOL double precision,
    RNS1_TW_KOL double precision)
as
declare variable PNS1_TW_KOL double precision;
declare variable PNS0_TW_KOL double precision;
declare variable TW_ID integer;
declare variable TW_OST double precision;
declare variable TW_OST2 double precision;
begin
   /*
  for select first 500 rns_id, rn_id, rns.tw_kol from rns rns1, rn, reg
    where rns.rn_id = rn.rn_id
    and reg.id = rns.rns_id

    and not rn.rntyp_id+0 in(160010004, 160010005, 6)
    and rn.rnvid_id+0 = 1
    and rn.rn_prow+0=1
    and reg.dt < '2015-01-01'
    and not (exists(select * from rns rns0 where rns0.wozw_id = rns1.rns_id))
    --order by reg.dt desc
    into :rns0_id, :rn0_id, :tw_kol
    do
    */


  --  rns_id = 525602095;

    select rns_id, rn_id, rns.tw_kol, rns.tw_id from rns
    where rns.rns_id = :rns_id
    into :rns0_id, :rn0_id, :tw_kol, :tw_id;
    --tw_kol=4

    select sum(ost.tw_kol) from ost where tw_id = :tw_id into :tw_ost;
    --tw_ost=66


      ----���� rns....
      ---- �������� ����� �������. ������������� ��������������� ������� ������ � ����� (��� ������ ������_)
      ---������������� �������� ������ � �������, ������� ���

      --��������� - ������ ����� ������ � �����.
      --��� ���� ��������������� - ������� ������� ���������� �� ����� ����������
      ---��� ����� ����� � ������ ������� ���� ������� - ������ ��� �������, �� �� �����������
      --��� ��������� ����� - ������� ����� ������ ������� � ��������

      ---re - ����� ���� ��������� ������� ��� �������.
      --��� ��������� - ��� ������ ����, ������� ����� ���������� ������
      pns0_id = 0;
      re0_kol = 0;
      select re.pp_ids, re.calc_kol from re where re.ids = :rns0_id and re.typ+0=1 and re.pp_typ+0=11 and re.calc_kol=:tw_kol
        into :pns0_id, re0_kol;
      select pns$_id from pns$ where pns$_id = :pns0_id and pns$.tw_kol>=:tw_kol into :pns0_id;


      if (pns0_id>0) then
      begin
          --������ � ������� �������, �.�. ������ ����,
          --��� - ��� ������ ������ ��� ����� ������
          rns1_id = 0;
          pns1_id = 0;
          re1_kol = 0;
          select rns_id, rns.tw_kol from rns where rns.pns$_id = :pns0_id into :rns1_id, :rns1_tw_kol;
          --rns_1_tw_kol = 100
          ---���� rns1_id > 0 - ��� ������ - ���� ����� ����� ������ ������ ��� ����� ������� � ��������� ��� �� ���������� ������.

          if (rns1_id>0) then
          begin
            select re.pp_ids, re.calc_kol from re where re.ids = :rns1_id and re.typ+0=1 and re.pp_typ+0=11 and re.calc_kol=:rns1_tw_kol
                    into :pns1_id, re1_kol;
            select pns$_id from pns$ where pns$_id = :pns1_id and pns$.tw_kol>=:rns1_tw_kol into :pns1_id;


                    --���� ���� ������ - �� ��� ����� �������, ��� ���������
                    if (pns1_id > 0) then
                    begin

                        ----!!! �������� ��� ���� ������ ����� �������...
                        if (not exists(select rns_id, rns.tw_kol from rns where rns.pns$_id = :pns1_id)) then
                        begin

                            -- a) �������� �������� ������
                            select pns$.tw_kol from pns$ where pns$.pns$_id = :pns1_id into :PNS1_TW_KOL;
                            update pns$ set pns$.tw_kol = :PNS1_TW_KOL - :tw_kol, pns$.tw_summ = pns$.tw_summ * (:PNS1_TW_KOL - :tw_kol)/:PNS1_TW_KOL,
                            pns$.pns$_nds_summ = pns$.pns$_nds_summ * (:PNS1_TW_KOL - :tw_kol)/:PNS1_TW_KOL where pns$_id = :pns1_id;
    
                            -- �)�������� ������ ������ -  - ������������� ���������� ������ ������
                            update rns set rns.tw_kol = rns.tw_kol - :tw_kol where rns.rns_id = :rns1_id;
                            --��� ���� ������������� ��������������� ��������� ������ � �������.
                            -- �) �� ��������� re - ��� ���� ����������� - �������� ���������� ������ �������� calc_kol
                            update re set re.calc_kol = re.calc_kol - :tw_kol where re.ids = :rns1_id and re.pp_ids+0 = :pns1_id;
    
                            delete from rns where rns.rns_id = :rns0_id;
                            --������������� ��������� ������� � �������� ������.

                        end

                    end  --- ����� ��� ��� ������� ������. ��� ������ ����������.


          end
           else
          begin
                 -- a) �������� �������� ������
                select pns$.tw_kol from pns$ where pns$.pns$_id = :pns0_id into :PNS0_TW_KOL;
    
                update pns$ set pns$.tw_kol = :PNS0_TW_KOL - :tw_kol, pns$.tw_summ = pns$.tw_summ * (:PNS0_TW_KOL - :tw_kol)/:PNS0_TW_KOL,
                pns$.pns$_nds_summ = pns$.pns$_nds_summ * (:PNS0_TW_KOL - :tw_kol/:PNS0_TW_KOL) where pns$_id = :pns0_id;
                 ---- �) ������ ������. ���� ���������� ������� � �������� ������
                delete from rns where rns.rns_id = :rns0_id;
                --������������� ��������� ������� � �������� ������.
          end

--        delete from rns where rns_id = :rns_id;
       --  suspend;
      end








  --  suspend;
    select sum(ost.tw_kol) from ost where tw_id = :tw_id into :tw_ost2;

    if (bg_abs(tw_ost - tw_ost2)> 0.001) then
        exception TW_USE;


end^

SET TERM ; ^

/* Following GRANT statements are generated automatically */

GRANT SELECT,DELETE,UPDATE ON RNS TO PROCEDURE SLIM_BASE_REMOVE_RNS;
GRANT SELECT ON OST TO PROCEDURE SLIM_BASE_REMOVE_RNS;
GRANT SELECT,UPDATE ON RE TO PROCEDURE SLIM_BASE_REMOVE_RNS;
GRANT SELECT,UPDATE ON PNS$ TO PROCEDURE SLIM_BASE_REMOVE_RNS;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE SLIM_BASE_REMOVE_RNS TO BEGINNER;

SET TERM ^ ;

create or alter procedure SLIM_BASE_LIST_RNS_FOR_DELETE
returns (
    RNS_ID integer)
as
begin
  for select rns_id from rns rns1, rn, reg, re
    where rns.rn_id = rn.rn_id
    and reg.id = rns.rns_id

    and not rn.rntyp_id+0 in(160010004, 160010005, 6)
    and rn.rnvid_id+0 = 1
    and rn.rn_prow+0=1
    and reg.dt BETWEEN  '2000-12-28' AND '2015-01-01'
    and reg.typ+0=1
    and not (exists(select * from rns rns0 where rns0.wozw_id = rns1.rns_id))
    and re.ids = rns.rns_id and re.typ+0=1 and re.pp_typ+0=11 and re.calc_kol+0=rns.tw_kol

    and reg.tw_id= 2983611

        into :rns_id do
      suspend;
end^

SET TERM ; ^

/* Following GRANT statements are generated automatically */

GRANT SELECT ON RNS TO PROCEDURE SLIM_BASE_LIST_RNS_FOR_DELETE;
GRANT SELECT ON RN TO PROCEDURE SLIM_BASE_LIST_RNS_FOR_DELETE;
GRANT SELECT ON REG TO PROCEDURE SLIM_BASE_LIST_RNS_FOR_DELETE;
GRANT SELECT ON RE TO PROCEDURE SLIM_BASE_LIST_RNS_FOR_DELETE;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE SLIM_BASE_LIST_RNS_FOR_DELETE TO BEGINNER;

