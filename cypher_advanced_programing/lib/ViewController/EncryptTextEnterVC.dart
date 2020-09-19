import 'package:cypher_advanced_programing/Model/EncodeDecodeEnum.dart';
import 'package:cypher_advanced_programing/Services/DecodeService.dart';
import 'package:cypher_advanced_programing/SharedUI/KeyTextField.dart';
import 'package:cypher_advanced_programing/SharedUI/MainButton.dart';
import 'package:cypher_advanced_programing/ViewController/ResultAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EncryptTextEnterVC extends StatefulWidget {
  final CypherType encodeType;
  final String cypherKey;
  const EncryptTextEnterVC({Key key, this.encodeType, this.cypherKey})
      : super(key: key);
  @override
  _EncryptTextEnterVC createState() => _EncryptTextEnterVC();
}

class _EncryptTextEnterVC extends State<EncryptTextEnterVC> {
  TextEditingController stringText = TextEditingController();
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
                    onSubmit: () {
                      encrypt();
                    },
                    keyTextFeildController: stringText,
                    hintText: widget.encodeType == CypherType.encode
                        ? "Enter Text To Be Encrypted"
                        : "Enter Text To Be Decrypted",
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
                  encrypt();
                },
              )
            ],
          )
        ],
      ),
    );
  }

  void encrypt() {
    String codeString = '';
    if (widget.encodeType == CypherType.encode) {
      codeString = DecodeService().encode(
        widget.cypherKey,
        stringText.text,
      );
    } else {
      codeString = DecodeService().decode(
        widget.cypherKey,
        stringText.text,
      );
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ResultAlertDialog(
          okAction: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          alertBodyText: widget.encodeType == CypherType.encode
              ? "Your Encrypted String: " + codeString
              : "Your Decrypted String: " + codeString,
          alertTitle: "Result",
          copyButtonAction: () {
            Clipboard.setData(ClipboardData(text: codeString));
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        );
      },
    );
  }
}
