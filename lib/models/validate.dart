class Validate {
  static   String? emptyValidate(String? value) {
    if (value!.isEmpty) {
      return "can't be empty";
    } else {
      return null;
    }
  }
}