import 'dart:async';

import 'package:doctor_project/Screens/Login%20Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Login()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFFBEEF24), Color(0xFF43D15E)])),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset("assets/images/logosplash.png", width: MediaQuery.of(context).size.width / 3,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, bottom: 2),
                    child: RichText(
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
                  ),
                  Container(
                    child: Text("The future of healthcare",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ))
                  )
                ],
              ),
            ])));
  }
}
