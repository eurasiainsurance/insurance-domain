-- MIGRATION SCRIPT FROM 1.12.1 TO 1.13

/* 
 * inet addr
 */
ALTER TABLE REQUEST
	ADD COLUMN REQUESTER_INET_ADDR VARCHAR(255) AFTER UPDATED,
	ADD COLUMN REQUESTER_INET_HOST VARCHAR(255) AFTER REQUESTER_INET_ADDR; 

/*
 * previous migration issues fix
 */
ALTER TABLE INSURANCE_REQUEST ADD CONSTRAINT `FK_INSURANCE_REQUEST_ID` FOREIGN KEY (`ID`) REFERENCES `REQUEST` (`ID`);
ALTER TABLE POLICY_REQUEST DROP FOREIGN KEY FK_POLICY_REQUEST_ID;
ALTER TABLE POLICY_REQUEST ADD CONSTRAINT `FK_POLICY_REQUEST_ID` FOREIGN KEY (`ID`) REFERENCES `REQUEST` (`ID`);
ALTER TABLE CASCO_REQUEST DROP FOREIGN KEY FK_CASCO_REQUEST_ID;
ALTER TABLE CASCO_REQUEST ADD CONSTRAINT `FK_CASCO_REQUEST_ID` FOREIGN KEY (`ID`) REFERENCES `REQUEST` (`ID`);

/*
 * payment refs
 */
-- rename INSURANCE_REQUEST.PAYMENT_REFERENCE
ALTER TABLE INSURANCE_REQUEST  
	ADD COLUMN EXTERNAL_ID VARCHAR(255) AFTER OBTAINING_PICKUPPOS_ID;
UPDATE INSURANCE_REQUEST SET EXTERNAL_ID = PAYMENT_REFERENCE;
ALTER TABLE INSURANCE_REQUEST
	DROP COLUMN PAYMENT_REFERENCE;

-- add column INSURANCE_REQUEST.POST_INSTANT and INSURANCE_REQUEST.POST_REFERENCE
ALTER TABLE INSURANCE_REQUEST
	ADD COLUMN POST_INSTANT DATETIME AFTER PAYMENT_METHOD,
	ADD COLUMN POST_REFERENCE VARCHAR(255) AFTER POST_INSTANT; 

/*
 * VERSION TABLE
 */
DROP TABLE VER_1_12_1;
CREATE TABLE VER_1_13 (DUMMY INTEGER NOT NULL, PRIMARY KEY (DUMMY));
