/* import 'package:first_app/Screen/component/component.dart';
import 'package:flutter/material.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        margin: EdgeInsetsDirectional.only(start: 16, end: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customHeader("New Password", "Enter new password"),
            textField("New Password", "******",
                icon: Icons.remove_red_eye_outlined, isSecure: true),
            customButton("Save"),
          ],
        ),
      ),
    );
  }
} */
