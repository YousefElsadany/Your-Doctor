import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/Controller/appointment_controller.dart';
import 'package:doctor_project/Controller/doctor_controller.dart';
import 'package:doctor_project/Controller/favourite_controller.dart';
import 'package:doctor_project/Screens/doctor_browser/doctor_browser.dart';
import 'package:doctor_project/models/AppointmentModel.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

// List<DoctorCardModel> retrieveDoctorInfo(String dept) {
//   List<DoctorCardModel> doctorCards = [];
//   FirebaseFirestore.instance
//       .collection("doctors")
//       .where("dept", isEqualTo: "$dept")
//       .get()
//       .then((value) {
//     value.docs.forEach((element) {
//       var n = element.data()["name"];
//       print("Name: " + n);
//       doctorCards.add(DoctorCardModel("assets/images/about.png", n, 200));
//       print("Doctor : " + doctorCards.toString());
//     });
//   });
//   return doctorCards;
// }

FavouriteController favouriteController = FavouriteController();

Widget specialities(String imagePath, String myText) => InkWell(
      onTap: () async {
        loading = true;
        department = myText;
        patientModel!.favouritesDoctors =
            await favouriteController.getFavouritDoctor();
        Get.to(DoctorBrowser());

      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: HexColor("#FAFAFA"),
          border: Border(
            bottom: BorderSide(
                width: 1.0, color: customGreyColor, style: BorderStyle.solid),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 30,
              height: 20,
              color: customGreenColor,
            ),
            SizedBox(
              width: 20.93,
            ),
            Expanded(
                child: Text(myText,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#1F4D83")))),
          ],
        ),
      ),
      // onTap: onPressed,
    );

Widget searchTextField(
        TextEditingController myController, Function myFunction) =>
    TextFormField(
      controller: myController,
      cursorColor: Colors.green.shade700,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.all(14),
        labelText: "Search by name",
        labelStyle: TextStyle(color: Colors.green.shade800),
        fillColor: Colors.green.shade100.withOpacity(0.4),
        filled: true,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.green.shade700,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            myFunction();
            myController.clear();
          },
          icon: Icon(
            Icons.highlight_remove_outlined,
            color: Colors.green.shade700,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.green.shade100.withOpacity(0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.green.shade100,
          ),
        ),
      ),
    );

Widget termsAndConditionsContent(String textContent, BuildContext context) =>
    Container(
      width: MediaQuery.of(context).size.width * .5,
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: Text(
        textContent,
        // textAlign: TextAlign.center,
        style: new TextStyle(
          fontSize: 14,
          color: HexColor("#000000"),
          fontWeight: FontWeight.w400,
        ),
      ),
    );

Widget myCustomButton(
        String buttonText, BuildContext myContext, Widget screen) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Get.to(screen);
          },
          child: Container(
            width: MediaQuery.of(myContext).size.width * .9,
            height: 48,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: HexColor("#43D15E"),
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Text(buttonText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );

AppBar myCustomAppBar(
  String title,
) =>
    AppBar(
      title: Text(
        title,
        style: new TextStyle(
          fontSize: 20,
          color: customBlackColor,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: new Container(
        child: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: HexColor("#43D15E"),
          ),
        ),
      ),
    );

// khalid 3/7
// 1- remove path
//

Widget createAppointmentCard(
        AppointmentModel appointment, BuildContext context) =>
    Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(appointment.doctorCardModel.imageName),
                radius: 35,
              ),
              SizedBox(width: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        appointment.doctorCardModel.doctorName,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        appointment.doctorCardModel.job,
                        style: TextStyle(
                          color: Color(0xff717171),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              myCustomContainer(Icons.place, customGreenColor, 20,
                  appointment.doctorCardModel.location, 13),
              myCustomContainerWithButton(Icons.calendar_today_rounded,
                  customGreenColor, 20,
                  "${DateFormat.Hm().format(appointment.appointmentDate) +" PM , "
                   + DateFormat.yMMMMEEEEd().format(appointment.appointmentDate)}"
                  , 13),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: HexColor("#FAFAFA"),
                  border: Border(
                    top: BorderSide(
                        width: .5,
                        color: customGreyColor,
                        style: BorderStyle.solid),
                    bottom: BorderSide(
                        width: .5,
                        color: customGreyColor,
                        style: BorderStyle.solid),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: customGreenColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myCustomText("Patient Name:", customGreyColor, 13),
                        SizedBox(
                          height: 8,
                        ),
                        myCustomText("Patient Phone:", customGreyColor, 13),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myCustomText(appointment.patientModel!.fullName,
                              customBlueColor, 13),
                          SizedBox(
                            height: 8,
                          ),
                          myCustomText(appointment.patientModel!.phone,
                              customBlueColor, 13),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              myCustomFeesLabel(
                  appointment.doctorCardModel.fees),
            ],
          ),
        ),
      ],
    );

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
          Expanded(child: myCustomOneLineText(text, customGreyColor, textSize)),
        ],
      ),
    );

Widget myCustomContainerWithButton(IconData myIcon, Color iconColor,
        double iconSize, String text, double textSize) =>
    Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: HexColor("#FAFAFA"),
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
          Expanded(child: myCustomOneLineText(text, customGreyColor, textSize)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );

Widget myCustomIcon(IconData myIcon, Color myColor, double mySize) => Icon(
      myIcon,
      color: myColor,
      size: mySize,
    );

// khalid 3/7
Widget myCustomBookButton(
        BuildContext context, String text, Color myCustomColor,
        {Widget? screen, required Function() onPressed}) =>
    InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        padding: EdgeInsetsDirectional.all(12),
        decoration: BoxDecoration(
          color: myCustomColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );

Widget myCustomChangeButton(String text, Color textColor, double height) =>
    InkWell(
      child: Container(
        width: 70,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: customLightGreyColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myCustomText(text, textColor, 14),
          ],
        ),
      ),
    );

Widget myCustomText(String text, Color textColor, double textSize) => Text(
      text,
      textAlign: TextAlign.center,
      style: new TextStyle(
        fontSize: textSize,
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
    );

Widget myCustomOneLineText(String text, Color textColor, double textSize) =>
    Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: new TextStyle(
        fontSize: textSize,
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
    );

Widget myCustomFeesLabel(int fees) => Container(
      width: 190,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
      ),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          myCustomText("Fees", customBlackColor, 18),
          SizedBox(width: 5),
          myCustomText("$fees", customGreenColor, 20),
          SizedBox(width: 3),
          myCustomText("EGP", customBlackColor, 16),
        ],
      ),
    );
