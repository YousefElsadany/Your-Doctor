import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Cal extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Cal> {
  DateTime? selected;

  _showDateTimePicker() async {
    selected = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2050),
    ));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var dateFormat_1 = Column(
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        selected != null
            ? Text(
                DateFormat('yyyy-MMMM-dd').format(selected!),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              )
            : SizedBox(
                width: 0.0,
                height: 0.0,
              ),
      ],
    );

    var dateFormat_2 = Column(
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        selected != null
            ? Text(
                DateFormat('yyyy-MM-dd').format(selected!),
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20.0,
                ),
              )
            : SizedBox(
                width: 0.0,
                height: 0.0,
              ),
      ],
    );

    var dateStringParsing = Column(
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        selected != null
            ? Text(
                DateFormat('yyyy-MM-dd h:m:s')
                    .format(DateTime.parse("2018-09-15 20:18:04Z")),
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                ),
              )
            : SizedBox(
                width: 0.0,
                height: 0.0,
              ),
      ],
    );

    var dateUtcLocal = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        selected != null
            ? Text(
                "UTC: " +
                    DateFormat('yyyy-MM-dd h:m:s').format(selected!.toUtc()),
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                ),
              )
            : SizedBox(
                width: 0.0,
                height: 0.0,
              ),
        SizedBox(
          height: 30.0,
        ),
        selected != null
            ? Text(
                "Local: " +
                    DateFormat('yyyy-MM-dd h:m:s').format(selected!.toLocal()),
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 20.0,
                ),
              )
            : SizedBox(
                width: 0.0,
                height: 0.0,
              ),
      ],
    );

    var compareDates = Column(
      children: <Widget>[
        Text(
          selected != null
              ? selected!.isBefore(DateTime.now())
                  ? ": True"
                  : ": False"
              : "",
          style: TextStyle(color: Colors.red, fontSize: 20.0),
        ),
      ],
    );

    var dateComapereFormat = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        selected != null
            ? Text(
                DateFormat('yyyy-MM-dd').format(selected!),
                style: TextStyle(color: Colors.green, fontSize: 17.0),
              )
            : SizedBox(
                width: 0.0,
                height: 0.0,
              ),
        SizedBox(
          width: 10.0,
        ),
        selected != null
            ? Text(
                "After",
                style: TextStyle(color: Colors.green, fontSize: 17.0),
              )
            : SizedBox(
                width: 0.0,
                height: 0.0,
              ),
        SizedBox(
          width: 10.0,
        ),
        selected != null
            ? Text(
                DateFormat('yyyy-MM-dd').format(DateTime.now()),
                style: TextStyle(color: Colors.green, fontSize: 17.0),
              )
            : SizedBox(
                width: 0.0,
                height: 0.0,
              ),
        SizedBox(
          width: 10.0,
        ),
        compareDates,
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Date and Time",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              onPressed: () => _showDateTimePicker(),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              dateFormat_1,
              dateFormat_2,
              dateStringParsing,
              dateUtcLocal,
              SizedBox(
                height: 20.0,
              ),
              dateComapereFormat
            ],
          ),
        ));
  }
}
