-- MIGRATION SCRIPT FROM 1.13 TO 2.4

/*
 * INSURANCE_REQUEST
 */
ALTER TABLE INSURANCE_REQUEST
	ADD COLUMN PAYMENT_METHOD_NAME VARCHAR(255) AFTER PAYMENT_METHOD,
	ADD COLUMN PAYMENT_AMOUNT DOUBLE AFTER PAYMENT_METHOD_NAME,
	CHANGE COLUMN POST_INSTANT PAYMENT_INSTANT DATETIME,
	CHANGE COLUMN POST_REFERENCE PAYMENT_REFERENCE VARCHAR(255),
	CHANGE COLUMN EXTERNAL_ID PAYMENT_INVOICE_NUMBER VARCHAR(255);

ALTER TABLE INSURANCE_REQUEST
	DROP COLUMN PAYMENT_METHOD;


-- drop FKs

ALTER TABLE DRIVER_LICENSE DROP FOREIGN KEY FK_DRIVER_LICENSE_BACKSIDE_IMAGE_ID;
ALTER TABLE DRIVER_LICENSE DROP FOREIGN KEY FK_DRIVER_LICENSE_FRONTSIDE_IMAGE_ID;

ALTER TABLE IDENTITY_CARD DROP FOREIGN KEY FK_IDENTITY_CARD_BACKSIDE_IMAGE_ID;
ALTER TABLE IDENTITY_CARD DROP FOREIGN KEY FK_IDENTITY_CARD_FRONTSIDE_IMAGE_ID;

ALTER TABLE VEHICLE_CERTIFICATE DROP FOREIGN KEY FK_VEHICLE_CERTIFICATE_BACKSIDE_IMAGE_ID;
ALTER TABLE VEHICLE_CERTIFICATE DROP FOREIGN KEY FK_VEHICLE_CERTIFICATE_FRONTSIDE_IMAGE_ID;

ALTER TABLE CASCO_VEHICLE DROP FOREIGN KEY FK_CASCO_VEHICLE_VIEW1_IMAGE_ID;
ALTER TABLE CASCO_VEHICLE DROP FOREIGN KEY FK_CASCO_VEHICLE_VIEW2_IMAGE_ID;
ALTER TABLE CASCO_VEHICLE DROP FOREIGN KEY FK_CASCO_VEHICLE_VIEW3_IMAGE_ID;
ALTER TABLE CASCO_VEHICLE DROP FOREIGN KEY FK_CASCO_VEHICLE_VIEW4_IMAGE_ID;

-- change types

ALTER TABLE IMAGE CHANGE COLUMN ID ID INTEGER AUTO_INCREMENT NOT NULL;

ALTER TABLE DRIVER_LICENSE CHANGE FRONTSIDE_IMAGE_ID FRONTSIDE_IMAGE_ID INTEGER;
ALTER TABLE DRIVER_LICENSE CHANGE BACKSIDE_IMAGE_ID BACKSIDE_IMAGE_ID INTEGER;

ALTER TABLE IDENTITY_CARD CHANGE FRONTSIDE_IMAGE_ID FRONTSIDE_IMAGE_ID INTEGER;
ALTER TABLE IDENTITY_CARD CHANGE BACKSIDE_IMAGE_ID BACKSIDE_IMAGE_ID INTEGER;

ALTER TABLE VEHICLE_CERTIFICATE CHANGE FRONTSIDE_IMAGE_ID FRONTSIDE_IMAGE_ID INTEGER;
ALTER TABLE VEHICLE_CERTIFICATE CHANGE BACKSIDE_IMAGE_ID BACKSIDE_IMAGE_ID INTEGER;

ALTER TABLE CASCO_VEHICLE CHANGE VIEW1_IMAGE_ID VIEW1_IMAGE_ID INTEGER;
ALTER TABLE CASCO_VEHICLE CHANGE VIEW2_IMAGE_ID VIEW2_IMAGE_ID INTEGER;
ALTER TABLE CASCO_VEHICLE CHANGE VIEW3_IMAGE_ID VIEW3_IMAGE_ID INTEGER;
ALTER TABLE CASCO_VEHICLE CHANGE VIEW4_IMAGE_ID VIEW4_IMAGE_ID INTEGER;


