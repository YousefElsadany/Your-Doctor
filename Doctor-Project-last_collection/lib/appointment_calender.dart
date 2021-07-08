import 'package:doctor_project/Screens/Appointments%20Screen/AppointmentCofirmation.dart';
import 'package:doctor_project/Screens/component/component.dart';
import 'package:doctor_project/constants.dart';
import 'package:doctor_project/models/AppointmentModel.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'Controller/appointment_controller.dart';

class AppointmentCalender extends StatefulWidget {
  final DoctorCardModel doctor;

  const AppointmentCalender({Key? key, required this.doctor}) : super(key: key);

  @override
  _CState createState() => _CState();
}

class _CState extends State<AppointmentCalender> {
  DateTime? selectedDay;

  DateTime? selectedTime;
  DateTime? allDate;

  Color timeColor = customGreyColor;

  List<DateTime> dates = [];

  bool isPressed = false;
  int colorCode = 0xffACACAC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: customGreenColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsetsDirectional.only(start: 16, end: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CalendarCarousel<Event>(
                        onDayPressed:
                            (DateTime date, List<Event> events) async {
                          selectedDay = date;
                          print(selectedDay.toString() + "xxxxxxxxxxxxxx");
                          dates = await AppointmentController()
                              .getReservedAppointmentDates(
                                  widget.doctor.id, selectedDay!);
                          setState(() {});
                          print("Len -->  " + dates.length.toString());
                        },
                        weekendTextStyle: TextStyle(
                          color: Color(0xFFBA2D2D),
                        ),
                        weekFormat: false,
                        height: MediaQuery.of(context).size.height * 0.485,
                        selectedDayButtonColor: customGreenColor,
                        selectedDayBorderColor: customGreenColor,
                        selectedDateTime: selectedDay,
                        // todayButtonColor: customBlueColor,
                        todayButtonColor: Colors.transparent,
                        todayTextStyle: TextStyle(color: Colors.black),
                        todayBorderColor: customGreenColor,
                        daysHaveCircularBorder: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Select Time",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                )),
            Container(
                height: 200,
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 2.5,
                  children: [
                    customCalenderButton("03:00 PM", colorCode: colorCode,
                        onTap: () {
                      selectedTime = DateFormat("HH:mm:ss").parse("03:00:00");
                    }),
                    customCalenderButton("03:30 PM", colorCode: colorCode,
                        onTap: () {
                      selectedTime = DateFormat("HH:mm:ss").parse("03:30:00");
                    }),
                    customCalenderButton("04:00 PM", colorCode: colorCode,
                        onTap: () {
                      selectedTime = DateFormat("HH:mm:ss").parse("04:00:00");
                    }),
                    customCalenderButton("04:30 PM", colorCode: colorCode,
                        onTap: () {
                      selectedTime = DateFormat("HH:mm:ss").parse("04:30:00");
                    }),
                    customCalenderButton("05:00 PM", colorCode: colorCode,
                        onTap: () {
                      selectedTime = DateFormat("HH:mm:ss").parse("05:00:00");
                    }),
                    customCalenderButton("05:30 PM", colorCode: colorCode,
                        onTap: () {
                      selectedTime = DateFormat("HH:mm:ss").parse("05:30:00");
                    }),
                    customCalenderButton("06:00 PM", colorCode: colorCode,
                        onTap: () {
                      selectedTime = DateFormat("HH:mm:ss").parse("06:00:00");
                    }),
                    customCalenderButton("06:30 PM", colorCode: colorCode,
                        onTap: () {
                      selectedTime = DateFormat("HH:mm:ss").parse("06:30:00");
                    }),
                    customCalenderButton("07:00 PM", colorCode: colorCode,
                        onTap: () {
                      selectedTime = DateFormat("HH:mm:ss").parse("07:00:00");
                    }),
                  ],
                )),
            customCalenderButton("Confirm", onTap: () {
              if (selectedDay == null || selectedTime == null) {
                Get.snackbar(
                  "Invalid Input",
                  "Please, Select Date and Time",
                  backgroundColor: Colors.red.shade100.withOpacity(0.4),
                  colorText: Colors.black,
                  boxShadows: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                );
              } else {
                allDate = DateTime(
                    selectedDay!.year,
                    selectedDay!.month,
                    selectedDay!.day,
                    selectedTime!.hour,
                    selectedTime!.minute,
                    selectedTime!.second);
                AppointmentModel appointment =
                    AppointmentModel(widget.doctor, allDate!);
                appointment.patientModel = patientModel;
                Get.to(AppointmentConfirmation(
                  appointment: appointment,
                ));
              }
            })
          ],
        ),
      ),
    );
  }
}
