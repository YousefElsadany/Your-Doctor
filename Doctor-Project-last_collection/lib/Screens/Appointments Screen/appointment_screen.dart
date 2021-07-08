import 'package:doctor_project/Controller/appointment_controller.dart';
import 'package:doctor_project/constants.dart';
import 'package:doctor_project/models/AppointmentModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'appointment_screen_widgets.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen>
    with TickerProviderStateMixin {
  List<AppointmentModel> activeAppointment = [];

  late TabController _tabController;

  s() {
    setState(() {});
  }

  @override
  void initState() {
    data();
    _tabController = TabController(length: 2, vsync: this);
  }

  void data() async {
    AppointmentController().getAppointment(patientModel!.id).then((value) => {
          activeAppointment = value,
          setState(() {}),
        });
  }

  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appointmentsAppBar(_tabController),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: pagePadding),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  if (activeAppointment[index].isActive) {
                    return createActiveAppointmentCard(
                        context, activeAppointment[index]);
                  } else {
                    return Center();
                  }
                },
                itemCount: activeAppointment.length),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: pagePadding),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  if (!activeAppointment[index].isActive) {
                    return createPastAppointmentCard(activeAppointment[index]);
                  } else
                    return Container();
                },
                itemCount: activeAppointment.length),
          ),
        ],
      ),
    );
  }
}
