import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItem extends StatelessWidget {
  final String text;
  final Widget logo;
  final double size;

  const CardItem({
    required this.text,
    required this.logo,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    //build logo and label for each item
    return Container(
      // color: Colors.transparent,
      // color: Colors.yellow,
      width: size,
      height: size,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size * .8,
              width: size,
              padding: EdgeInsets.only(
                bottom: size * .1,
              ),
              decoration: new BoxDecoration(
                  color: Colors.white.withOpacity(.7),
                  border: new Border.all(
                    color: Colors.blueAccent,
                    width: 5.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(size * .3, size * .3),
                    topRight: Radius.elliptical(size * .3, size * .3),
                    bottomLeft: const Radius.circular(15),
                    bottomRight: const Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(.7),
                      // offset: const Offset(5.0, 5.0),
                      blurRadius: 10,
                      spreadRadius: 7,
                    )
                  ]),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: FittedBox(
                  child: Text(
                    text,
                    textAlign: TextAlign.end,
                    style: GoogleFonts.lateef(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize:
                            Theme.of(context).textTheme.headline5!.fontSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size * .02,
            left: 0,
            right: 0,
            child: Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(.7),
                      // offset: const Offset(5.0, 5.0),
                      blurRadius: 10,
                      spreadRadius: 7,
                    )
                  ],
                ),
                child: logo),
          ),
        ],
      ),
    );
  }
}
