import 'dart:core';

class DecodeService {
  String decode(String key, String text) {
    int _key = int.parse(key); //Decode String of key to int
    String outText = ''; // create output text
    for (int i = 0; i < text.length; i++) {
      //lop through each char in string
      int _decimalUTF = text.codeUnitAt(i); //encode string to UTF16
      if (_decimalUTF < 91 && _decimalUTF > 40) {
      } else if (_decimalUTF < 123 && _decimalUTF > 96) {
      } else {}
    }
  }
}
