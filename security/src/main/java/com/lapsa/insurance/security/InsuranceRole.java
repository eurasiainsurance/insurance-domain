package com.lapsa.insurance.security;

import com.lapsa.utils.security.SecurityRole;

public final class InsuranceRole implements SecurityRole {

    public static final String ADMIN = "admin";
    public static final String SPECIALIST = "specialist";
    public static final String AGENT = "agent";

    public static InsuranceRole ADMIN_ROLE = new InsuranceRole(ADMIN);
    public static InsuranceRole SPECIALIST_ROLE = new InsuranceRole(SPECIALIST);
    public static InsuranceRole AGENT_ROLE = new InsuranceRole(AGENT);

    private final String name;

    private InsuranceRole(String name) {
	this.name = name;
    }

    @Override
    public SecurityRole[] getRoles() {
	return new SecurityRole[] { this };
    }

    @Override
    public String name() {
	return name;
    }

}
