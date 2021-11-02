class LoginModel {
  String sId;
  Role role;
  List<String> permissions;
  String email;
  String mobileNumber;
  String firstName;
  String lastName;
  String type;
  String language;
  String token;
  String tokenExpiresIn;

  LoginModel(
      {this.sId,
        this.role,
        this.permissions,
        this.email,
        this.mobileNumber,
        this.firstName,
        this.lastName,
        this.type,
        this.language,
        this.token,
        this.tokenExpiresIn});

  LoginModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    permissions = json['permissions'].cast<String>();
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    type = json['type'];
    language = json['language'];
    token = json['token'];
    tokenExpiresIn = json['tokenExpiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.role != null) {
      data['role'] = this.role.toJson();
    }
    data['permissions'] = this.permissions;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['type'] = this.type;
    data['language'] = this.language;
    data['token'] = this.token;
    data['tokenExpiresIn'] = this.tokenExpiresIn;
    return data;
  }
}

class Role {
  String sId;
  String arabicName;
  String englishName;
  List<Permissions> permissions;

  Role({this.sId, this.arabicName, this.englishName, this.permissions});

  Role.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    arabicName = json['arabicName'];
    englishName = json['englishName'];
    if (json['permissions'] != null) {
      permissions = new List<Permissions>();
      json['permissions'].forEach((v) {
        permissions.add(new Permissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['arabicName'] = this.arabicName;
    data['englishName'] = this.englishName;
    if (this.permissions != null) {
      data['permissions'] = this.permissions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Permissions {
  String sId;
  String key;

  Permissions({this.sId, this.key});

  Permissions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['key'] = this.key;
    return data;
  }
}