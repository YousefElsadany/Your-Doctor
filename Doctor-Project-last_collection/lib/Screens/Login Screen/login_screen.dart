import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/Screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:doctor_project/Screens/register/forgotPassword.dart';
import 'package:doctor_project/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen_widgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = true;

  state() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // var u = FirebaseAuth.instance.currentUser;
    //   if (u != null) { //if there isn't any user currentUser function returns a null so we should check this case.
    //     Navigator.pushAndRemoveUntil(
    //       // we are making YourHomePage widget the root if there is a user.
    //         context,
    //         MaterialPageRoute(builder: (context) => BottomNavBar()),
    //             (Route<dynamic> route) => false);
    //   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Visibility(
            visible: !loading,
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                end: 16,
              ),
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SKIP",
                      style: TextStyle(
                        color: customBlueColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Visibility(
            visible: !loading,
            child: Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsetsDirectional.only(
                  top: MediaQuery.of(context).size.width * 0.02,
                  start: MediaQuery.of(context).size.width * 0.05,
                  end: MediaQuery.of(context).size.width * 0.05,
                  bottom: MediaQuery.of(context).size.width * 0.01,
                ),
                padding: EdgeInsets.only(
                    top: 0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        //physics: NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/logos2.png",
                                width: 100,
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.06),
                              RichText(
                                text: TextSpan(
                                  text: 'YOUR DOCTOR',
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: HexColor("#1F4D83"),
                                      fontWeight: FontWeight.bold),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: '.com',
                                        style: TextStyle(
                                            fontSize: 16,
                                            //fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                              Text("The future of healthcare",
                                  style: TextStyle(
                                    fontSize: 16,
                                    //fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your Email Address";
                              }
                              return null;
                            },
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: TextStyle(color: Colors.grey),
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              prefixIcon: Icon(
                                Icons.email,
                                color: customGreenColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: HexColor("#1F4D83"),
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: HexColor("#43D15E"),
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: HexColor("#43D15E"),
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: HexColor("#43D15E"),
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your Password";
                              }
                              return null;
                            },
                            controller: _passwordController,
                            obscureText: _showPassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.grey),
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
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: HexColor("#1F4D83"),
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: HexColor("#43D15E"),
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: HexColor("#1F4D83"),
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: HexColor("#43D15E"),
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  Get.to(ForgotPassword());
                                },
                                child: Text(
                                  "Forgot password?",
                                  textAlign: TextAlign.end,
                                ),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          btnLogin(
                            emailController: _emailController,
                            passwordController: _passwordController,
                            formKey: _formKey,
                            context: context,
                            s: state,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          signUp(context),
                        ],
                      ),
                    ),
                  ],
                ),
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
