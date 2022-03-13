// import 'package:email_validator/email_validator.dart';

import 'package:flutter/foundation.dart';

validateField(String value) {
  if (value == null || value.isEmpty)
    return 'Field is Required.';
  // else if (value.length > 5)
  //   return 'Field required at most 5 character';
  // else if (value.length > 60)
  //   return 'Field required at most 60 character';
  else
    return null;
}

validateName(String value) {
  String pattern = r'^[a-z A-Z]+$';
  RegExp regex = RegExp(pattern);
  if (value.isEmpty)
    return 'Name is Required.';
  else if (!regex.hasMatch(value))
    return 'Name accept only characters';
  else if (value.length < 3)
    return 'Name required at least 3 character';
  else if (value.length > 45)
    return 'Name required at most 45 character';
  else
    return null;
}

validateAddress(String value) {
  if (value.isEmpty)
    return 'Address is Required.';
  else if (value.length < 3)
    return 'Name required at least 3 character';
  else if (value.length > 60)
    return 'Name required at most 60 character';
  else
    return null;
}

validateDescription(String value) {
  if (value.isEmpty)
    return 'Description is Required.';
  else if (value.length < 3)
    return 'Name required at least 3 character';
  else if (value.length > 150)
    return 'Name required at most 150 character';
  else
    return null;
}

validateEmail(String value) {
  bool validEmail = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  if (value.isEmpty)
    return 'Email is Required.';
  else if (validEmail)
    return null;
  else
    return 'Invalid email address';
}

validateEmailNull(String value) {
  // String email = value.replaceAll(new RegExp(r"\s+"), "");
  bool validEmail = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  if (value.isEmpty)
    return null;
  else if (validEmail)
    return null;
  else
    return 'Invalid email address';
}

validateMobile(String value) {
  if (value.isEmpty)
    return 'Mobile Number is Required.';
  else if (value.length < 10)
    return 'Mobile Number required at least 10 numbers';
  else if (value.length > 11)
    return 'Mobile Number required 10 numbers';
  else
    return null;
}

validateOTP(String value) {
  if (value.isEmpty)
    return 'OTP is Required.';
  else if (value.length < 4)
    return 'OTP required at least 4 numbers';
  else if (value.length > 4)
    return 'OTP required at most 4 numbers';
  else
    return null;
}

validatePassword(String value) {
  // Pattern pattern = r'^(?=.[0-9]+.)(?=.[a-zA-Z]+.)[0-9a-zA-Z]{6,}$';
  // RegExp regex = new RegExp(pattern);

  if (value.isEmpty)
    return 'Password is Required.';
  else if (value.length < 6)
    return 'Password required at least 6 characters';
  // else if (!regex.hasMatch(value))
  //   return 'Password must contain numbers, letter, and at least six characters';
  else
    return null;
}
