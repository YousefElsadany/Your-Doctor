import 'package:doctor_project/constants.dart';
import 'package:flutter/material.dart';
import 'contact_us_widgets.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: contactUsAppBar("Contact Us"),
      body: Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            bottom: 3,
            start: pagePadding,
            end: pagePadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "$imagePath" + "contact_us.png",
                  width: MediaQuery.of(context).size.width,
                  height: welcomeScreenImageHeight(context),
                ),
                SizedBox(height: 40),
                Text(
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Contact on mail",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "info@yourdoctor.com",
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                ),
                SizedBox(height: 50),
                Text("Send Message"),
                SizedBox(height: 5),
                TextFormField(
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 25,
                    ),
                    hintText: "Enter Message Here",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                customSendMsgBtn(context, "Send Message"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
