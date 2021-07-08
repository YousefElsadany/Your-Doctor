import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/models/AppointmentModel.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:intl/intl.dart';

import 'doctor_controller.dart';

class AppointmentController {
  void createAppointment(AppointmentModel appointmentModel) {
    print("************ appointment *********** ");

    Timestamp dateStamp = Timestamp.fromDate(appointmentModel.appointmentDate);
    // print(dateStamp);
    FirebaseFirestore.instance
        .collection("appointments")
        .add({
          "doctor": appointmentModel.doctorCardModel.id,
          "patient": appointmentModel.patientModel!.id,
          "date": dateStamp,
          "isActive": appointmentModel.isActive,
          "isDone": appointmentModel.isDone,
        })
        .then((value) => {
              print("success added"),
            })
        .catchError((error) {
          print("Error in added appointment" + error);
        });
  }

  void cancelAppointment(String appointmentId) {
    FirebaseFirestore.instance
        .collection("appointments")
        .doc(appointmentId)
        .update({"isActive": false, "isDone": false})
        .then((value) => {
              print("success Cancelled"),
            })
        .catchError((error) {
          print("Error in Cancel appointment" + error);
        });
  }

  Future<List<AppointmentModel>> getAppointment(String patientId) async {
    print("************ get appointment *********** ");
    List<AppointmentModel> appointments = [];
    AppointmentModel? appointmentModel;
    DoctorCardModel doctor;
    String appointmentId;
    String doctorId;
    bool isActive;
    bool isDone;
    Timestamp dateStamp;
    DateTime date;

    await FirebaseFirestore.instance
        .collection("appointments")
        .where("patient", isEqualTo: "$patientId")
        .get()
        .then((value) async => {
              for (QueryDocumentSnapshot element in value.docs)
                {
                  appointmentId = element.id,
                  doctorId = element.get("doctor"),
                  patientId = element.get("patient"),
                  dateStamp = element.get("date"),
                  isActive = element.get("isActive"),
                  isDone = element.get("isDone"),
                  date = dateStamp.toDate(),
                  doctor = await DoctorController().getDoctor(doctorId),
                  appointmentModel = AppointmentModel(doctor, date),
                  appointmentModel!.isActive = isActive,
                  appointmentModel!.isDone = isDone,
                  appointmentModel!.id = appointmentId,
                  appointments.add(appointmentModel!),
                  print("Doctor name " +
                      appointmentModel!.doctorCardModel.doctorName),
                  print("Doctor location " +
                      appointmentModel!.doctorCardModel.location),
                },
            });

    print("*************** appointment Ended *********** ");

    return appointments;
  }

  Future<List<DateTime>> getReservedAppointmentDates(
      String docId, DateTime day) async {
    print("reserved dates");
    Timestamp dateStamp;
    DateTime date;
    List<DateTime> reservedDates = [];

    await FirebaseFirestore.instance
        .collection("appointments")
        .where("isActive", isEqualTo: true)
        .where("doctor", isEqualTo: docId)
        .get()
        .then((value) async => {
              for (QueryDocumentSnapshot element in value.docs)
                {
                  dateStamp = element.get("date"),
                  date = dateStamp.toDate(),
                  if (DateFormat.yMMMd().format(date) ==
                      DateFormat.yMMMd().format(day))
                    {reservedDates.add(date), print("Done")}
                },
            });

    print("*************** appointment Ended *********** ");

    return reservedDates;
  }
}
