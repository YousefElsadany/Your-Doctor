import 'package:doctor_project/Screens/Appointments%20Screen/AppointmentCofirmation.dart';
import 'package:doctor_project/models/AppointmentModel.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';

AppBar customAppBar({
  String title = "",
}) =>
    AppBar(
      iconTheme: IconThemeData(
        color: customGreenColor,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          color: customBlueColor,
          fontSize: 16,
        ),
      ),
    );

Widget customHeader(String header, String title) => Container(
      margin: EdgeInsetsDirectional.only(top: 9, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(
              fontSize: 26,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(title, style: TextStyle(fontSize: 16))
        ],
      ),
    );

Widget customButton(
  String title,
) =>
    InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xFF43D15E),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Text("$title",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            )),
      ),
    );

Widget updateButton(
  String title, {
  Function? updateProfile,
}) =>
    InkWell(
      onTap: () {
        updateProfile!();
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xFF43D15E),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Text("$title",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            )),
      ),
    );

Widget disabledUpdateButton(
    String title, {
      Function? updateProfile,
    }) =>
    Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 48,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Text("$title",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          )),
    );

Widget timeButton(String title, bool isPressed,
        {int colorCode = 0xff43D15E, Function()? onTap}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 48,
        decoration: BoxDecoration(
          color: Color(colorCode),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Text("$title",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            )),
      ),
    );

Widget customCalenderButton(String title,
        {int colorCode = 0xff43D15E, Function()? onTap}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 48,
        decoration: BoxDecoration(
          color: Color(colorCode),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Text("$title",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            )),
      ),
    );

Widget textField(
    TextEditingController controller,
    String lable,
    String placeHolder,
    IconData prefixIcon, {
      TextInputType type = TextInputType.text,
      bool isRequired = true,
      IconData? icon,
      bool isSecure = false,
      bool isOnlyReadable = false,
      String? Function(String?)? validator,
      Function()? show,
      Function()? s,
    }) =>
    Container(
      margin: EdgeInsetsDirectional.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                "$lable",
                style: TextStyle(fontSize: 16),
              ),
              isRequired
                  ? Text(
                " *",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              )
                  : Text(""),
            ],
          ),
          SizedBox(height: 5),
          TextFormField(
            onChanged: (value){
              if(s != null){
                s();
              }
            },
            onTap: show,
            keyboardType: type,
            validator: validator,
            controller: controller,
            obscureText: isSecure,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            readOnly: isOnlyReadable,
            decoration: InputDecoration(
              fillColor: Colors.grey[200],
              filled: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              prefixIcon: Icon(prefixIcon, color: customGreenColor),
              suffixIcon: Icon(
                icon,
                color: Color(0xFF191919),
              ),
              hintText: "$placeHolder",
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Color(0xFF43D15E))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(24),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          )
        ],
      ),
    );
