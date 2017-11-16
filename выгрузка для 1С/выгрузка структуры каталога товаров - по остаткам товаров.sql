select
tree.twtree_id ||","
--tree.twtree_full NAME,
--tree.parent_id PARENT


from tw, ed, twtree tree
where tw.ed_id = ed.ed_id
and tw.tw_brak=0
and tree.twtree_id = tw.twtree_id
and ((select ost_now_all.ost from  ost_now_all(tw.tw_id))>0.1
    or
    (exists(select * from reg where reg.tw_id = tw.tw_id and reg.dt>'2016-01-01'))
    )


group by 1



