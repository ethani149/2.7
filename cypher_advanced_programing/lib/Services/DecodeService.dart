import 'dart:core';

class DecodeService {
  String decode(String key, String text) {
    int _key = int.parse(key); //Decode String of key to int
    String outText = ""; // create output text
    int uTFoffset;
    for (int i = 0; i < text.length; i++) {
      //lop through each char in string
      int _decimalUTF = text.codeUnitAt(i); //encode string to UTF16
      if (_decimalUTF < 91 && _decimalUTF > 40) {
        // is Capital
        uTFoffset = 65;
      } else if (_decimalUTF < 123 && _decimalUTF > 96) {
        // is Lowercase
        uTFoffset = 97;
      } else if (_decimalUTF == 32) {
        //Is space
        outText += " "; //add space to outText
        continue;
      } else {}

      int countOfcharCycles = (uTFoffset + _key - uTFoffset) %
          26; //get count of cycles through char set
      String tempChar = String.fromCharCode(countOfcharCycles + _key);
      print(tempChar);
      outText += tempChar; //create output char and add to output
    }
    return outText;
  }
}
