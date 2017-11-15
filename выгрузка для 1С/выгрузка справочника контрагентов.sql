select k.kln_id ID,
k.kln_org NAME,
k.kln_full_name FNAME,
k.klntree_id PARENT,
k.kln_inn INN,
k.kln_kpp KPP,
k.kln_adr UA,
k.kln_office_adr FA,
k.kln_adr PA,
substring (k.kln_prim from 1 for 9000) KOMMENT,
1 UWL,
case when ((select count(*) from rn where rn.kln_id = k.kln_id and rn.rn_date>'2016-01-01')>0) then  1 else 0 end POK,
case when ((select count(*) from pn$ where pn$.kln_id = k.kln_id and pn$.pn$_date>'2016-01-01')>0) then 1 else 0 end POS,
k.kln_email MAIL,
k.kln_tel Tel,
k.kln_bik BIK,
k.kln_rs NS,
'' DI,
'' DOG,
0 NDOG,
null DDOG,
0 VDOG,
null TC,


-(select klnbalance.saldo from klnbalance where klnbalance.kln_id = kln.kln_id and klnbalance.frm_id=2702542) DOLG
from kln k

where k.usgroup_id = 3
and k.kln_prefix = ''
and
((select count(*) from rn where rn.kln_id = k.kln_id and rn.rn_date>'2016-01-01')>0
or
(select count(*) from pn$ where pn$.kln_id = k.kln_id and pn$.pn$_date>'2016-01-01')>0)
