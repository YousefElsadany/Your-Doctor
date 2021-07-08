import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/Screens/ProfilePages/UserProfile/view.dart';
import 'package:doctor_project/Screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:doctor_project/Screens/component/component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int _group = 1.hashCode;
  DateTime? selected;

  s() {
    setState(() {});
  }

  _showDateTimePicker() async {
    selected = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2050),
    ))!;
    setState(() {});
  }

  updateProfile({
    String? phone,
    String? name,
    String? email,
    DateTime? date,
  }) {
    var currentUser =
    FirebaseFirestore.instance.collection("patients").doc(uId);

    if (phone != "") {
      currentUser.update({"phone": phone});
      setState(() {});
    }

    if (name != "") {
      currentUser.update({"name": name}).then((value) {
        patientModel!.fullName = name!;
      });
      setState(() {});
    }

    // if (email != null) {
    //   currentUser.update({"email": email}).then((value) {
    //     profileEmail = email;
    //   });
    //   setState(() {});
    // }

    if (date != null) {
      String s = DateFormat("dd-MM-yyyy").format(date);
      currentUser.update({"birth_date": s}).then((value) {
        patientModel!.birthDate = date.toString();
      });
      setState(() {});
    }
  }


  String? d;


  @override
  Widget build(BuildContext context) {
    var a = FirebaseFirestore.instance.collection("patients").doc(uId).get();
    a.then((value) {
      d = value.data()?["birth_date"];
      setState(() {});
    });


    return Scaffold(
      appBar: customAppBar(title: "Edit Profile"),
      body: Container(
        margin: EdgeInsetsDirectional.only(start: 16, end: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 20,
                  ),
                  // first container ( head line )
                  textField(
                    phoneController,
                    "Phone Number",
                    "${patientModel!.phone}",
                    Icons.phone,
                    isRequired: false,
                    type: TextInputType.phone,
                    s: s,
                  ),
                  textField(
                    nameController,
                    "Full Name",
                    "${patientModel!.fullName}",
                    Icons.person,
                    isRequired: false,
                    s: s,
                  ),
                  textField(
                    emailController,
                    "Email",
                    "${patientModel!.email}",
                    Icons.email,
                    type: TextInputType.emailAddress,
                    isRequired: false,
                    s: s,
                  ),
                  textField(
                    dateController,
                    "Birthdate",
                    selected == null
                        ? "$d"
                        : DateFormat('dd-MM-yyy').format(selected!),
                    Icons.date_range,
                    isOnlyReadable: true,
                    show: _showDateTimePicker,
                    isRequired: false,
                    s: s,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text("Gender :"),
                        SizedBox(
                          width: 40,
                        ),
                        Radio(
                            value: 1,
                            groupValue: _group,
                            activeColor: Color(0xFF43D15E),
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                _group = value.hashCode;
                              });
                            }),
                        Text("Male"),
                        Radio(
                            value: 2,
                            groupValue: _group,
                            activeColor: Color(0xFF43D15E),
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                _group = value.hashCode;
                              });
                            }),
                        Text("Female")
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 110,
                  // ),
                ],
              ),
            ),
            (emailController.text.isEmpty &&
                phoneController.text.isEmpty &&
                nameController.text.isEmpty &&
                selected == null)
                ? disabledUpdateButton("Update", updateProfile: () {
              if (_formKey.currentState!.validate()) {
                updateProfile(
                  phone: phoneController.text,
                  name: nameController.text,
                  date: selected,
                );
                Get.offAll(BottomNavBar());
                selected = null;
              }
            })
                : updateButton("Update", updateProfile: () {
              updateProfile(
                phone: phoneController.text,
                name: nameController.text,
                date: selected,
              );
              setState(() {});
              showTopSnackBar(
                context,
                CustomSnackBar.success(message: "Update Done"),
              );
              Get.offAll(BottomNavBar());
              selected = null;
            }),
          ],
        ),
      ),
    );
  }
}
