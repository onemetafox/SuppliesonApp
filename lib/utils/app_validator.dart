class AppValidator {

 static  bool isEmptyValidate(String value) {
    return value.trim().isEmpty ;
    /*if (value.trim().isEmpty) {
      return true;
    } else {
      return false;
    }*/
  }

 static bool isValidEmail(String email){
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

 static bool isStringMatches(String valueOne, String valueTwo){
    return valueOne==valueTwo;
  }
}