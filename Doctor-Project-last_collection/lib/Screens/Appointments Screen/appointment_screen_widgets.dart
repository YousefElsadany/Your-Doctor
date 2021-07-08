import 'package:doctor_project/Controller/appointment_controller.dart';
import 'package:doctor_project/models/AppointmentModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';



PreferredSizeWidget appointmentsAppBar(TabController _tabController) => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Text(
        "Appointments",
        style: TextStyle(
          color: customBlueColor,
        ),
      ),
      bottom: TabBar(
        controller: _tabController,
        indicatorColor: customGreenColor,
        unselectedLabelColor: Color(0xffACACAC),
        labelColor: customGreenColor,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 2,
            color: customGreenColor,
          ),
          insets: EdgeInsetsDirectional.only(
            start: 10,
            end: 10,
            bottom: 8,
          ),
        ),
        labelPadding: EdgeInsets.only(left: 20, right: 20),
        isScrollable: true,
        tabs: <Widget>[
          Tab(
            child: Text("Active"),
          ),
          Tab(
            child: Text("Past"),
          ),
        ],
      ),
    );

Widget createActiveAppointmentCard(
        BuildContext context, AppointmentModel appointmentModel, {Function()? s}) =>
    Column(
      children: [
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: customBlueColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.all(pagePadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              appointmentModel.doctorCardModel.imageName),
                          radius: 30,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appointmentModel.doctorCardModel.doctorName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              appointmentModel.doctorCardModel.job,
                              style: TextStyle(
                                color: Color(0xff717171),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 1,
                      color: customGreenColor.withOpacity(0.3),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: customGreenColor),
                        SizedBox(width: 10),
                        Expanded(
                            child: Text(
                          appointmentModel.doctorCardModel.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 1,
                      color: customGreenColor.withOpacity(0.3),
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range, color: customGreenColor),
                        SizedBox(width: 10),
                        Expanded(
                            child: Text(
                                "${DateFormat.Hm().format(appointmentModel.appointmentDate) + " PM , " + DateFormat.yMMMMEEEEd().format(appointmentModel.appointmentDate)}")),
                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: appointmentCallBtn(
                          context, appointmentModel.doctorCardModel.phone),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: appointmentCancelBtn(context, appointmentModel.id),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );

Widget createPastAppointmentCard(AppointmentModel appointmentModel) => Column(
      children: [
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: customBlueColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.all(pagePadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              appointmentModel.doctorCardModel.imageName),
                          radius: 30,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appointmentModel.doctorCardModel.doctorName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              appointmentModel.doctorCardModel.job,
                              style: TextStyle(
                                color: Color(0xff717171),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      height: 1,
                      color: customGreenColor.withOpacity(0.3),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.date_range, color: customGreenColor),
                        SizedBox(width: 10),
                        Text(
                            "${DateFormat.Hm().format(appointmentModel.appointmentDate) + " PM , " + DateFormat.yMMMMEEEEd().format(appointmentModel.appointmentDate)}"),
                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appointmentModel.isDone
                        ? Text(
                            "Done",
                            style: TextStyle(
                              fontSize: 16,
                              color: customGreenColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            "Canceled",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );

Widget appointmentCallBtn(BuildContext context, String doctorPhone) =>
    MaterialButton(
      color: customGreenColor,
      textColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      onPressed: () => launch("tel:${doctorPhone}"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.phone_in_talk),
          SizedBox(width: 8),
          Text(
            "Call Doctor",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

Widget appointmentCancelBtn(BuildContext context, String appointmentId, {Function()? s}) =>
    MaterialButton(
      color: Colors.red,
      textColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      onPressed: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Cancel Appointment"),
            content:
                const Text('Are you sure you want to cancel the appointment?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                  print("No pressed");
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                  print("yes pressed");
                  AppointmentController().cancelAppointment(appointmentId);
                  // s!();
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cancel_outlined),
          SizedBox(width: 8),
          Text(
            "Cancel",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
