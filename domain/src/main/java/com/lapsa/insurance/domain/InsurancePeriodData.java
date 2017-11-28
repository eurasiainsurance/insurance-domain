package com.lapsa.insurance.domain;

import static com.lapsa.insurance.domain.DisplayNameElements.*;

import java.time.LocalDate;
import java.util.Locale;
import java.util.StringJoiner;

import tech.lapsa.java.commons.function.MyOptionals;
import tech.lapsa.java.commons.localization.Localizeds;
import tech.lapsa.javax.validation.LocalDateComparison;
import tech.lapsa.javax.validation.NotNullValue;
import tech.lapsa.javax.validation.TemporalFuture;
import tech.lapsa.javax.validation.TemporalLeftBeforeRight;
import tech.lapsa.patterns.domain.Domain;
import tech.lapsa.patterns.domain.HashCodePrime;

@HashCodePrime(179)
public class InsurancePeriodData extends Domain {

    private static final long serialVersionUID = 1L;

    @NotNullValue
    @TemporalFuture(allowNow = true)
    private LocalDate from;

    @NotNullValue
    @TemporalFuture
    private LocalDate to;

    @Override
    public String localized(LocalizationVariant variant, Locale locale) {
	StringBuilder sb = new StringBuilder();

	sb.append(INSURANCE_PERIOD_DATA.localized(variant, locale));

	StringJoiner sj = new StringJoiner(", ", " ", "");
	sj.setEmptyValue("");

	MyOptionals.of(from) //
		.map(Localizeds.localDateMapper(locale)) //
		.map(INSURANCE_PERIOD_DATA_FROM.fieldAsCaptionMapper(variant, locale))
		.ifPresent(sj::add);

	MyOptionals.of(to) //
		.map(Localizeds.localDateMapper(locale)) //
		.map(INSURANCE_PERIOD_DATA_TILL.fieldAsCaptionMapper(variant, locale))
		.ifPresent(sj::add);

	return sb.append(sj.toString()) //
		.toString();
    }

    @TemporalLeftBeforeRight
    // method must be a getter (name begins with "get"). validation is not
    // processed if not
    public LocalDateComparison getComparision() {
	return new LocalDateComparison(from, to);
    }

    public LocalDate getFrom() {
	return from;
    }

    public void setFrom(LocalDate from) {
	this.from = from;
    }

    public LocalDate getTo() {
	return to;
    }

    public void setTo(LocalDate to) {
	this.to = to;
    }
}
