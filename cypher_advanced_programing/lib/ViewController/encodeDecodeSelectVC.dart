import 'package:cypher_advanced_programing/SharedUI/EncodeDecodeSelectView.dart';
import 'package:flutter/material.dart';

class EncodeDecodeSelectVC extends StatefulWidget {
  @override
  _StateEncodeDecodeSelectVC createState() => _StateEncodeDecodeSelectVC();
}

class _StateEncodeDecodeSelectVC extends State<EncodeDecodeSelectVC> {
  TextEditingController keyTextFeildController = TextEditingController();
  TextEditingController stringTextFeildController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text(
            "Please Enter your encryption key and then select encode or decode"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: KeyTextFeild(
                  keyTextFeildController: keyTextFeildController,
                  hintText: "Enter encryption key",
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: KeyTextFeild(
            keyTextFeildController: stringTextFeildController,
            hintText: "Enter String to be encrypted or decrypted",
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                decodeString();
              },
              child: Text("Encode"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
            ),
            RaisedButton(
              onPressed: () {
                decodeString();
              },
              child: Text("Decode"),
            ),
          ],
        )
      ],
    ));
  }

  void decodeString() {
    print(keyTextFeildController.text);
  }
}
