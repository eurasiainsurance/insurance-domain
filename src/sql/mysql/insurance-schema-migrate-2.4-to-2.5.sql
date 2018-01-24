-- MIGRATION SCRIPT FROM 2.4 TO 2.5

ALTER TABLE POLICY DROP COLUMN PAID_AMOUNT_TO_BE_REMOVED_IN_THE_NEXT_RELEASE; 
ALTER TABLE CASCO DROP COLUMN PAID_AMOUNT_TO_BE_REMOVED_IN_THE_NEXT_RELEASE;

-- --->> MIGRATION FROM 2.4 TO 2.4.1

/*
 * CALLBACK-INSURANCE-REQUEST
 */

INSERT INTO INSURANCE_REQUEST 
	(
		ID,
		AGREEMENT_NUMBER,
		TRANSACTION_PROBLEM,
		TRANSACTION_STATUS,
		RTYPE, 
		PAYMENT_AMOUNT,
		PAYMENT_CURRENCY,
		PAYMENT_INSTANT,
		PAYMENT_INVOICE_NUMBER,
		PAYMENT_METHOD_NAME,
		PAYMENT_REFERENCE,
		PAYMENT_STATUS
	)
	SELECT
		ID,
		NULL,
		NULL,
		NULL,
		'UNCOMPLETE', 
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'UNDEFINED'
	FROM CALLBACK_REQUEST; 

ALTER TABLE REQUEST DROP COLUMN SOURCE;

-- <<--- MIGRATION FROM 2.4 TO 2.4.1


/*
 * VERSION TABLE
 */
DROP TABLE INSURANCE_VER_2_4;
CREATE TABLE INSURANCE_VER_2_5 (DUMMY INTEGER NOT NULL, PRIMARY KEY (DUMMY));
