import 'package:cypher_advanced_programing/SharedUI/MainButton.dart';
import 'package:flutter/material.dart';

class ResultAlertDialog extends StatefulWidget {
  final Function okAction;
  final String alertBodyText;
  final String alertTitle;
  final Function copyButtonAction;

  const ResultAlertDialog(
      {Key key,
      this.okAction,
      this.alertBodyText,
      this.alertTitle,
      this.copyButtonAction})
      : super(key: key);
  @override
  _ResultAlertDialog createState() => _ResultAlertDialog();
}

class _ResultAlertDialog extends State<ResultAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.alertTitle),
      content: Text(widget.alertBodyText),
      actions: [
        MainButton(
          buttonText: "Ok",
          pressFunction: widget.okAction,
        ),
        MainButton(
          buttonText: "Copy to Clipboard",
          pressFunction: widget.copyButtonAction,
        )
      ],
    );
  }
}
