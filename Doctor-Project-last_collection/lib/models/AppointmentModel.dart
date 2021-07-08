import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:doctor_project/models/patient_model.dart';

class AppointmentModel {
  String id = "";
  DoctorCardModel doctorCardModel;
  PatientModel? patientModel;
  DateTime appointmentDate;
  bool isDone = false;
  bool isActive = true;

  AppointmentModel(this.doctorCardModel, this.appointmentDate);
}
