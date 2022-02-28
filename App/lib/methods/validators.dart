import 'dart:core';
import 'package:email_validator/email_validator.dart';

String? emailValidator(String value) {
  final bool isValid = EmailValidator.validate(value);
  if (! isValid) {
    print('Email is valid? ' + (isValid ? 'yes' : 'no'));
    return 'Email format is invalid';
  } else
  {print('Email is valid? ' + (isValid ? 'yes' : 'no'));
    return null;
  }

}

String? passwordValidator(String value) {
  if (value.length < 5) {
    return 'Password must be longer than 5 ';
  } else {
    return null;
  }
}