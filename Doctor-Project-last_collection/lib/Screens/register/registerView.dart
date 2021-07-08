import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/Controller/patient_controller.dart';
import 'package:doctor_project/Screens/Login%20Screen/login_screen.dart';
import 'package:doctor_project/Screens/ProfilePages/UserProfile/view.dart';
import 'package:doctor_project/Screens/Welcome%20Screens/TermsAndConditions.dart';
import 'package:doctor_project/Screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:doctor_project/Screens/component/component.dart';
import 'package:doctor_project/Screens/edit_profile_screen/edit.dart';
import 'package:doctor_project/Screens/specialties_screen/SpecialistSearch.dart';
import 'package:doctor_project/models/patient_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int _group = 1.hashCode;
  bool _showPassword = true;
  String _gender = "";
  DateTime? selected;

  _showDateTimePicker() async {
    selected = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2050),
    ))!;
    setState(() {});
  }

  String getGender() {
    if (_group == 1) {
      _gender = "Male";
    } else {
      _gender = "Female";
    }
    return _gender;
  }

  s() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    void userCreate(uid) {
      FirebaseFirestore.instance.collection("patients").doc(uid).set({
        "name": nameController.text,
        "email": emailController.text,
        "phone": phoneController.text,
        "gender": getGender(),
        "UID": uid,
        "image": "$imagePath" + "profileimg.png",
      }).then((value) {
        uId = FirebaseAuth.instance.currentUser!.uid;

        patientModel = PatientModel(nameController.text, emailController.text,
            phoneController.text, "$imagePath" + "profileimg.png");

        Get.offAll(BottomNavBar());

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

        print("Data stored successful!");
        print("UID: " + uid);
        loading = false;
      }).catchError((error) {
        print("Errorrr!! " + error.toString());
        loading = false;
        s();
      });
      s();
    }

    void userRegister() {
      String err = "";
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
            loading = true;
        userCreate(value.user!.uid);
        // loading = false;
      }).catchError((error) {
        switch (error.code) {
          case "email-already-in-use":
            loading = false;
            err = "Email Already Exists";
            break;
          case "invalid-email":
            loading = false;
            err = "Invalid Email Address";
            break;
          case "weak-password":
            loading = false;
            err = "Password should be at least 6 characters";
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
        s();

        print("Error!! " + error.toString());
      });
    }

    return Scaffold(
      appBar: !loading ? customAppBar() : null,
      body: Stack(
        children: [
          Visibility(
            visible: !loading,
            child: Container(
              margin: EdgeInsetsDirectional.only(start: 16, end: 16),
              child: Column(
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          customHeader("Registration Form",
                              "Please enter the required information"),
                          textField(
                            phoneController,
                            "Phone Number",
                            "Enter Your Number",
                            Icons.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Phone number must not be empty");
                              }
                              return null;
                            },
                            type: TextInputType.phone,
                            s: s(),
                          ),
                          textField(
                            nameController,
                            "Full Name",
                            "Enter Your Name",
                            Icons.person,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Name must not be empty");
                              }
                              return null;
                            },
                            type: TextInputType.text,
                            s: s(),
                          ),
                          textField(
                            emailController,
                            "Email",
                            "user@example.com",
                            Icons.email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Email Address must not be empty");
                              }
                              return null;
                            },
                            type: TextInputType.emailAddress,
                            s: s(),
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(bottom: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Password",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Password must not be empty");
                                    }
                                    return null;
                                  },
                                  controller: passwordController,
                                  obscureText: _showPassword,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey[200],
                                    filled: true,
                                    hintText: 'Password',
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 10.0),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: customGreenColor,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _showPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: _showPassword
                                            ? Colors.grey
                                            : customGreenColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _showPassword = !_showPassword;
                                        });
                                      },
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade200),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade200),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade200),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: HexColor("#43D15E")),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          textField(
                            dateController,
                            "Birthdate",
                            selected == null
                                ? "DD/MM/YY"
                                : DateFormat('dd-MM-yyy').format(selected!),
                            Icons.date_range,
                            isRequired: false,
                            isOnlyReadable: true,
                            show: _showDateTimePicker,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text("Gender :"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Radio(
                                    value: 1,
                                    groupValue: _group,
                                    activeColor: Color(0xff43D15E),
                                    onChanged: (value) {
                                      setState(() {
                                        _group = value.hashCode;
                                      });
                                    }),
                                Text("Male"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Radio(
                                    value: 2,
                                    groupValue: _group,
                                    activeColor: Color(0xFF43D15E),
                                    onChanged: (value) {
                                      setState(() {
                                        _group = value.hashCode;
                                      });
                                    }),
                                Text("Female")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        // loading = true;
                        setState(() {});
                        userRegister();
                        // Get.snackbar(
                        //   "Error",
                        //   "$message",
                        //   backgroundColor: Colors.red.shade100.withOpacity(0.4),
                        //   colorText: Colors.black,
                        //   boxShadows: [
                        //     BoxShadow(
                        //       color: Colors.grey.withOpacity(0.5),
                        //       spreadRadius: 5,
                        //       blurRadius: 7,
                        //       offset:
                        //           Offset(0, 3), // changes position of shadow
                        //     ),
                        //   ],
                        // );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color(0xFF43D15E),
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Text("Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: loading,
            child: Center(
              child: SpinKitCubeGrid(
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
