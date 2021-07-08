import 'package:doctor_project/Screens/component/component.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        margin: EdgeInsetsDirectional.only(start: 16, end: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customHeader("Forgot Password", "Enter your Phone number"),
            textField(_controller, "Phone Number", "+20 1061949501", Icons.phone),
            customButton("Confirm"),
          ],
        ),
      ),
    );
  }
}
