import 'package:cypher_advanced_programing/Services/CypherKeyValidator.dart';
import 'package:cypher_advanced_programing/Services/DecodeService.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
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
            GestureDetector(
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
        )
      ],
    ));
  }

  void decodeString() {
    if (keyTextFeildController.text != '') {
      if (KeyValidator().textFieldValidate(keyTextFeildController.text)) {
        if (stringTextFeildController.text != '') {
          print(DecodeService().decode(
              keyTextFeildController.text, stringTextFeildController.text));
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
          print(DecodeService().encode(
              keyTextFeildController.text, stringTextFeildController.text));
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
}
