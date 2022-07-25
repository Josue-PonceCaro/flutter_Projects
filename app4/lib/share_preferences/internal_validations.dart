class InternalValidations {
  static bool emailValidator(value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '');
  }

  static bool passwordValidator(value) {
    return (value != null && value.length >= 6);
  }

  static bool phoneValidator(value) {
    String pattern = r"^[0-9]{9}$";
    // String pattern = r"^(?:[+0]51)?9[0-9]{8}$";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '');
  }

  static bool nameValidator(value) {
    String pattern = r"^[\p{L} ,.'-]+$";
    RegExp regExp = RegExp(pattern, caseSensitive: false, unicode: true, dotAll: true);
    return regExp.hasMatch(value ?? '');
  }
}
