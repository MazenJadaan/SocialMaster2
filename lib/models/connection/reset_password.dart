class ResetParams {
  late String email;


  ResetParams({required this.email});

  ResetParams.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}

class ResetResponse {
  late Null data;
  late String message;
  late int status;

  ResetResponse({this.data, required this.message, required this.status});

  ResetResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    status = json['status'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}





class CodeParams{
  late String code;
  CodeParams({required this.code});

  CodeParams.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    return data;
  }

}

class CodeResponse {
  late String message;

  CodeResponse({required this.message});

  CodeResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}




class SetNewParams{
  late String email;
  late String password;
  late String passwordConfirmation;
  SetNewParams({required this.email,required this.password,required this.passwordConfirmation});

  SetNewParams.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password =json['password'];
    passwordConfirmation= json['password confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password']=this.password;
    data['password confirmation']=this.passwordConfirmation;
    return data;
  }

}

class SetNewResponse {
  late String message;

  SetNewResponse({required this.message});

  SetNewResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
