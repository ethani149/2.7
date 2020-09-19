import 'dart:core';

class DecodeService {
  String decode(String key, String text) {
    int _key = int.parse(key); //Decode String of key to UTF16 int
    String outText = ""; // create output text
    int uTFoffset;
    for (int i = 0; i < text.length; i++) {
      //lop through each char in string
      int _decimalUTF = text.codeUnitAt(i); //encode string to UTF16
      int countOfcharCycles;
      uTFoffset = 32; // start char handled

      countOfcharCycles = (_decimalUTF + _key - uTFoffset) %
          95; //get count of cycles through char set
      String tempChar = String.fromCharCode(countOfcharCycles + uTFoffset);
      outText += tempChar; //create output char and add to output
    }
    return outText;
  }

  String encode(String key, String text) {
    int _key = int.parse(key); //Decode String of key to UTF16 int
    String outText = ""; // create output text
    int uTFoffset;
    for (int i = 0; i < text.length; i++) {
      //lop through each char in string
      int _decimalUTF = text.codeUnitAt(i); //encode string to UTF16
      int countOfcharCycles;
      uTFoffset = 32; // start char handled

      countOfcharCycles = (_decimalUTF - _key - uTFoffset) %
          95; //get count of cycles through char set
      String tempChar = String.fromCharCode(countOfcharCycles + uTFoffset);
      outText += tempChar; //create output char and add to output
    }
    return outText;
  }
}
