import 'package:doctor_project/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

PreferredSizeWidget welcomeAppBar() => AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Image(
        image: AssetImage(
          "$imagePath" + "logo.png",
        ),
        height: 40,
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: skipPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: skipSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );

Widget welcomeScreenImage(BuildContext context, String imageName) => Image(
      image: AssetImage("$imagePath" + imageName),
      width: MediaQuery.of(context).size.width,
      height: welcomeScreenImageHeight(context),
    );

Widget customNavigationButton(
        BuildContext context, String text, Widget screen) =>
    MaterialButton(
      color: customGreenColor,
      textColor: Colors.white,
      minWidth: MediaQuery.of(context).size.width,
      height: 45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      onPressed: () {
        myGetTo(screen);
      },
      child: Text(
        text,
      ),
    );

Widget customPressedNavigationButton(
    BuildContext context, String text, Function onClicked) =>
    MaterialButton(
      color: customGreenColor,
      textColor: Colors.white,
      minWidth: MediaQuery.of(context).size.width,
      height: 45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      onPressed: onClicked(),
      child: Text(
        text,
      ),
    );