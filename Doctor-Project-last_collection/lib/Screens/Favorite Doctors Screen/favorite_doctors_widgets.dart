import 'package:doctor_project/Screens/ProfilePages/DocProfile/view.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

PreferredSizeWidget favoriteDoctorAppBar() => AppBar(
      iconTheme: IconThemeData(
        color: customGreenColor,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Favorites",
        style: TextStyle(
          fontSize: 16,
          color: customBlueColor,
        ),
      ),
    );
