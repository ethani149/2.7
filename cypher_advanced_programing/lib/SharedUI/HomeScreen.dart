import 'package:cypher_advanced_programing/ViewController/encodeDecodeSelectVC.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            width: 300,
            child: Text(
                "This is a encryption and decryprion program you use this program you will need a encryption key"),
          ),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EncodeDecodeSelectVC())); // Pushing New VC into Navigation Stack
          },
          child: Text("Start"),
        )
      ],
    );
  }
}
