import 'package:doctor_project/Screens/Login%20Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

Widget btnValidation(String btn) => InkWell(
      onTap: () {
        Get.offAll(Login());
        Get.snackbar(
          "Successful ",
          "Now , you can login",
          backgroundColor: Colors.white,
          colorText: Colors.black,
          boxShadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        );
      },
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: HexColor("#43D15E"),
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Text(
          btn,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget reSend(String reSend) => InkWell(
      /* onTap: () {
        Get.offAll(Login());
        Get.snackbar(
          "Successful ",
          "Now , you can Login",
          backgroundColor: Colors.white,
          colorText: Colors.black,
          boxShadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        );
      }, */
      child: Container(
        margin: EdgeInsets.only(right: 65, left: 65),
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: HexColor("#707070")),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Text(
          reSend,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
