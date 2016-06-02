package com.lapsa.insurance.elements.services;

import java.util.List;
import java.util.Locale;

import javax.faces.model.SelectItem;

public interface EnumService<T extends Enum<?>> extends ItemService<T> {

    List<T> getAllItems();

    List<T> getSelectableItems();

    List<SelectItem> getAllItemsSI();

    List<SelectItem> getAllItemsShortSI();

    List<SelectItem> getSelectableItemsSI();

    List<SelectItem> getSelectableItemsShortSI();

    String enumNameLocalized(T value);

    String enumNameLocalized(T value, Locale locale);

    String enumNameLocalizedShort(T value);

    String enumNameLocalizedShort(T value, Locale locale);
}
