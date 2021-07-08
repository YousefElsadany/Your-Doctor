import 'package:doctor_project/Screens/Appointments%20Screen/AppointmentCofirmation.dart';
import 'package:doctor_project/Screens/specialties_screen/SpecialistSearch.dart';
import 'package:doctor_project/common_widgets/MyWidgets.dart';
import 'package:doctor_project/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsStart extends StatelessWidget {
  const TermsAndConditionsStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customWhiteColor,
      appBar: myCustomAppBar(""),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 16,
              start: 16,
              end: 16,
              bottom: 50,
            ),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/minilogo@2x.png'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: 'YOUR-DOCTOR.',
                              style: new TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF1F4D83),
                                  fontWeight: FontWeight.w600),
                              children: [
                                TextSpan(
                                  text: 'COM',
                                  style: new TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF191919),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myCustomText(
                            'The future of healthcare', customBlackColor, 16),
                      ],
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            myCustomText(
                                'Terms & Conditions', customBlackColor, 26),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        termsAndConditionsContent(
                            "Lorem Ipsum is simply dummy text of the "
                                "printing and typesetting industry. "
                                "Lorem Ipsum has been the industry's "
                                "standard dummy text ever since the 1500s,"
                                " when an unknown printer took a galley of "
                                "type and scrambled it to make a type specimen book.",
                            context),
                        SizedBox(
                          height: 10,
                        ),
                        termsAndConditionsContent(
                            " It has survived not only five centuries, but also "
                                "the leap into electronic typesetting, remaining "
                                "essentially unchanged. It was popularised in the "
                                "1960s with the release of Letraset sheets containing"
                                " Lorem Ipsum passages, and more recently with desktop "
                                "publishing software like Aldus PageMaker including "
                                "versions of Lorem Ipsum. ",
                            context),
                        SizedBox(
                          height: 10,
                        ),
                        termsAndConditionsContent(
                            " Lorem Ipsum is simply dummy "
                                "text of the printing and typesetting industry. "
                                "Lorem Ipsum has been the industry's standard dummy "
                                "text ever since the 1500s, when an unknown printer "
                                "took a galley of type and scrambled it to make a "
                                "type specimen book.",
                            context),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 3,
            child: myCustomButton(
              "Confirm",
              context,
              SpecialistSearch(),
            ),
          ),
        ],
      ),
    );
  }
}
