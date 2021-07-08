import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/Controller/doctor_controller.dart';
import 'package:doctor_project/Controller/favourite_controller.dart';
import 'package:doctor_project/Screens/Appointments%20Screen/appointment_screen_widgets.dart';
import 'package:doctor_project/Screens/doctor_browser/doctor_browser_widgets.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:doctor_project/models/favourite_model.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'favorite_doctors_widgets.dart';

class FavoriteDoctors extends StatefulWidget {
  const FavoriteDoctors({Key? key}) : super(key: key);

  @override
  _FavoriteDoctorsState createState() => _FavoriteDoctorsState();
}

class _FavoriteDoctorsState extends State<FavoriteDoctors> {
  FavouriteController favouriteController = FavouriteController();

  List<DoctorCardModel> doctorCards = [];

  bool isFavourite = true;

  _myFunction() {
    setState(() {
      print("Set state pressed");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: favoriteDoctorAppBar(),
      body: (doctorCards.length == 0)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Favorites",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(pagePadding),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return createDoctorCard(
                            doctorCards[index], context, true, function: () {
                          setState(() {
                            print("Favourite Set State");
                          });
                        });
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: doctorCards.length,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void initState() {
    data();
  }

  void data() async {
    patientModel!.favouritesDoctors =
        await favouriteController.getFavouritDoctor();
    List<FavouriteModel> favouritDoctors = patientModel!.favouritesDoctors;

    print("Length ------> " + favouritDoctors.length.toString());
    for (FavouriteModel favouriteModel in favouritDoctors) {
      DoctorCardModel doctor =
          await DoctorController().getDoctor(favouriteModel.doctor_id);
      doctorCards.add(doctor);
    }

    setState(() {});
  }
}
