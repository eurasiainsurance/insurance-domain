package tech.lapsa.insurance.domain;

import java.time.LocalDate;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Table(name = "CONTRACT")
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorColumn(name = "DISCR_TYPE")
public abstract class Contract extends LeadAttachement {

    private static final long serialVersionUID = 1L;

    // constructor

    protected Contract() {
    }

    // number

    @Basic
    @Column(name = "NUMBER")
    protected String number;

    public String getNumber() {
	return number;
    }

    // date

    @Basic
    @Column(name = "DATE")
    protected LocalDate date;

    public LocalDate getDate() {
	return date;
    }

    // party

    @Embedded
    @AttributeOverrides({
	    @AttributeOverride(name = "idNumber", column = @Column(name = "PARTY_IDNUMBER")),
	    @AttributeOverride(name = "name", column = @Column(name = "PARTY_NAME")),
	    @AttributeOverride(name = "firstName", column = @Column(name = "PARTY_FIRST_NAME")),
	    @AttributeOverride(name = "surename", column = @Column(name = "PARTY_SURENAME")),
	    @AttributeOverride(name = "patronymic", column = @Column(name = "PARTY_PATRONYMIC")),
	    @AttributeOverride(name = "dayOfBirth", column = @Column(name = "PARTY_DOB")),
    })
    protected PersonalInformation party;

    public PersonalInformation getParty() {
	return party;
    }

    // amount

    @Embedded
    @AttributeOverrides({
	    @AttributeOverride(name = "amount", column = @Column(name = "CONTRACT_AMOUNT")),
	    @AttributeOverride(name = "currency", column = @Column(name = "CONTRACT_CURRENCY")),
    })
    protected Amount amount;

    public Amount getAmount() {
	return amount;
    }
}
