import 'package:cypher_advanced_programing/SharedUI/MainButton.dart';
import 'package:cypher_advanced_programing/ViewController/encodeDecodeSelectVC.dart';
import 'package:flutter/material.dart';

// class HomeScreenView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 20),
//           child: Container(
//             width: 300,
//             child: Text(
//               "This is a encryption and decryprion program you use this program you will need a encryption key",
//               style: TextStyle(
//                 fontFamily: 'InterV_',
//                 color: Color(0xffffffff),
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 fontStyle: FontStyle.normal,
//                 letterSpacing: 0,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         EncodeDecodeSelectVC())); // Pushing New VC into Navigation Stack
//           },
//           child: Container(
//               width: 100,
//               height: 25,
//               color: Colors.blueGrey,
//               child: Center(child: Text("Start"))),
//         ),
//       ],
//     );
//   }
// }

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
              pressFunction: null,
              buttonText: "Encode",
            ),
            MainButton(
              pressFunction: null,
              buttonText: "Decode",
            )
          ],
        )
      ],
    );
  }
}
