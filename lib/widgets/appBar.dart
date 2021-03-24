import 'package:bank_app_social/configs/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(.5),
        // gradient: new LinearGradient(
        //     colors: [
        //       Colors.red.withOpacity(.5),
        //       Colors.cyan.withOpacity(.7),
        //     ],
        //     begin: Alignment.centerRight,
        //     end: Alignment.centerLeft,
        //     // end: new Alignment(0.8, 0.0),
        //     tileMode: TileMode.clamp),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.blue.withOpacity(.3),
            spreadRadius: 4,
          ),
        ],
      ),
      height: getProportionateScreenHeight(70),
      width: double.infinity,
      // color: Colors.blueAccent.withOpacity(.5),

      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(20),
      ),
      child: Row(
        children: [
          ///temp
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.yellow,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Text(this.title,
              style: GoogleFonts.laila(
                textStyle: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
