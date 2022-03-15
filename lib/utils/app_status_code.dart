class AppStatusCode {
  static String returnErrorAsPerStatusCode(int statusCode) {
    switch (statusCode) {
      case 31:
        return "Email or MobilePhone is duplicate";
      case 3:
        return " Commercial Register already exist";
      case 8:
        return "User didn't get invitation from supplier";
      default :
        return "Something went wrong";
    }
  }
}
