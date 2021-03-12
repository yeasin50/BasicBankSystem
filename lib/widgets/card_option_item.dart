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
    return Container(
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

              ///TODO:: modify this
              decoration: new BoxDecoration(
                  color: Colors.white.withOpacity(.7),
                  border: new Border.all(
                    color: Colors.green,
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
                      color: Colors.green.withOpacity(.54),
                      offset: const Offset(5.0, 5.0),
                    )
                  ]),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: FittedBox(
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
          ),
          Positioned(
            top: size * .02,
            left: 0,
            right: 0,
            child: logo,
          ),
        ],
      ),
    );
  }
}
