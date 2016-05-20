package com.lapsa.insurance.elements.services.beans;

import com.lapsa.insurance.elements.services.ItemService;

public abstract class EnumService<T extends Enum<T>> extends BaseService<T> implements ItemService<T> {

    @Override
    public String localized(T value) {
	if (value == null)
	    return null;
	return localizedKey(String.format("%1$s.%2$s", value.getClass().getName(), value.name()));
    }

    @Override
    public String localizedShort(T value) {
	if (value == null)
	    return null;
	String ret = localizedKey(String.format("%1$s.%2$s.short", value.getClass().getName(), value.name()));
	if (ret != null)
	    return ret;
	return localized(value);
    }

}