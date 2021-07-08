import 'package:doctor_project/Controller/appointment_controller.dart';
import 'package:doctor_project/Screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:doctor_project/common_widgets/MyWidgets.dart';
import 'package:doctor_project/constants.dart';
import 'package:doctor_project/models/AppointmentModel.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appointment_screen.dart';

class AppointmentConfirmation extends StatefulWidget {
  final AppointmentModel appointment;

  const AppointmentConfirmation({Key? key, required this.appointment})
      : super(key: key);

  @override
  _AppointmentConfirmationState createState() =>
      _AppointmentConfirmationState();
}

class _AppointmentConfirmationState extends State<AppointmentConfirmation> {
  // DoctorCardModel DoctorData = DoctorCardModel("", "doctorName", "departement",
  //     "job", "location", "waitingTime", 200, "minilogo@2x.png", "about");

  Color _color = customBlueColor;

  bool _offstage = true;
  String title = "Confirm";

  @override
  Widget build(BuildContext context) {
    AppointmentModel appointment = widget.appointment;
    // DoctorCardModel doctor = appointment.doctorCardModel;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: customGreenColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Appointment Confirmation",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Offstage(
          offstage: _offstage,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/booked.png",
                height: MediaQuery.of(context).size.height / 8,
              ),
              Text(
                "Successful Booking",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 18,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Offstage(
        //   offstage: _offstage,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         "Successful Booking",
        //         style: TextStyle(
        //           color: Colors.green,
        //           fontWeight: FontWeight.bold
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: createAppointmentCard(appointment, context),
        ),
        Spacer(),
        myCustomBookButton(context, title, _color, onPressed: () {
          setState(() {
            if (title == "Done") {
              AppointmentController controller = AppointmentController();
              controller.createAppointment(appointment);
              Get.offAll(BottomNavBar());
            } else {
              _offstage = !_offstage;
              title = "Done";
              _color = customGreenColor;
            }

            print(_offstage);
          });
        })
      ]),
    );
  }
}