import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  //This Class is for the main Rasied Buttons Elements
  @override
  final Function pressFunction; // function to run on press
  final String buttonText; // text to be shown on button
  const MainButton({Key key, this.pressFunction, this.buttonText})
      : super(key: key); // class super values
  Widget build(BuildContext context) {
    return RaisedButton(
      disabledColor: Colors.grey,
      color: Colors.blueGrey,
      splashColor: Colors.grey,
      textColor: Colors.white,
      onPressed: pressFunction,
      child: Text(buttonText),
    );
  }
}
