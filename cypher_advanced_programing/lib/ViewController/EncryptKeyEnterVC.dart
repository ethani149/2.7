import 'package:cypher_advanced_programing/Model/EncodeDecodeEnum.dart';
import 'package:cypher_advanced_programing/SharedUI/KeyTextField.dart';
import 'package:cypher_advanced_programing/SharedUI/MainButton.dart';
import 'package:cypher_advanced_programing/ViewController/EncryptTextEnterVC.dart';
import 'package:cypher_advanced_programing/ViewController/ErrorAlertDialog.dart';
import 'package:flutter/material.dart';

class EncryptKeyEnterVC extends StatefulWidget {
  final CypherType encodeType;

  const EncryptKeyEnterVC({Key key, this.encodeType}) : super(key: key);
  @override
  _EncryptKeyEnterVC createState() => _EncryptKeyEnterVC();
}

class _EncryptKeyEnterVC extends State<EncryptKeyEnterVC> {
  TextEditingController keyText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: KeyTextFeild(
                    keyTextFeildController: keyText,
                    onSubmit: () {
                      checkKey(widget.encodeType, keyText.text);
                    },
                    hintText: "Enter Encryption Key",
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainButton(
                buttonText: "Continue",
                pressFunction: () {
                  checkKey(widget.encodeType, keyText.text);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  bool keyValidate(String text) {
    final validChar = RegExp('[0-9]');
    return validChar.hasMatch(text);
  }

  void checkKey(CypherType encodeType, String cypherKey) {
    if (keyValidate(cypherKey)) {
      pushToTextVC(encodeType, cypherKey);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ErrorAlertDialog(
            okAction: () {
              Navigator.pop(context);
            },
            alertBodyText:
                "It appers your key is invalid please check it and try again",
            alertTitle: "Error",
          );
        },
      );
    }
  }

  void pushToTextVC(CypherType encodeType, String cypherKey) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EncryptTextEnterVC(
                encodeType: encodeType,
                cypherKey: cypherKey,
              )),
    );
  }
}
