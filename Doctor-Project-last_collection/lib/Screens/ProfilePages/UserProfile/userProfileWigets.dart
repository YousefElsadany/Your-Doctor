import 'package:doctor_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget myCustomUser(String myImage, String text, double textSize, Function() function) =>
    InkWell(
      onTap: function,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: customOffWhiteColor,
        ),
        child: Row(
          children: [
            myCustomImage(myImage),
            SizedBox(
              width: 20,
            ),
            myCustomText(text, customGreyColor, textSize),
            // Spacer(),
            Image.asset("assets/images/goicon.png")
          ],
        ),
      ),
    );

Widget myCustomImage(String myImage) =>
    Image.asset(
      myImage,
      width: 48,
      height: 48,
    );

Widget myCustomText(String text, Color textColor, double textSize) =>
    Expanded(
      child: Text(
        text,
        //textAlign: TextAlign.center,
        style: new TextStyle(
          fontSize: textSize,
          //color: HexColor("#707070"),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
