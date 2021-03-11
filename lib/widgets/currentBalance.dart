import 'package:bank_app_social/configs/size.dart';
import 'package:flutter/material.dart';

class CurrentBalanceBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heigth = SizeConfig.screenHeight! * .1;
    return Container(
      margin: EdgeInsets.all(heigth * .009),
      color: Colors.pink,
      width: double.infinity,
      height: heigth,
      decoration: BoxDecoration(
        boxShadow: [],
      ),
      child: Text(
        "5000",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.headline4!.fontSize),
      ),
    );
  }
}
