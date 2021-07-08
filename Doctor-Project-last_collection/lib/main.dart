import 'package:doctor_project/Controller/patient_controller.dart';
import 'package:doctor_project/Screens/ProfilePages/UserProfile/view.dart';
import 'package:doctor_project/Screens/Welcome%20Screens/welcome_screen_1.dart';
import 'package:doctor_project/Screens/Welcome%20Screens/welcome_screen_3.dart';
import 'package:doctor_project/Screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:doctor_project/appointment_calender.dart';
import 'package:doctor_project/Screens/doctor_browser/doctor_browser.dart';
import 'package:doctor_project/Screens/register/registerView.dart';
import 'package:doctor_project/Screens/specialties_screen/SpecialistSearch.dart';
import 'package:doctor_project/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Favorite Doctors Screen/favorite_doctors_screen.dart';
import 'Screens/Appointments Screen/appointment_screen.dart';
import 'Screens/Login Screen/login_screen.dart';
import 'Screens/Welcome Screens/splash.dart';
import 'cal.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var token = prefs.getString('token');
  // print("TOKEN ************** : " + token!);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {});
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {});
    }
  }

  // Future<bool> f() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString('token');
  //   print("TOKEN ************** : " + token!);
  //
  //   if (token != "" || token != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();

    // var u = FirebaseAuth.instance.currentUser!;
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Data/Counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    CounterApp()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(
            colors: [
              HexColor("#BEEF24"),
              HexColor("#43D15E"),
              //add more colors for gradient
            ],
            begin: Alignment.topRight, //begin of the gradient color
            end: Alignment.bottomLeft, //end of the gradient color
            stops: [0, 0.5] //stops for individual color
          //set the stops number equal to numbers of color
        ),

      ),
      child: Image.asset("assets/images/logo.png",
      width: 95 ,
      height: 105,),
    );
  }
}
 */
