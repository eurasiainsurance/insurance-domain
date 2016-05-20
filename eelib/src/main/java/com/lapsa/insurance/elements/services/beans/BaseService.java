package com.lapsa.insurance.elements.services.beans;

import java.util.ArrayList;
import java.util.List;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;

import com.lapsa.insurance.elements.services.ItemService;

public abstract class BaseService<T> implements ItemService<T> {

    protected abstract String getMessageBundleBase();

    protected abstract String getMessageBundleName();

    @Override
    public List<SelectItem> getAllItemsSI() {
	return _createSIFromList(getAllItems());
    }

    @Override
    public List<SelectItem> getAllItemsShortSI() {
	return _createShortSIFromList(getAllItems());
    }

    @Override
    public List<T> getSelectableItems() {
	return getAllItems(); // by default is the same that 'allItems'
    }

    @Override
    public List<SelectItem> getSelectableItemsSI() {
	return _createSIFromList(getSelectableItems());
    }

    @Override
    public List<SelectItem> getSelectableItemsShortSI() {
	return _createShortSIFromList(getSelectableItems());
    }

    @Override
    public String localizedKey(String key) {
	FacesContext facesContext = FacesContext.getCurrentInstance();
	String bundleName = getMessageBundleName();
	ResourceBundle bundle = facesContext.getApplication().getResourceBundle(facesContext, bundleName);
	if (key == null)
	    return null;
	try {
	    return bundle.getString(key);
	} catch (MissingResourceException e) {
	    return null;
	}
    }

    protected List<SelectItem> _createSIFromList(List<T> list) {
	List<SelectItem> result = new ArrayList<>();
	for (T item : list)
	    result.add(new SelectItem(item, localized(item)));
	return result;
    }

    protected List<SelectItem> _createShortSIFromList(List<T> list) {
	List<SelectItem> result = new ArrayList<>();
	for (T item : list)
	    result.add(new SelectItem(item, localizedShort(item)));
	return result;
    }
}