import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../constants.dart';

PreferredSizeWidget contactUsAppBar(String text) => AppBar(
      iconTheme: IconThemeData(
        color: customGreenColor,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );

Widget customSendMsgBtn(BuildContext context, String text) => MaterialButton(
      color: customGreenColor,
      textColor: Colors.white,
      minWidth: MediaQuery.of(context).size.width,
      height: 45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      onPressed: () {
        // final snackBar = SnackBar(
        //   content: Text("Message Sent Successfully!"),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);

        showTopSnackBar(
          context,
          CustomSnackBar.success(message: "Message Sent Successfully!"),
        );
      },
      child: Text(
        text,
      ),
    );
