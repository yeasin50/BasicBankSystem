import 'package:bank_app_social/provider/dummy_data.dart';
import 'package:flutter/material.dart';

class DummyTest extends StatefulWidget {
  @override
  _DummyTestState createState() => _DummyTestState();
}

class _DummyTestState extends State<DummyTest>
    with TickerProviderStateMixin {
  var _decoration = BoxDecoration(
    color: Colors.white.withOpacity(.8),
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        blurRadius: 15,
        color: Colors.blue,
        spreadRadius: 10,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: _decoration,
              child: ClipOval(
                child: Image.asset(
                  // data.currentUser.imagePath,
                  dummyData[2].imagePath,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
