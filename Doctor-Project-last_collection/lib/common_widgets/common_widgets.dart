import 'package:doctor_project/Screens/Welcome%20Screens/welcome_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

myGetTo(Widget screen) {
  Transition myTransition = Transition.rightToLeftWithFade;
  Duration transitionDuration = Duration(milliseconds: 500);
  Get.to(screen,transition: myTransition, duration: transitionDuration);
}

myGetOffAll(Widget screen) {
  Transition myTransition = Transition.zoom;
  Duration transitionDuration = Duration(milliseconds: 1000);
  Get.offAll(screen,transition: myTransition, duration: transitionDuration);
}