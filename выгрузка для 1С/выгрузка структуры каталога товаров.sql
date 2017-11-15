select
tw.twtree_id PARENT
from tw, ed, twtree
where tw.ed_id = ed.ed_id
and tw.tw_brak=0
and ((exists(select * from reg where reg.tw_id=tw.tw_id and reg.dt>'2017-01-01'))
    or ((select ost_now_all.ost from  ost_now_all(tw.tw_id))>0.1))

and "%"||tw.twtree_id||"%" like twtree.parents_ids
