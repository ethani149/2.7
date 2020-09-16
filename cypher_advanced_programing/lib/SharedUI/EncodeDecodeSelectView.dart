import 'package:flutter/material.dart';

class EncodeDecodeSelectView extends StatelessWidget {
  final TextEditingController keyTextFeildController;
  final TextEditingController stringTextFeildController;

  const EncodeDecodeSelectView(
      {Key key, this.keyTextFeildController, this.stringTextFeildController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
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
        )
      ],
    );
  }
}

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
