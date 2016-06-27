package com.lapsa.insurance.domain;

import com.lapsa.insurance.validation.NotNullValue;
import com.lapsa.internet.validators.ValidEmail;
import com.lapsa.internet.validators.ValidURL;
import com.lapsa.phone.PhoneNumber;
import com.lapsa.phone.validators.ValidPhoneNumber;

public class ContactData extends BaseDomain {
    private static final long serialVersionUID = 6954755236615159684L;
    private static final int PRIME = 13;
    private static final int MULTIPLIER = 13;

    @NotNullValue
    @ValidPhoneNumber
    private PhoneNumber phone;

    @NotNullValue
    @ValidEmail
    private String email;

    @ValidURL
    private String siteUrl;

    @Override
    protected int getPrime() {
	return PRIME;
    }

    @Override
    protected int getMultiplier() {
	return MULTIPLIER;
    }

    // GENERATED

    public PhoneNumber getPhone() {
	return phone;
    }

    public void setPhone(PhoneNumber phone) {
	this.phone = phone;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getSiteUrl() {
	return siteUrl;
    }

    public void setSiteUrl(String siteUrl) {
	this.siteUrl = siteUrl;
    }

}
