import 'package:cypher_advanced_programing/Model/EncodeDecodeEnum.dart';
import 'package:cypher_advanced_programing/SharedUI/MainButton.dart';
import 'package:cypher_advanced_programing/ViewController/EncryptKeyEnterVC.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatefulWidget {
  @override
  _HomeScreenView createState() => _HomeScreenView();
}

class _HomeScreenView extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainButton(
              pressFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EncryptKeyEnterVC(
                            encodeType: CypherType.encode,
                          ),
                      settings: RouteSettings(name: "First")),
                );
              },
              buttonText: "Encode",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), //spacer
              child: MainButton(
                pressFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EncryptKeyEnterVC(
                              encodeType: CypherType.decode,
                            ),
                        settings: RouteSettings(name: "First")),
                  );
                },
                buttonText: "Decode",
              ),
            )
          ],
        )
      ],
    );
  }
}
