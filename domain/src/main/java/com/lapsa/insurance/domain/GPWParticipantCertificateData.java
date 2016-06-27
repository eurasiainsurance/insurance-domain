package com.lapsa.insurance.domain;

import java.util.Date;

import com.lapsa.insurance.validation.NotEmptyString;
import com.lapsa.insurance.validation.NotNullValue;
import com.lapsa.insurance.validation.ValidDateOfIssue;

public class GPWParticipantCertificateData extends BaseDomain implements ScanCopiedDocument {
    private static final long serialVersionUID = -2962825826022534176L;
    private static final int PRIME = 23;
    private static final int MULTIPLIER = 23;

    @NotNullValue
    @NotEmptyString
    private String number;

    @NotNullValue
    @ValidDateOfIssue
    private Date dateOfIssue;

    private MultipageDocumentScan scan = new MultipageDocumentScan();

    @Override
    protected int getPrime() {
	return PRIME;
    }

    @Override
    protected int getMultiplier() {
	return MULTIPLIER;
    }

    // GENERATED

    public String getNumber() {
	return number;
    }

    public void setNumber(String number) {
	this.number = number;
    }

    public Date getDateOfIssue() {
	return dateOfIssue;
    }

    public void setDateOfIssue(Date dateOfIssue) {
	this.dateOfIssue = dateOfIssue;
    }

    @Override
    public MultipageDocumentScan getScan() {
	return scan;
    }

    public void setScan(MultipageDocumentScan scan) {
	this.scan = scan;
    }
}
