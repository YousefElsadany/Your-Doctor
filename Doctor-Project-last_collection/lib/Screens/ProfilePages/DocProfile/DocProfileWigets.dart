import 'package:doctor_project/Screens/ProfilePages/UserProfile/view.dart';
import 'package:doctor_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

Widget myCustomContainer(IconData myIcon, Color iconColor, double iconSize,
        String text, double textSize) =>
    Container(
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: customOffWhiteColor,
        border: Border(
          top: BorderSide(
              width: .5, color: customGreyColor, style: BorderStyle.solid),
        ),
      ),
      child: Row(
        children: [
          myCustomIcon(myIcon, iconColor, iconSize),
          SizedBox(
            width: 20,
          ),
          myCustomText(text, customGreyColor, textSize),
        ],
      ),
    );
Widget myCustomIcon(IconData myIcon, Color myColor, double mySize) => Icon(
      myIcon,
      color: myColor,
      size: mySize,
    );
Widget myCustomText(String text, Color textColor, double textSize) => Expanded(
      child: Text(
        text,
        //textAlign: TextAlign.center,
        style: new TextStyle(
          fontSize: textSize,
          color: HexColor("#707070"),
          fontWeight: FontWeight.w500,
        ),
      ),
    );

// Widget btnBook() => InkWell(
//       onTap: () {
//         Get.to(UserProfile(email: '', name: '', ));
//         /*Get.snackbar(
//           "Done",
//           "Welcome Home",
//           backgroundColor: Colors.white,
//           colorText: Colors.black,
//           boxShadows: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//           ],
//         ); */
//       },
//       child: Container(
//         height: 48,
//         width: 171,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             color: HexColor("#1F4D83"),
//             borderRadius: BorderRadius.all(Radius.circular(24))),
//         child: Text(
//           "Book",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
