SELECT '«¿ ' TC , tmp_report_int_move.tw_id ID,
(select tw_price_frm.money from  tw_price_frm(tmp_report_int_move.tw_id, 5, 0, 0)) PRICE
from tmp_report_int_move
where report_id=2017

