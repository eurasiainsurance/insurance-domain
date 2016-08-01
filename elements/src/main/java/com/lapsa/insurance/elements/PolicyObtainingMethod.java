package com.lapsa.insurance.elements;

import com.lapsa.insurance.ElementsBundleBase;

public enum PolicyObtainingMethod implements ElementsBundleBase {
    DELIVERY, // доставить курьером
    PICKUP, // забрать самостоятельно в офисе компании
    //
    ;

    @Override
    public String canonicalName() {
	return String.format("%1$s.%2$s", this.getClass().getName(), name());
    }
}