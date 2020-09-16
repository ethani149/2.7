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
        autocorrect: false,
        controller: keyTextFeildController,
        style: TextStyle(
          fontFamily: 'InterV_',
          color: Color(0xffffffff),
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          letterSpacing: 0,
        ),
        //maxLines: 4,
        //textAlignVertical: TextAlignVertical.bottom,
        onSubmitted: (value) {},
        obscureText: false,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'InterV_',
              color: Color(0xffffffff),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            )));
  }
}
