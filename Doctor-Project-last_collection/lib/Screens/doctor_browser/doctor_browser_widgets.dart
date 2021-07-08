import 'dart:math';

import 'package:doctor_project/Controller/favourite_controller.dart';
import 'package:doctor_project/Controller/patient_controller.dart';
import 'package:doctor_project/Screens/Appointments%20Screen/AppointmentCofirmation.dart';
import 'package:doctor_project/Screens/Appointments%20Screen/appointment_screen.dart';
import 'package:doctor_project/Screens/Favorite%20Doctors%20Screen/favorite_doctors_screen.dart';
import 'package:doctor_project/Screens/ProfilePages/DocProfile/view.dart';
import 'package:doctor_project/Screens/component/component.dart';
import 'package:doctor_project/appointment_calender.dart';
import 'package:doctor_project/models/AppointmentModel.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:doctor_project/models/favourite_model.dart';
import 'package:doctor_project/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import 'package:favorite_button/favorite_button.dart';

bool flag = false;

PreferredSizeWidget doctorBrowserAppBar(String title) => AppBar(
      iconTheme: IconThemeData(
        color: customGreenColor,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          color: customBlueColor,
        ),
      ),
    );

Widget searchTextField(
        TextEditingController myController, Function myFunction) =>
    TextFormField(
      controller: myController,
      cursorColor: Colors.green.shade400,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.all(14),
        labelText: "Search by name",
        labelStyle: TextStyle(color: Colors.green.shade800),
        fillColor: Colors.green.shade100.withOpacity(0.3),
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
            color: Colors.green.shade200,
          ),
        ),
      ),
    );

Widget createDoctorCard(
        DoctorCardModel doctorCardModel, BuildContext context, bool isFavourite,
        { Function()? function}) =>
    Container(
      padding: EdgeInsetsDirectional.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.to(DocProfile(
                doctorCardModel: doctorCardModel,
              ));
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(doctorCardModel.imageName),
                  radius: 30,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            doctorCardModel.doctorName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          // khalid 3/7
                          FavoriteButton(
                            isFavorite: isFavourite,
                            iconSize: 45,
                            valueChanged: (_isFavorite) async {
                              FavouriteController favourite =
                                  FavouriteController();
                              if (_isFavorite) {
                               await favourite.setFavouriteDoctor(
                                    doctorCardModel.id, _isFavorite);
                                print(doctorCardModel.id);
                                print("added to favourite");
                              } else {
                               await favourite
                                    .removeFavouriteDoctor(doctorCardModel.id);
                                function;
                                print("removed from favourite");
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        doctorCardModel.job,
                        style: TextStyle(
                          color: Color(0xff717171),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0x63ecf0f5),
            ),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star_border, color: Colors.amber, size: 20),
                Spacer(),
                Text(
                  "12 Reviews",
                  style: TextStyle(
                    color: Color(0xff707070),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Text(
                "Fees:",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "${doctorCardModel.fees}",
                    style: TextStyle(
                      color: customGreenColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 3),
                  Text(
                    "EGP",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 25),
              Expanded(
                child: bookBtn(context, doctorCardModel),
              ),
            ],
          ),
        ],
      ),
    );

Widget bookBtn(BuildContext context, DoctorCardModel doctor,
        {Function()? state}) =>
    InkWell(
      onTap: () {
        Get.to(AppointmentCalender(
          doctor: doctor,
        ));
      },
      child: Container(
        padding: EdgeInsetsDirectional.all(12),
        decoration: BoxDecoration(
          color: customBlueColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Book",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
