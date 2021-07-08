import 'package:doctor_project/models/favourite_model.dart';

class DoctorCardModel {
  String id;

  String doctorName;
  String phone;

  String department;
  String job;
  String location;
  String waitingTime;
  int fees;
  String imageName;
  String about;

  DoctorCardModel(
      this.id,
      this.doctorName,
      this.department,
      this.phone,
      this.job,
      this.location,
      this.waitingTime,
      this.fees,
      this.imageName,
      this.about);
}
