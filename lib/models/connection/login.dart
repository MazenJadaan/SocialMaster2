class LoginParams {
  late String emailORmobile;
  late String password;

  LoginParams({required this.emailORmobile, required this.password});

  LoginParams.fromJson(Map<String, dynamic> json) {
    emailORmobile = json['emailORmobile'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailORmobile'] = this.emailORmobile;
    data['password'] = this.password;
    return data;
  }
}

class LoginResponse {
  Data? data;
  String? message;
  int? status;

  LoginResponse({required this.data,required this.message,required this.status});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  User? user;
  late String token;

  Data({required this.user, required this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? emailVerifiedAt;
  String? phoneNum;
  String? gender;
  String? birthdate;
  String? providerName;
  String? providerId;
  String? googleAccessTokenJson;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.emailVerifiedAt,
      this.phoneNum,
      this.gender,
      this.birthdate,
      this.providerName,
      this.providerId,
      this.googleAccessTokenJson,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phoneNum = json['phone_num'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    providerName = json['provider_name'];
    providerId = json['provider_id'];
    googleAccessTokenJson = json['google_access_token_json'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone_num'] = this.phoneNum;
    data['gender'] = this.gender;
    data['birthdate'] = this.birthdate;
    data['provider_name'] = this.providerName;
    data['provider_id'] = this.providerId;
    data['google_access_token_json'] = this.googleAccessTokenJson;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
