import 'package:bank_app_social/configs/size.dart';
import 'package:flutter/material.dart';

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
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: size * .8,
            padding: EdgeInsets.only(
              bottom: size * .1,
            ),
            ///TODO:: modify this 
            decoration: new BoxDecoration(
                color: Colors.white,
                border: new Border.all(
                    color: Colors.green, width: 5.0, style: BorderStyle.solid),
                borderRadius: new BorderRadius.only(
                  topLeft: new Radius.elliptical(40.0, 10.0),
                  bottomLeft: new Radius.circular(20.0),
                ),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.blue.withOpacity(.54),
                    offset: new Offset(5.0, 5.0),
                  )
                ]),
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Text(
                text,
                // textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
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
            child: logo,
          ),
        ),
      ],
    );
  }
}
