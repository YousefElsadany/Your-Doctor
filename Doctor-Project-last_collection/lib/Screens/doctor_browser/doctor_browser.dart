import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/Controller/doctor_controller.dart';
import 'package:doctor_project/Controller/favourite_controller.dart';
import 'package:doctor_project/Screens/Favorite%20Doctors%20Screen/favorite_doctors_screen.dart';
import 'package:doctor_project/constants.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:doctor_project/models/favourite_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'doctor_browser_widgets.dart';

class DoctorBrowser extends StatefulWidget {
  const DoctorBrowser({Key? key}) : super(key: key);

  @override
  _DoctorBrowserState createState() => _DoctorBrowserState();
}

class _DoctorBrowserState extends State<DoctorBrowser> {
  DoctorController doctorController = DoctorController();

  List<DoctorCardModel> doctorCards = [];
  FavouriteController favouriteController = FavouriteController();

  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();

    _myFunction() {
      setState(() {
        print("Set state pressed");
      });
    }

    return Scaffold(
      appBar: doctorBrowserAppBar(department),
      body: Stack(
        children: [
          Visibility(
            visible: !loading,
            child: (doctorCards.length == 0)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No Results",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: pagePadding,
                      start: pagePadding,
                      end: pagePadding,
                      bottom: 8,
                    ),
                    child: Column(
                      children: [
                        searchTextField(_searchController, _myFunction),
                        SizedBox(height: 15),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              for (FavouriteModel favouriteDoctor
                                  in patientModel!.favouritesDoctors) {
                                if (favouriteDoctor.doctor_id ==
                                    doctorCards[index].id) {
                                  isFavourite = true;
                                  break;
                                } else {
                                  isFavourite = false;
                                }
                              }
                              return createDoctorCard(
                                  doctorCards[index], context, isFavourite);
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10),
                            itemCount: doctorCards.length,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          Visibility(
            visible: loading,
            child: Center(
              child: SpinKitCircle(
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    doctorController.retrieveDoctorInfo(department).then((value) => {
          doctorCards = value,
          loading = false,
          print("Inside Then  *************"),
          setState(() {}),
        });
  }
}

/*
SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 9,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 15),
                    Text("Search by name"),
                  ],
                ),
              ),
              SizedBox(height: 15),
              doctorCard("doctor1.png", "Doc Mohamed Wagdy", 200),
              SizedBox(height: 10),
              doctorCard("doctor2.png", "Doc Eman Safwat", 200),
              SizedBox(height: 10),
              doctorCard("doctor3.png", "Doc Eman Safwat", 200),
              SizedBox(height: 10),
              doctorCard("doctor4.png", "Doc Eman Safwat", 200),
              SizedBox(height: 10),
            ],
          ),
        ),
 */
