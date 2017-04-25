package com.lapsa.validators.messages.test;

import com.lapsa.insurance.validation.ValidIdentityCardType;
import com.lapsa.insurance.validation.ValidInsuranceAgeClass;
import com.lapsa.insurance.validation.ValidInsuranceClassType;
import com.lapsa.insurance.validation.ValidInsuranceExpirienceClass;
import com.lapsa.insurance.validation.ValidInsuranceRequestType;
import com.lapsa.insurance.validation.ValidPaymentMethod;
import com.lapsa.insurance.validation.ValidPolicyVehicleAgeClass;
import com.lapsa.insurance.validation.ValidPolicyVehicleClass;
import com.lapsa.insurance.validation.ValidVehicleRegistrationNumber;
import com.lapsa.insurance.validation.ValidVehicleYearOfIssue;

public interface DummyAnnotated {
    @ValidIdentityCardType
    @ValidInsuranceAgeClass
    @ValidInsuranceClassType
    @ValidInsuranceExpirienceClass
    @ValidInsuranceRequestType
    @ValidPaymentMethod
    @ValidPolicyVehicleAgeClass
    @ValidPolicyVehicleClass
    @ValidVehicleRegistrationNumber
    @ValidVehicleYearOfIssue
    void dummy();
}
