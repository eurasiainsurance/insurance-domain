-- MIGRATION SCRIPT FROM 2.5.3 TO 10


/*
 * VERSION TABLE
 */
DROP TABLE INSURANCE_VER_2_5_3;
CREATE TABLE INSURANCE_VER_10 (DUMMY INTEGER NOT NULL, PRIMARY KEY (DUMMY));
