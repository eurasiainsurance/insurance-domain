-- MIGRATION SCRIPT FROM 1.10 TO 1.11

-- add USER.HIDDEN
ALTER TABLE USER
	ADD COLUMN HIDDEN TINYINT(1) default 0 AFTER EMAIL;

-- add REQUEST.SOURCE
ALTER TABLE REQUEST 
	ADD COLUMN SOURCE VARCHAR(255) AFTER PROGRESS_STATUS; 

UPDATE REQUEST 
	NATURAL LEFT JOIN INSURANCE_REQUEST
	SET REQUEST.SOURCE = 'API' 
	WHERE INSURANCE_REQUEST.RTYPE = 'API';

UPDATE REQUEST 
	SET SOURCE = 'API' 
	WHERE DTYPE = 'CallbackRequest';

UPDATE REQUEST 
	SET SOURCE = 'INTERNAL' 
	WHERE SOURCE IS NULL;

UPDATE INSURANCE_REQUEST
	SET RTYPE = 'EXPRESS'
	WHERE RTYPE = 'API';

/*
 * VERSION TABLE
 */
DROP TABLE VER_1_10;
CREATE TABLE VER_1_11 (DUMMY INTEGER NOT NULL, PRIMARY KEY (DUMMY));
