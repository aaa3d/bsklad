select
card.card_id,
card.card_num,
card.card_date,
card.card_osn,
card.reg_date,
card.kln_fio,
card.kln_birthday,
card.kln_address,
card.kln_addinfo,
card.kln_phone,
card.kln_sex,
card.kln_reklama_dop,
card.kln_reklama_info,
card.check_sms,
/*card.check_pers_dann,
card.passport_ser,
card.passport_number,
card.passport_vidan
*/
(select get_cardskid.skid_percent from  get_cardskid(card.card_id, 0)) card_skid

from card, cardskidlink
where cardskidlink.card_id = card.card_id
and not cardskidlink.cardskid_id=102007
and not cardskidlink.cardskid_id=1202022



