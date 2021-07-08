import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:doctor_project/models/favourite_model.dart';

class PatientModel {
  String id = "";
  String fullName;
  String email;
  String password = "";
  String phone;
  String profileImage;
  String birthDate = "";

  List<FavouriteModel> favouritesDoctors = [];

  PatientModel(this.fullName, this.email, this.phone, this.profileImage);
}
