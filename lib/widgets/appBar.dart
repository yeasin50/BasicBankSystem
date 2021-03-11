import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/configs/theme.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      height: getProportionateScreenHeight(100),
      width: double.infinity,
      color: Colors.blueAccent,
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(20),
      ),
      child: Text(
        this.title,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headline4!.fontSize,
          color: themeData(context).cardTheme.color
        ),
      ),
    );
  }
}
