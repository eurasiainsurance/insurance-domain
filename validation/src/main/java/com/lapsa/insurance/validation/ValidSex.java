package com.lapsa.insurance.validation;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.*;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.lapsa.insurance.elements.Sex;

@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RUNTIME)
@Constraint(validatedBy = ValidSexConstraintValidator.class)
public @interface ValidSex {

    Sex[] invalidValues() default {};

    String message() default "{com.lapsa.insurance.validation.ValidSex.message}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}