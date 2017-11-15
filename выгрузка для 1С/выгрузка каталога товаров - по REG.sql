select
tw.tw_id ID,
tw.tw_nam NAME,
tw.tw_nam FNAME,
tw.twtree_id PARENT,
ed.ed_short EDIZM,
tw.tw_weight VEDIZM,
0 OEDIZM,
1 VN,
1 NDA,
0 SZ,
'' PROIZV,
tw.tw_land STRANA,
substring (tw.tw_prim from 1 for 9000) OPIS,
'' KOMMENT,
0 PR,
0 UPAK,
0 IDS,
(select ost_now_all.ost from  ost_now_all(tw.tw_id)) KO,
0 SO


from tw, ed
where tw.ed_id = ed.ed_id
and tw.tw_brak=0
and ((exists(select * from reg where reg.tw_id=tw.tw_id and reg.dt>'2017-01-01'))
    or ((select ost_now_all.ost from  ost_now_all(tw.tw_id))>0.1))
