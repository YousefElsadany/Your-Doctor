import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/models/doctor_card_model.dart';

class DoctorController {
  Future<List<DoctorCardModel>> retrieveDoctorInfo(String dept) async {
    List<DoctorCardModel> doctors = [];

    await FirebaseFirestore.instance
        .collection("doctors")
        .where("dept", isEqualTo: "$dept")
        .get()
        .then((value) {
      // print( " * ** * ** ** * " + id + " * ** * ** *** ***  ");
      value.docs.forEach((element) {
        var data = element.data();
        String id = element.id;
        print("id *** " + id);
        String doctorName = data["name"];
        String department = data["dept"];
        String phone = data["phone"];
        String job = data["job"];
        String location = data['location'];
        String waitingTime = data["waiting"];
        int fees = data["fees"];
        String imageName = data["image"];
        String about = data['about'];
        doctors.add(
          DoctorCardModel(id, doctorName, department, phone, job, location,
              waitingTime, fees, imageName, about),
        );
      });
    });

    return doctors;
  }

  Future<DoctorCardModel> getDoctor(String id) async {
    DoctorCardModel doctorCardModel;
    print("************** get Doctor Called ************* ");
    var documentSnapshot =
        await FirebaseFirestore.instance.collection("doctors").doc(id).get();
    // print("inside then of get Doctor");
    var data = documentSnapshot.data();
    String doctorName = data?["name"];
    String department = data?["dept"];
    String phone = data?["phone"];
    String job = data?["job"];
    String location = data?['location'];
    String waitingTime = data?["waiting"];
    int fees = data?["fees"];
    String imageName = data?["image"];
    String about = data?['about'];
    doctorCardModel = DoctorCardModel(id, doctorName, department, phone, job,
        location, waitingTime, fees, imageName, about);
    // print("******** Name of Favourite Doctor :  " + doctorCardModel.doctorName);
    print("************** get Doctor Ended ************* ");
    return doctorCardModel;
  }
}