-- add FKs

ALTER TABLE DRIVER_LICENSE ADD CONSTRAINT FK_DRIVER_LICENSE_BACKSIDE_IMAGE_ID FOREIGN KEY (BACKSIDE_IMAGE_ID) REFERENCES IMAGE (ID);
ALTER TABLE DRIVER_LICENSE ADD CONSTRAINT FK_DRIVER_LICENSE_FRONTSIDE_IMAGE_ID FOREIGN KEY (FRONTSIDE_IMAGE_ID) REFERENCES IMAGE (ID);

ALTER TABLE IDENTITY_CARD ADD CONSTRAINT FK_IDENTITY_CARD_BACKSIDE_IMAGE_ID FOREIGN KEY (BACKSIDE_IMAGE_ID) REFERENCES IMAGE (ID);
ALTER TABLE IDENTITY_CARD ADD CONSTRAINT FK_IDENTITY_CARD_FRONTSIDE_IMAGE_ID FOREIGN KEY (FRONTSIDE_IMAGE_ID) REFERENCES IMAGE (ID);

ALTER TABLE VEHICLE_CERTIFICATE ADD CONSTRAINT FK_VEHICLE_CERTIFICATE_BACKSIDE_IMAGE_ID FOREIGN KEY (BACKSIDE_IMAGE_ID) REFERENCES IMAGE (ID);
ALTER TABLE VEHICLE_CERTIFICATE ADD CONSTRAINT FK_VEHICLE_CERTIFICATE_FRONTSIDE_IMAGE_ID FOREIGN KEY (FRONTSIDE_IMAGE_ID) REFERENCES IMAGE (ID);

ALTER TABLE CASCO_VEHICLE ADD CONSTRAINT FK_CASCO_VEHICLE_VIEW1_IMAGE_ID FOREIGN KEY (VIEW1_IMAGE_ID) REFERENCES IMAGE (ID);
ALTER TABLE CASCO_VEHICLE ADD CONSTRAINT FK_CASCO_VEHICLE_VIEW2_IMAGE_ID FOREIGN KEY (VIEW2_IMAGE_ID) REFERENCES IMAGE (ID);
ALTER TABLE CASCO_VEHICLE ADD CONSTRAINT FK_CASCO_VEHICLE_VIEW3_IMAGE_ID FOREIGN KEY (VIEW3_IMAGE_ID) REFERENCES IMAGE (ID);
ALTER TABLE CASCO_VEHICLE ADD CONSTRAINT FK_CASCO_VEHICLE_VIEW4_IMAGE_ID FOREIGN KEY (VIEW4_IMAGE_ID) REFERENCES IMAGE (ID);

/*
 * CREATE TABLE INSURANCE_REQUEST (ID INTEGER NOT NULL, AGREEMENT_NUMBER VARCHAR(255), TRANSACTION_PROBLEM VARCHAR(255), TRANSACTION_STATUS VARCHAR(255), RTYPE VARCHAR(255), OBTAINING_DELIVERY_ADDRESS VARCHAR(255), OBTAINING_DELIVERY_CITY VARCHAR(255), OBTAINING_DELIVERY_DATE DATE, OBTAINING_DELIVERY_TIME VARCHAR(255), OBTAINING_METHOD VARCHAR(255), OBTAINING_PICKUP_CITY VARCHAR(255), OBTAINING_STATUS VARCHAR(255), OBTAINING_PICKUPPOS_ID INTEGER,                                                       PAYMENT_INVOICE_NUMBER VARCHAR(255), PAYMENT_METHOD_NAME VARCHAR(255), PAYMENT_AMOUNT DOUBLE, PAYMENT_INSTANT DATETIME, PAYMENT_REFERENCE VARCHAR(255), PAYMENT_STATUS VARCHAR(255), PRIMARY KEY (ID))
 * CREATE TABLE INSURANCE_REQUEST (ID INTEGER NOT NULL, AGREEMENT_NUMBER VARCHAR(255), TRANSACTION_PROBLEM VARCHAR(255), TRANSACTION_STATUS VARCHAR(255), RTYPE VARCHAR(255), OBTAINING_DELIVERY_ADDRESS VARCHAR(255), OBTAINING_DELIVERY_CITY VARCHAR(255), OBTAINING_DELIVERY_DATE DATE, OBTAINING_DELIVERY_TIME VARCHAR(255), OBTAINING_METHOD VARCHAR(255), OBTAINING_PICKUP_CITY VARCHAR(255), OBTAINING_STATUS VARCHAR(255), OBTAINING_PICKUPPOS_ID INTEGER, PAYMENT_AMOUNT DOUBLE, PAYMENT_CURRENCY VARCHAR(255), PAYMENT_INVOICE_NUMBER VARCHAR(255), PAYMENT_METHOD_NAME VARCHAR(255),                        PAYMENT_INSTANT DATETIME, PAYMENT_REFERENCE VARCHAR(255), PAYMENT_STATUS VARCHAR(255), PRIMARY KEY (ID))
 */

