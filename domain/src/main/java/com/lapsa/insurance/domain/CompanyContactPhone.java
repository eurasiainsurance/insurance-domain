package com.lapsa.insurance.domain;

import static com.lapsa.insurance.domain.DisplayNameElements.*;

import java.util.Locale;
import java.util.StringJoiner;

import com.lapsa.international.phone.PhoneNumber;
import com.lapsa.international.phone.PhoneType;

import tech.lapsa.java.commons.function.MyOptionals;
import tech.lapsa.java.commons.function.MyStrings;
import tech.lapsa.java.commons.localization.Localized;
import tech.lapsa.patterns.domain.HashCodePrime;

@HashCodePrime(7)
public class CompanyContactPhone extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private PhoneNumber phone;
    private PhoneType phoneType;

    @Override
    public String localized(LocalizationVariant variant, Locale locale) {
	StringBuilder sb = new StringBuilder();

	sb.append(MyOptionals.of(phoneType) //
		.map(Localized.toLocalizedMapper(variant, locale)) //
		.map(MyStrings::capitalizeFirstLetter) //
		.orElseGet(() -> COMPANY_CONTACT_PHONE.localized(variant, locale)));

	StringJoiner sj = new StringJoiner(", ", " ", "");
	sj.setEmptyValue("");

	sj.add(MyOptionals.of(phone) //
		.map(PhoneNumber::getFormatted) //
		.orElseGet(() -> "<" + COMPANY_CONTACT_PHONE_UNDEFINED.localized(variant, locale) + ">"));

	return sb.append(sj.toString()) //
		.append(appendEntityId()) //
		.toString();
    }

    // GENERATED

    public PhoneNumber getPhone() {
	return phone;
    }

    public void setPhone(PhoneNumber phone) {
	this.phone = phone;
    }

    public PhoneType getPhoneType() {
	return phoneType;
    }

    public void setPhoneType(PhoneType phoneType) {
	this.phoneType = phoneType;
    }
}
