import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ImageTest extends StatefulWidget {
  @override
  _ImageTestState createState() => _ImageTestState();
}

class _ImageTestState extends State<ImageTest> {
  //12-13 (2047)

  String date =
      formatDate(DateTime(1989, 02, 1, 15, 40, 10), [yyyy, '-', mm, '-', dd]);
  // just the date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(date.toString()),
          Container(
            child: Image.asset("assets/images/emma.png"),
          ),
        ],
      ),
    );
  }
}
