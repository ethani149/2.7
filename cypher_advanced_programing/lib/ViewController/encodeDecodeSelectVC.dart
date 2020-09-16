import 'package:cypher_advanced_programing/Services/CypherKeyValidator.dart';
import 'package:cypher_advanced_programing/Services/DecodeService.dart';
import 'package:cypher_advanced_programing/SharedUI/EncodeDecodeSelectView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please Enter your encryption key and your text to be Encrypted/Decrypted then select encode or decode",
              style: TextStyle(
                fontFamily: 'InterV_',
                color: Color(0xffffffff),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
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
              child: Container(
                width: 400,
                child: KeyTextFeild(
                  keyTextFeildController: stringTextFeildController,
                  hintText: "Enter String to be encrypted or decrypted",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      encodeString();
                    },
                    child: Container(
                        width: 100,
                        height: 25,
                        color: Colors.blueGrey,
                        child: Center(child: Text("Encode"))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      decodeString();
                    },
                    child: Container(
                        width: 100,
                        height: 25,
                        color: Colors.blueGrey,
                        child: Center(child: Text("Decode"))),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void decodeString() {
    if (keyTextFeildController.text != '') {
      if (KeyValidator().textFieldValidate(keyTextFeildController.text)) {
        if (stringTextFeildController.text != '') {
          String codeString = DecodeService().decode(
              keyTextFeildController.text, stringTextFeildController.text);
          showResultDialog(
              context, codeString, keyTextFeildController.text, " Encrypted ");
        } else {
          showAlertDialog(context, "Please Enter a string to be decoded");
        }
      } else {
        showAlertDialog(context,
            "Please Check your encryption key it appers to be invalid");
      }
    } else {
      showAlertDialog(
          context, "Please Enter an encryption key it appers to be empty");
    }
  }

  void encodeString() {
    if (keyTextFeildController.text != '') {
      if (KeyValidator().textFieldValidate(keyTextFeildController.text)) {
        if (stringTextFeildController.text != '') {
          String codeString = DecodeService().encode(
            keyTextFeildController.text,
            stringTextFeildController.text,
          );
          showResultDialog(
              context, codeString, keyTextFeildController.text, " Decrypted ");
        } else {
          showAlertDialog(context, "Please Enter a string to be encoded");
        }
      } else {
        showAlertDialog(context,
            "Please Check your encryption key it appers to be invalid");
      }
    } else {
      showAlertDialog(
          context, "Please Enter an encryption key it appers to be empty");
    }
  }

  showAlertDialog(BuildContext context, String errorText) {
    // set up the button
    Widget okButton = GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          width: 100,
          height: 25,
          color: Colors.blueGrey,
          child: Center(child: Text("Ok"))),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(errorText),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showResultDialog(
      BuildContext context, String codeString, String cypherKey, String type) {
    // set up the button
    Widget okButton = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          width: 100,
          height: 25,
          color: Colors.blueGrey,
          child: Center(child: Text("Ok"))),
    );

    Widget copyString = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Clipboard.setData(ClipboardData(text: codeString));
      },
      child: Container(
          width: 150,
          height: 25,
          color: Colors.blueGrey,
          child: Center(child: Text("Copy" + type + "Text"))),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Encrypted String"),
      content: Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Encrypted String: " + codeString),
            Text("Encryption Key: " + cypherKey),
          ],
        ),
      ),
      actions: [okButton, copyString],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
