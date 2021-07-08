import 'package:doctor_project/Screens/Login%20Screen/login_screen.dart';
import 'package:doctor_project/Screens/Welcome%20Screens/welcome_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../doctor_browser/doctor_browser.dart';
import '../../common_widgets/common_widgets.dart';
import '../../constants.dart';

class WelcomeScreen3 extends StatelessWidget {
  const WelcomeScreen3({Key? key}) : super(key: key);

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
                SizedBox(height: 15,),
                Image(
                  image: AssetImage("assets/images/welcome_3.png"),
                  width: MediaQuery.of(context).size.width,
                  height: welcomeScreenImageHeight(context),
                ),
                SizedBox(height: 50),
                Text(
                  "Contact Doctor",
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
                      radius: 4,
                      backgroundColor: Colors.green[100],
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.green[100],
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: Color(0xff43D15E),
                    ),
                  ],
                ),
              ],
            ),
            customNavigationButton(context, "Start", Login()),
          ],
        ),
      ),
    );
  }
}
