class LoginValidate {
  String? handleLogin(String? user) {
    String? resp = "Special characters are now allowed!";

    if (user!.contains(RegExp(r'^[a-zA-Z0-9]+$'))) {
      resp = null;
    }

    return resp;
  }

  String? handlePassword(String? pw) {
    String? resp = "Password incorrect or too short!";

    if (pw!.length >= 5) {
      resp = null;
    }
    return resp;
  }
}
