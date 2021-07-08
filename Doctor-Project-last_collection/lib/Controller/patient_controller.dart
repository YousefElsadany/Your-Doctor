import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/Screens/ProfilePages/UserProfile/view.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:doctor_project/models/patient_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class PatientController {
  Future<void> SignIn({
    required String email,
    required String password,
    Function()? s,
  }) async {
    String err = "";
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((val) async {
          loading = true;
      print("Loading : " + loading.toString());
      UserProfile userProfile = UserProfile(
        email: email,
        name: 'User',
      );
      uId = FirebaseAuth.instance.currentUser!.uid;
      s!();

      // SharedPreferences preferences = await SharedPreferences.getInstance();
      // preferences.setString("token", uId!);
      // print("MyTokenIs: ${preferences.getString("token")}");
      // PatientController _patientController = PatientController();
      // patientModel =  await _patientController.retrievePatient(uId!);

    }).catchError((error) {
      switch (error.code) {
        case "invalid-email":
          err = "Invalid Email Address";
          break;
        case "wrong-password":
          err = "Password is incorrect";
          break;
        case "too-many-requests":
          err = "Too many requests. Try Again after 60 seconds";
          break;
        case "user-not-found":
          err = "User Not Found";
          break;
      }

      Get.snackbar(
        "Error",
        "$err",
        backgroundColor: Colors.red.shade100.withOpacity(0.4),
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
      loading = false;
      s!();
      print("ERROR!!!!!! : " + error.toString());
    });
  }

  Future<PatientModel> retrievePatient(String id) async {
    PatientModel patientModel;
    var documentSnapshot =
        await FirebaseFirestore.instance.collection("patients").doc(id).get();

    var data = documentSnapshot.data();
    String fullName = data?["name"];
    String email = data?["email"];
    String phone = data?["phone"];
    String profileImage = data?["image"];
    patientModel = PatientModel(fullName, email, phone, profileImage);
    patientModel.id = id;

    print("name " + patientModel.fullName);

    return patientModel;
  }
}
