-- MIGRATION SCRIPT FROM 1.7 TO 1.7.1

/*
 * CHANGES ON
 * eurasia36/eurasia36-crm#71
 */

/*
 * add column NOTE
 */
ALTER TABLE INSURANCE_REQUEST ADD COLUMN NOTE VARCHAR(255) AFTER CREATED;



/*
 * VERSION TABLE
 */
DROP TABLE VER_1_7;
CREATE TABLE VER_1_7_1 (DUMMY INTEGER NOT NULL, PRIMARY KEY (DUMMY));