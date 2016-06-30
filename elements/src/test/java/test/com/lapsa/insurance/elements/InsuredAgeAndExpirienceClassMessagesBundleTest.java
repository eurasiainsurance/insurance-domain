package test.com.lapsa.insurance.elements;

import com.lapsa.insurance.elements.InsuredAgeAndExpirienceClass;

import test.com.lapsa.insurance.EnumTypeMessagesBundleTest;

public class InsuredAgeAndExpirienceClassMessagesBundleTest
	extends EnumTypeMessagesBundleTest<InsuredAgeAndExpirienceClass> {

    @Override
    protected InsuredAgeAndExpirienceClass[] getAllEnumValues() {
	return InsuredAgeAndExpirienceClass.values();
    }

    @Override
    protected String getBundleBaseName() {
	return InsuredAgeAndExpirienceClass.BUNDLE_BASENAME;
    }
}
