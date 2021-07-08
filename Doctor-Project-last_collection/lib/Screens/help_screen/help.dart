import 'package:doctor_project/Screens/About%20Us%20Screen/about_us_screen.dart';
import 'package:doctor_project/Screens/About%20Us%20Screen/terms_and_conditions_screen.dart';
import 'package:doctor_project/Screens/Contact%20Us%20Screen/contact_us_screen.dart';
import 'package:doctor_project/Screens/component/component.dart';
import 'package:doctor_project/Screens/help_screen/helpWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void goToContactUs(){
      Get.to(ContactUs());
    };
    void goToAboutUs(){
      Get.to(AboutUs());
    };
    void goToTermsAndConditions(){
      Get.to(TermsAndConditions());
    };

    return Scaffold(
      appBar: customAppBar(title: "Help"),
      body: Container(
        margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 25),
        child: Column(
          children: [
            itemRow("assets/images/contact.png", "Contact Us", goToContactUs),
            itemRow("assets/images/about.png", "About Us", goToAboutUs),
            itemRow("assets/images/terms.png", "Terms and Conditions", goToTermsAndConditions),
          ],
        ),
      ),
    );
  }
}