ALTER TABLE INSURANCE_REQUEST CHANGE COLUMN PAYMENT_AMOUNT PAYMENT_AMOUNT DOUBLE AFTER OBTAINING_PICKUPPOS_ID;
ALTER TABLE INSURANCE_REQUEST ADD COLUMN PAYMENT_CURRENCY VARCHAR(255) AFTER PAYMENT_AMOUNT;

/*
 * CREATE TABLE POLICY (ID INTEGER AUTO_INCREMENT NOT NULL, *ACTUAL_PERMIUM_COST DOUBLE, *CALCULATED_PERMIUM_COST DOUBLE, *DISCOUNT_AMOUNT DOUBLE, *PREMIUM_CURRENCY VARCHAR(255),                                                                                                                      PERIOD_FROM DATE, PERIOD_TO DATE, PRIMARY KEY (ID))
 * CREATE TABLE POLICY (ID INTEGER AUTO_INCREMENT NOT NULL,                                                                                                                        *CALCULATED_AMOUNT DOUBLE, *CALCULATED_CURRENCY VARCHAR(255), *PAID_AMOUNT_TO_BE_REMOVED_IN_THE_NEXT_RELEASE DOUBLE, PERIOD_FROM DATE, PERIOD_TO DATE, PRIMARY KEY (ID))
 */

ALTER TABLE POLICY CHANGE COLUMN CALCULATED_PERMIUM_COST CALCULATED_AMOUNT DOUBLE AFTER ID;
ALTER TABLE POLICY CHANGE COLUMN PREMIUM_CURRENCY CALCULATED_CURRENCY VARCHAR(255) AFTER CALCULATED_AMOUNT;
ALTER TABLE POLICY CHANGE COLUMN ACTUAL_PERMIUM_COST PAID_AMOUNT_TO_BE_REMOVED_IN_THE_NEXT_RELEASE DOUBLE AFTER CALCULATED_CURRENCY; 
ALTER TABLE POLICY DROP COLUMN DISCOUNT_AMOUNT;

