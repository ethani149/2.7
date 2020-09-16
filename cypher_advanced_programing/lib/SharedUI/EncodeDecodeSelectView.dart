import 'package:flutter/material.dart';
import 'package:cypher_advanced_programing/ViewController/encodeDecodeSelectVC.dart';

class KeyTextFeild extends StatelessWidget {
  //a Widget of the Cypher Key Text Feild
  final TextEditingController keyTextFeildController;
  final String hintText;
  const KeyTextFeild({Key key, this.keyTextFeildController, this.hintText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: keyTextFeildController,
      textAlign: TextAlign.center,
      decoration: new InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hintText),
    );
  }
}
