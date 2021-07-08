import 'package:doctor_project/Screens/Favorite%20Doctors%20Screen/favorite_doctors_widgets.dart';
import 'package:doctor_project/Screens/component/component.dart';
import 'package:doctor_project/Screens/doctor_browser/doctor_browser_widgets.dart';
import 'package:doctor_project/constants.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'DocProfileWigets.dart';

class DocProfile extends StatefulWidget {
  final DoctorCardModel doctorCardModel ;

  const DocProfile({Key? key , required this.doctorCardModel}) : super(key: key);

  @override
  _DocProfileState createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
  DoctorCardModel doctor =   widget.doctorCardModel ;
    return Scaffold(
      appBar: customAppBar(),
      body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        Image.network(doctor.imageName),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Doc ',
                            style: TextStyle(
                                color: HexColor("#1F4D83"), fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                  text: doctor.doctorName,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          doctor.job,
                          style: TextStyle(
                            fontSize: 14,
                            color: HexColor("#717171"),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 3, bottom: 3, right: 10, left: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                color: HexColor("#1F4D83"),
                              )),
                          child: Text(doctor.department,
                              style: TextStyle(
                                fontSize: 14,
                                color: HexColor("#1F4D83"),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x63ecf0f5),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 15),
                      Icon(Icons.star, color: Colors.amber, size: 15),
                      Icon(Icons.star, color: Colors.amber, size: 15),
                      Icon(Icons.star, color: Colors.amber, size: 15),
                      Icon(Icons.star_border, color: Colors.amber, size: 15),
                      Spacer(),
                      Text(
                        "12 Reviews",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff707070),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                myCustomContainer(Icons.medical_services_outlined,
                    customGreenColor, 24, doctor.department, 14),
                myCustomContainer(Icons.location_on, customGreenColor, 24,
                    doctor.location, 14),
                myCustomContainer(Icons.calendar_today, customGreenColor, 24,
                    "Available daily, except (Friday, Saturday)", 14),
                myCustomContainer(Icons.watch_later_outlined, customGreenColor,
                    24, doctor.waitingTime, 14),
                myCustomContainer(
                    Icons.info_outline, customGreenColor, 24, doctor.about, 12),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Fees',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: " ${doctor.fees} ",
                                style: TextStyle(
                                    fontSize: 20, color: HexColor("#43D15E"))),
                            TextSpan(
                                text: 'EGP',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                          ],
                        ),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                        child: bookBtn(context, doctor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
