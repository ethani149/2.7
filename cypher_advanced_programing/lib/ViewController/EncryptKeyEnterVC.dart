import 'package:cypher_advanced_programing/SharedUI/KeyTextField.dart';
import 'package:cypher_advanced_programing/SharedUI/MainButton.dart';
import 'package:flutter/material.dart';

class EncryptKeyEnterVC extends StatefulWidget {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => null()),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