/*
 * CREATE TABLE CASCO (ID INTEGER AUTO_INCREMENT NOT NULL, CONTRACT_ENDS_AFTER_FIRST_CASE TINYINT(1) default 0, COVER_NON_ROAD_ACCIDENTS TINYINT(1) default 0, COVER_ROAD_ACCIDENTS TINYINT(1) default 0, DEDUCTIBLE_FULL_RATE VARCHAR(255), DEDUCTIBLE_PARTIAL_RATE VARCHAR(255), DEDUCTIBLE_PARTIAL_REQUIRED TINYINT(1) default 0, DRIVER_AND_PASSENGER_COUNT INTEGER, DRIVER_AND_PASSENGER_COVERAGE TINYINT(1) default 0, EVACUATOR_REQUIRED TINYINT(1) default 0, HELP_WITH_POLICY_REQUIRED TINYINT(1) default 0, NO_GUILT_NO_DEDUCTIBLE_REQUIRED TINYINT(1) default 0, NO_POLICE_CALL_REQUIRED TINYINT(1) default 0, REPLACEMENT_CAR_REQUIRED TINYINT(1) default 0, SPECIAL_SERVICES_STATION_REQUIRED TINYINT(1) default 0, THIRD_PARTY_LIABILITY_COVERAGE TINYINT(1) default 0, ACTUAL_PERMIUM_COST DOUBLE, CALCULATED_PERMIUM_COST DOUBLE, DISCOUNT_AMOUNT DOUBLE, PREMIUM_CURRENCY VARCHAR(255),                                                                                                                   PERIOD_FROM DATE, PERIOD_TO DATE, CASCO_VEHICLE_ID INTEGER, PRIMARY KEY (ID))
 * CREATE TABLE CASCO (ID INTEGER AUTO_INCREMENT NOT NULL, CONTRACT_ENDS_AFTER_FIRST_CASE TINYINT(1) default 0, COVER_NON_ROAD_ACCIDENTS TINYINT(1) default 0, COVER_ROAD_ACCIDENTS TINYINT(1) default 0, DEDUCTIBLE_FULL_RATE VARCHAR(255), DEDUCTIBLE_PARTIAL_RATE VARCHAR(255), DEDUCTIBLE_PARTIAL_REQUIRED TINYINT(1) default 0, DRIVER_AND_PASSENGER_COUNT INTEGER, DRIVER_AND_PASSENGER_COVERAGE TINYINT(1) default 0, EVACUATOR_REQUIRED TINYINT(1) default 0, HELP_WITH_POLICY_REQUIRED TINYINT(1) default 0, NO_GUILT_NO_DEDUCTIBLE_REQUIRED TINYINT(1) default 0, NO_POLICE_CALL_REQUIRED TINYINT(1) default 0, REPLACEMENT_CAR_REQUIRED TINYINT(1) default 0, SPECIAL_SERVICES_STATION_REQUIRED TINYINT(1) default 0, THIRD_PARTY_LIABILITY_COVERAGE TINYINT(1) default 0,                                                                                                                    CALCULATED_AMOUNT DOUBLE, CALCULATED_CURRENCY VARCHAR(255), PAID_AMOUNT_TO_BE_REMOVED_IN_THE_NEXT_RELEASE DOUBLE, PERIOD_FROM DATE, PERIOD_TO DATE, CASCO_VEHICLE_ID INTEGER, PRIMARY KEY (ID))
 */

ALTER TABLE CASCO CHANGE COLUMN CALCULATED_PERMIUM_COST CALCULATED_AMOUNT DOUBLE AFTER THIRD_PARTY_LIABILITY_COVERAGE;
ALTER TABLE CASCO CHANGE COLUMN PREMIUM_CURRENCY CALCULATED_CURRENCY VARCHAR(255) AFTER CALCULATED_AMOUNT;
ALTER TABLE CASCO CHANGE COLUMN ACTUAL_PERMIUM_COST PAID_AMOUNT_TO_BE_REMOVED_IN_THE_NEXT_RELEASE DOUBLE AFTER CALCULATED_CURRENCY; 
ALTER TABLE CASCO DROP COLUMN DISCOUNT_AMOUNT;


