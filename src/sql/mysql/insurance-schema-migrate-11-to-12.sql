-- MIGRATION SCRIPT FROM 11 TO 12


/*
 * VERSION TABLE
 */
DROP TABLE INSURANCE_VER_11;
CREATE TABLE INSURANCE_VER_12 (DUMMY INTEGER NOT NULL, PRIMARY KEY (DUMMY));
