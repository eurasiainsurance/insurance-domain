package com.lapsa.insurance.domain;

import java.time.Instant;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import tech.lapsa.java.commons.function.MyNumbers;
import tech.lapsa.java.commons.function.MyOptionals;

@MappedSuperclass
public abstract class EntitySuperclass extends Domain {

    private static final long serialVersionUID = 1L;

    protected EntitySuperclass() {
    }

    protected EntitySuperclass(final Integer id) {
	this.id = MyNumbers.requireNonZero(id, "id");
    }

    // id

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Integer id;

    public Integer getId() {
	return id;
    }

    // updated

    @Basic
    @Column(name = "UPDATED", nullable = false)
    private Instant updated = Instant.now();

    public Instant getUpdated() {
	return updated;
    }

    public void touchUpdated() {
	this.updated = Instant.now();
    }

    protected String appendEntityId() {
	return appendEntityId(id);
    }

    protected static String appendEntityId(final Object id) {
	return " [ID=" + MyOptionals.of(id).map(Object::toString).orElse("NONE") + "]";
    }
}
