import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  @override
  final Function pressFunction;
  final String buttonText;
  const MainButton({Key key, this.pressFunction, this.buttonText})
      : super(key: key);
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: pressFunction,
      child: Text(buttonText),
    );
  }
}
