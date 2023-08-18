class Validate {
  static   String? emptyValidate(String? value) {
    if (value!.isEmpty) {
      return "can't be empty";
    } else {
      return null;
    }
  }
  static String? passwordValidate(String? value) {
    if(value!.isEmpty){
      return "can't be empty";
    }
    if (value.length < 8) {
      return "Password must be 8 characters or more";
    } else {
      return null;
    }
  }
  static String? nullValidate(String? value){
    return null;
  }
}