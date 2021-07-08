import 'package:doctor_project/Screens/Welcome%20Screens/welcome_screen_widgets.dart';
import 'package:doctor_project/common_widgets/common_widgets.dart';
import 'package:doctor_project/Screens/Welcome%20Screens/welcome_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: welcomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                welcomeScreenImage(context, "welcome_1.png"),
                SizedBox(height: 50),
                Text(
                  "Hello!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "This mobile application for users to be able to explore doctors and book or get a phone call with a doctor.",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: Color(0xff43D15E),
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.green[100],
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.green[100],
                    ),
                  ],
                ),
              ],
            ),
            customNavigationButton(context, "Next", WelcomeScreen2()),
            // customPressedNavigationButton(context, "Next", myGetTo(WelcomeScreen2())),
          ],
        ),
      ),
    );
  }
}