/*
 * CREATE TABLE INSURANCE_REQUEST (ID INTEGER NOT NULL, AGREEMENT_NUMBER VARCHAR(255), TRANSACTION_PROBLEM VARCHAR(255), TRANSACTION_STATUS VARCHAR(255), RTYPE VARCHAR(255), OBTAINING_DELIVERY_ADDRESS VARCHAR(255), OBTAINING_DELIVERY_CITY VARCHAR(255), OBTAINING_DELIVERY_DATE DATE, OBTAINING_DELIVERY_TIME VARCHAR(255), OBTAINING_METHOD VARCHAR(255), OBTAINING_PICKUP_CITY VARCHAR(255), OBTAINING_STATUS VARCHAR(255), OBTAINING_PICKUPPOS_ID INTEGER, PAYMENT_AMOUNT DOUBLE, PAYMENT_CURRENCY VARCHAR(255), PAYMENT_INVOICE_NUMBER VARCHAR(255), PAYMENT_METHOD_NAME VARCHAR(255), PAYMENT_INSTANT DATETIME, PAYMENT_REFERENCE VARCHAR(255), PAYMENT_STATUS VARCHAR(255), PRIMARY KEY (ID))
 * CREATE TABLE INSURANCE_REQUEST (ID INTEGER NOT NULL, AGREEMENT_NUMBER VARCHAR(255), TRANSACTION_PROBLEM VARCHAR(255), TRANSACTION_STATUS VARCHAR(255), RTYPE VARCHAR(255),                                                                                                                                                                                                                                                                                      PAYMENT_AMOUNT DOUBLE, PAYMENT_CURRENCY VARCHAR(255), PAYMENT_INVOICE_NUMBER VARCHAR(255), PAYMENT_METHOD_NAME VARCHAR(255), PAYMENT_INSTANT DATETIME, PAYMENT_REFERENCE VARCHAR(255), PAYMENT_STATUS VARCHAR(255), PRIMARY KEY (ID))
 */

ALTER TABLE INSURANCE_REQUEST DROP COLUMN OBTAINING_DELIVERY_ADDRESS; 
ALTER TABLE INSURANCE_REQUEST DROP COLUMN OBTAINING_DELIVERY_CITY; 
ALTER TABLE INSURANCE_REQUEST DROP COLUMN OBTAINING_DELIVERY_DATE; 
ALTER TABLE INSURANCE_REQUEST DROP COLUMN OBTAINING_DELIVERY_TIME; 
ALTER TABLE INSURANCE_REQUEST DROP COLUMN OBTAINING_METHOD; 
ALTER TABLE INSURANCE_REQUEST DROP COLUMN OBTAINING_PICKUP_CITY; 
ALTER TABLE INSURANCE_REQUEST DROP COLUMN OBTAINING_STATUS; 
ALTER TABLE INSURANCE_REQUEST DROP FOREIGN KEY FK_INSURANCE_REQUEST_OBTAINING_PICKUPPOS_ID;
ALTER TABLE INSURANCE_REQUEST DROP COLUMN OBTAINING_PICKUPPOS_ID; 

/*
 * CREATE TABLE INSURANCE_REQUEST (ID INTEGER NOT NULL, AGREEMENT_NUMBER VARCHAR(255), TRANSACTION_PROBLEM VARCHAR(255), TRANSACTION_STATUS VARCHAR(255), RTYPE VARCHAR(255), PAYMENT_AMOUNT DOUBLE, PAYMENT_CURRENCY VARCHAR(255),                           PAYMENT_INVOICE_NUMBER VARCHAR(255), PAYMENT_METHOD_NAME VARCHAR(255), PAYMENT_INSTANT DATETIME, PAYMENT_REFERENCE VARCHAR(255), PAYMENT_STATUS VARCHAR(255), PRIMARY KEY (ID))
 * CREATE TABLE INSURANCE_REQUEST (ID INTEGER NOT NULL, AGREEMENT_NUMBER VARCHAR(255), TRANSACTION_PROBLEM VARCHAR(255), TRANSACTION_STATUS VARCHAR(255), RTYPE VARCHAR(255), PAYMENT_AMOUNT DOUBLE, PAYMENT_CURRENCY VARCHAR(255), PAYMENT_INSTANT DATETIME, PAYMENT_INVOICE_NUMBER VARCHAR(255), PAYMENT_METHOD_NAME VARCHAR(255),                           PAYMENT_REFERENCE VARCHAR(255), PAYMENT_STATUS VARCHAR(255), PRIMARY KEY (ID))
 */
ALTER TABLE INSURANCE_REQUEST CHANGE COLUMN PAYMENT_INSTANT PAYMENT_INSTANT DATETIME AFTER PAYMENT_CURRENCY;

/*
 * VERSION TABLE
 */
DROP TABLE VER_1_13;
CREATE TABLE INSURANCE_VER_2_4 (DUMMY INTEGER NOT NULL, PRIMARY KEY (DUMMY));