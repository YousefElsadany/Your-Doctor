import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/Controller/favourite_controller.dart';
import 'package:doctor_project/common_widgets/MyWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class SpecialistSearch extends StatefulWidget {
  const SpecialistSearch({Key? key}) : super(key: key);

  @override
  _SpecialistSearchState createState() => _SpecialistSearchState();
}

class _SpecialistSearchState extends State<SpecialistSearch> {
  final _myController = TextEditingController();

  _myFunction() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 16,
              start: 16,
              end: 16,
            ),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: searchTextField(_myController, _myFunction)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 16)),
                    new Text(
                      'Select Specialty',
                      style: new TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        specialities('assets/icons/eyes.png', 'Eyes'),
                        specialities(
                          'assets/icons/skin.png',
                          'Dermatology',
                        ),
                        specialities(
                          'assets/icons/rotten.png',
                          'Dentistry',
                        ),
                        specialities(
                          'assets/icons/brain.png',
                          'Neurology',
                        ),
                        specialities(
                          'assets/icons/ear.png',
                          'Audiology',
                        ),
                        specialities(
                          'assets/icons/broken_bone.png',
                          'Orthopedics',
                        ),
                        specialities(
                          'assets/icons/nose.png',
                          'Nose',
                        ),
                        specialities(
                          'assets/icons/human.png',
                          'Psychiatry',
                        ),
                        specialities(
                          'assets/icons/doctorsearch.png',
                          'General',
                        ),
                        specialities(
                          'assets/icons/baby.png',
                          'Pediatrics and new born',
                        ),
                        specialities(
                          'assets/icons/women.png',
                          'Gynaecology and infertility',
                        ),
                        specialities(
                          'assets/icons/heart.png',
                          'Cardiology and vascular Disease',
                        ),
                        specialities(
                          'assets/icons/allergy.png',
                          'Allergy and Immunology',
                        ),
                        specialities(
                          'assets/icons/andolgi.png',
                          'Andiology',
                        ),
                        specialities(
                          'assets/icons/lungs.png',
                          'Cardiology and Thoracic Surgery',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
