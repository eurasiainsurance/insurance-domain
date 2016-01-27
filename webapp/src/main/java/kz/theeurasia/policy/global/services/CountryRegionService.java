package kz.theeurasia.police.global.services;

import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

import kz.theeurasia.services.domain.global.CountryRegion;

@ManagedBean(eager = true)
@ApplicationScoped
public class CountryRegionService {

    public CountryRegion[] getCountryRegions() {
	return CountryRegion.values();
    }
}