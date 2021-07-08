import 'package:flutter/material.dart';

Widget itemRow(String imagePath, String title, Function() function) =>
    InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 96,
              height: 96,
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
                child: Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF191919),
                    ))),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xFF43D15E),
            )
          ],
        ),
      ),
    );
