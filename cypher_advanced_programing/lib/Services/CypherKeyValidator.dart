class KeyValidator {
  bool textFieldValidate(String text) {
    final validChar = RegExp('[0-9]');
    return validChar.hasMatch(text);
  }
}
