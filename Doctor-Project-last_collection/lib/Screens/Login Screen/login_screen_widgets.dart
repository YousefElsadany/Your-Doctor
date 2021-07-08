import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/Controller/favourite_controller.dart';
import 'package:doctor_project/Controller/patient_controller.dart';
import 'package:doctor_project/Screens/ProfilePages/UserProfile/view.dart';
import 'package:doctor_project/Screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:doctor_project/Screens/register/registerView.dart';
import 'package:doctor_project/Screens/specialties_screen/SpecialistSearch.dart';
import 'package:doctor_project/constants.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:doctor_project/models/favourite_model.dart';
import 'package:doctor_project/models/patient_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

CollectionReference patients =
    FirebaseFirestore.instance.collection("patients");
FavouriteController favouriteController = FavouriteController();

Widget btnLogin({
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required GlobalKey<FormState> formKey,
  required BuildContext context,
  Function()? s,
}) =>
    InkWell(
      onTap: () async {
        if (formKey.currentState!.validate()) {
          // loading = true;
          s!();
          PatientController _patientController = PatientController();
          await _patientController.SignIn(
            email: emailController.text,
            password: passwordController.text,
            s: s,
          );
          // khalid 3/7
          // create object of patient model
          patientModel =  await _patientController.retrievePatient(uId!);

          Get.offAll(BottomNavBar());
          loading = false;

          // showTopSnackBar(
          //   context,
          //   CustomSnackBar.success(message: "Welcome ${patientModel!.fullName}"),
          // );

          Get.snackbar(
            "Welcome",
            "${patientModel!.fullName}",
            backgroundColor: Colors.green.shade100.withOpacity(0.4),
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
        }
      },
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: HexColor("#43D15E"),
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget signUp(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Get.to(RegisterForm());
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                text: 'Don\'t have account? ',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: HexColor("#1F4D83"))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
