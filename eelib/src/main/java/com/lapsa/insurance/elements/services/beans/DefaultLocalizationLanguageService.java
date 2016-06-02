
package com.lapsa.insurance.elements.services.beans;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.enterprise.context.ApplicationScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;

import com.lapsa.insurance.elements.services.LocalizationLanguageService;
import com.lapsa.localization.LocalizationLanguage;

@Named("localizationLanguageService")
@ApplicationScoped
public class DefaultLocalizationLanguageService extends GenericEnumService<LocalizationLanguage>
	implements LocalizationLanguageService {

    @Override
    public List<LocalizationLanguage> getAllItems() {
	return CollectionUtils.toList(LocalizationLanguage.values());
    }

    @Override
    public List<LocalizationLanguage> getSelectableItems() {
	FacesContext context = FacesContext.getCurrentInstance();
	Iterator<Locale> i = context.getApplication().getSupportedLocales();
	List<LocalizationLanguage> ret = new ArrayList<>();
	while (i.hasNext()) {
	    Locale locale = i.next();
	    LocalizationLanguage l = LocalizationLanguage.byTag(locale.getLanguage());
	    if (l != null)
		ret.add(l);
	}
	return ret;
    }

    @Override
    protected String getMessageBundleBase() {
	return LocalizationLanguage.BUNDLE_BASENAME;
    }

    @Override
    protected String getMessageBundleVar() {
	return LocalizationLanguage.BUNDLE_VAR;
    }
}
