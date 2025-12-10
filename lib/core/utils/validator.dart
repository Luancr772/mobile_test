bool validate(String password) {
  final regex = RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
  return regex.hasMatch(password);
}
