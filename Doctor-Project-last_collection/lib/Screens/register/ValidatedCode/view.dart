import 'package:doctor_project/Screens/component/component.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../registerView.dart';
import 'ValidationCodeWidgets.dart';

class Validation extends StatefulWidget {
  const Validation({Key? key}) : super(key: key);

  @override
  _ValidationState createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  final _formKey = GlobalKey<FormState>();
  String code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Form(
        key: _formKey,
        child: Container(
            //margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.05,
                left: 16,
                right: 24),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Validation Code",
                      style: TextStyle(fontSize: 26),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text:
                            'An activation code has been sent to your number\n',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: '01099313888',
                              style: TextStyle(
                                  fontSize: 16, color: HexColor("#43D15E"))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 44,
                    ),
                    Container(
                      //color: Colors.blue,
                      margin: EdgeInsets.only(left: 9),
                      child: Text("Enter Validation Code",
                          style: TextStyle(fontSize: 14)),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      //color: Colors.red,
                      margin: EdgeInsets.only(top: 18, left: 57),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildCodeNumberBox(""),
                            buildCodeNumberBox(""),
                            buildCodeNumberBox(""),
                            buildCodeNumberBox(""),
                          ]),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    btnValidation("Enter"),
                    SizedBox(
                      height: 73,
                    ),
                    Center(
                      child: Text(
                        "Didn’t receive an activation code?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    reSend("Resend")
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 26,
        height: 86,
        child: Container(
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            //color: Color(0xfff6f5fa),
            image:
                DecorationImage(image: AssetImage('assets/images/empty.png')),
            //borderRadius: BorderRadius.all(Radius.circular(15)),
            /* boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75),
                )
              ] */
          ),
          child: Text(
            codeNumber,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F1F1F),
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
