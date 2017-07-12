SET TERM ^ ;

ALTER TABLE RE ADD TM DATE ^

CREATE INDEX IDX_RE_TM ON RE (TM) ^

/* Triggers definition */



/* Trigger: RE_AD */
CREATE TRIGGER RE_AD FOR RE ACTIVE
AFTER DELETE POSITION 0
AS
BEGIN
  insert into DEL (TABNAME,TABNAME_ID)
  values ("RE",OLD.RE_ID);
END
^


/* Trigger: RE_BI */
CREATE TRIGGER RE_BI FOR RE ACTIVE
BEFORE INSERT POSITION 0
AS
BEGIN
   if (NEW.re_ID<0) then NEW.re_ID=-NEW.re_ID;
  ELSE BEGIN
    IF ((NEW.re_ID IS NULL) or (NEW.RE_ID = 0))  THEN NEW.re_ID=GEN_ID(GEN_re,1);
    NEW.TM="NOW";
  END
END
^


/* Trigger: RE_BU */
CREATE TRIGGER RE_BU FOR RE ACTIVE
BEFORE UPDATE POSITION 0
AS
BEGIN
  if (new.re_id<0) then begin
     NEW.re_ID=-NEW.re_ID;
  end else begin
     NEW.TM="NOW";
  end
END
^

update re set re_id = gen_id(gen_re, 1) ^

SET TERM ; ^
