import 'dart:core';
import 'package:email_validator/email_validator.dart';

String? emailValidator(String value)
{
  final bool isValid = EmailValidator.validate(value);
  if (! isValid)
  {
    return 'Email format is invalid';
  } else {
    return null;
  }

}

String? passwordValidator(String value) {
  if (value.length < 5)
  {
    return 'Password must be longer than 5  ';
  } else {
    return null;
  }
}


String? nameValidator(String value)
{
  if (value.length < 1 )
  {
    return 'name must be longer than 1 ';
  }

  else if (value == "1" )  // dart 예외 숫자 처리
  {
    return 'name counldnt be number';
  }
  else
  {
    return null;
  }

}

String? usernameValidator(String value)
{
  if (value.length < 1 )
  {
    return 'name must be longer than 1 ';
  }
  else
  {
    return null;
  }
}

String? phoneValidator(String value) {
  if (value.length < 10) {
    return 'Please enter mobile number';
  }
  return null;
}
