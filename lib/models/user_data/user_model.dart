class UserDataModel {
  String userId;
  String userName;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String userType;
  String language;
  bool isLoggedIn;
  String authToken;



  UserDataModel(
      {this.userId,
      this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.userType,
      this.language,
      this.isLoggedIn,
      this.authToken});



  Map<String, dynamic> toMap(UserDataModel user) => {
        'id': user.userId,
        'firstName': user.firstName,
        'userName': user.userName,
        'lastName': user.lastName,
        'type': user.userType,
        'email': user.email,
        'phone': user.phoneNumber,
        'language': user.language,
        'isLoggedIn': user.isLoggedIn,
        'authToken': user.authToken,
      };

  factory UserDataModel.fromJson(Map<String, dynamic> jsonData) {
    return UserDataModel(

      userId: jsonData['id'],
      firstName: jsonData['firstName'],
      userName: jsonData['userName'],
      lastName: jsonData['lastName'],
      userType: jsonData['type'],
      email: jsonData['email'],
      phoneNumber: jsonData['phone'],
      language: jsonData['language'],
      isLoggedIn: jsonData['isLoggedIn'],
      authToken: jsonData['authToken'],

    );
  }

  String get getUserName => userName;

  set setUserName(String value) {
    userName = value;
  }

  String get getFirstName => firstName;

  set setFirstName(String value) {
    firstName = value;
  }

  String get getLastName => lastName;

  set setLastName(String value) {
    lastName = value;
  }

  String get getEmail => email;

  set setEmail(String value) {
    email = value;
  }

  String get getPhoneNumber => phoneNumber;

  set setPhoneNumber(String value) {
    phoneNumber = value;
  }

  String get getUserType => userType;

  set setUserType(String value) {
    userType = value;
  }

  String get getLanguage => language;

  set setLanguage(String value) {
    language = value;
  }

  bool get getIsLoggedIn => isLoggedIn;

  set setIsLoggedIn(bool value) {
    isLoggedIn = value;
  }

  String get getAuthToken => authToken;

  set setAuthToken(String value) {
    authToken = value;
  }
}
