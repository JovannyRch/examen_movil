String validatorEmail(String value) {
  if (value.isEmpty) {
    return "Invalid empty email";
  }
  if (value.length > 15) {
    return "Invalid email length (Max: 15)";
  }
  if (!validateEmail(value)) {
    return "Invalid email, please type a valid email";
  }
  return null;
}

String validatorPassword(String value) {
  if (value.isEmpty) {
    return "Invalid empty password";
  }
  if (value.length > 15) {
    return "Invalid password length (Max: 15)";
  }
  return null;
}

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}
