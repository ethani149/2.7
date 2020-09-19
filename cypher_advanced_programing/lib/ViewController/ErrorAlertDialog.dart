import 'package:cypher_advanced_programing/SharedUI/MainButton.dart';
import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatefulWidget {
  final Function okAction;
  final String alertBodyText;
  final String alertTitle;

  const ErrorAlertDialog(
      {Key key, this.okAction, this.alertBodyText, this.alertTitle})
      : super(key: key);
  @override
  _ErrorAlertDialog createState() => _ErrorAlertDialog();
}

class _ErrorAlertDialog extends State<ErrorAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.alertTitle),
      content: Text(widget.alertBodyText),
      actions: [
        MainButton(
          buttonText: "Ok",
          pressFunction: widget.okAction,
        )
      ],
    );
  }
}
