package kz.theeurasia.esbdproxy.service.ejbimpl.test;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.*;

import java.util.List;

import javax.naming.NamingException;

import org.junit.Test;

import kz.theeurasia.esbdproxy.domain.entities.CityEntity;
import kz.theeurasia.esbdproxy.services.CityServiceDAO;
import kz.theeurasia.esbdproxy.services.NotFound;

public class CityServiceTestCase extends GeneralServiceTestCase {

    @Test
    public void testGetAll() throws NamingException {
	CityServiceDAO service = getCityService();
	List<CityEntity> all = service.getAll();
	assertThat(all,
		allOf(
			not(nullValue()),
			not(empty())));
    }

    @Test
    public void testGetById() throws NamingException {
	CityServiceDAO service = getCityService();
	List<CityEntity> list = service.getAll();
	for (CityEntity i : list) {
	    try {
		CityEntity res = service.getById(i.getId());
		assertThat(res, allOf(not(nullValue()), is(i)));
	    } catch (NotFound e) {
		fail(e.getMessage());
	    }
	}
    }

    @Test(expected = NotFound.class)
    public void testGetById_NotFound() throws NamingException, NotFound {
	CityServiceDAO service = getCityService();
	service.getById(-99999l);
    }
}
