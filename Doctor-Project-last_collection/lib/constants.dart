import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/patient_model.dart';

const String imagePath = "assets/images/";
const double logoHeight = 40;
const double skipPadding = 15;
const double skipSize = 15;
const double pagePadding = 15;
const Color customGreenColor = Color(0xff43D15E);
const Color customBlueColor = Color(0xff1F4D83);
// Color customGreenColor = HexColor("#43D15E");
// Color customBlueColor = HexColor("#1F4D83");
Color customGreyColor = HexColor("#707070");
Color customBlackColor = HexColor("#191919");
Color customWhiteColor = HexColor("#FFFFFF");
Color customLightGreyColor = HexColor("#EBEBEB");
Color customRedColor = HexColor("#BA2D2D");
Color customOffWhiteColor = HexColor("#FAFAFA");
String aboutDoc =
    "About : Dentistry specialized in Pediatric Dentistry Bachelor degree of oral and dental medicine Cairo university 2013. Masters of fixed prosthodontics and implementlogy Cairo university 2019.";
String department = "";
SharedPreferences? preferences;


String? uId;

bool loading = false;
PatientModel? patientModel;


double welcomeScreenImageHeight(BuildContext context) =>
    MediaQuery.of(context).size.height / 4;