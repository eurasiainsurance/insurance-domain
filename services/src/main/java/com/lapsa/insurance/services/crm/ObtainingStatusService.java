package com.lapsa.insurance.services.crm;

import java.util.List;

import javax.faces.model.SelectItem;

import com.lapsa.insurance.crm.ObtainingStatus;
import com.lapsa.insurance.services.EnumListingNamingService;

public interface ObtainingStatusService extends EnumListingNamingService<ObtainingStatus> {

    List<ObtainingStatus> getValueItems();

    List<SelectItem> getValueItemsSI();

    List<SelectItem> getValueItemsShortSI();

    List<SelectItem> getValueItemsFullSI();

    List<ObtainingStatus> getNonValueItems();

    List<SelectItem> getNonValueItemsSI();

    List<SelectItem> getNonValueItemsShortSI();

    List<SelectItem> getNonValueItemsFullSI();
}
