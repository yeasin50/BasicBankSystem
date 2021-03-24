import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Coin extends StatelessWidget {
  /// Most countries do their printing on KBA format printing machines,.
  /// ` for which the optimal note size is 73mm height and 133mm`
  /// `width 125mm, height: 65 mm`
  /// using US currency bills are ` 2.61 inches wide and 6.14 inches long`
  /// lets use coin, it's more suitable
  /// gold color =255, 215, 0,
  /// bright blue 123, 238, 255

  final coinRadius;

  const Coin({Key? key, this.coinRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
            Colors.transparent,
            Color.fromRGBO(255, 215, 50, 1),
            Color.fromRGBO(255, 215, 50, .8)
          ], stops: [
            .73,
            .78,
            1.0
          ]),
          shape: BoxShape.circle,
          // color: Color.fromRGBO(10, 253, 253, 1),
          // color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(255, 215, 50, .7),
              blurRadius: coinRadius * .15,
              spreadRadius: coinRadius * .05,
            )
          ],
          border: Border.all(
            color: Color.fromRGBO(255, 215, 0, 1),
          )),
      width: coinRadius,
      height: coinRadius,
      // color: Colors.blue,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Icon(
              Icons.ac_unit_outlined,
              size: coinRadius * .7,
              // color: Color.fromRGBO(248, 40, 136, 1),
              color: Color.fromRGBO(255, 215, 50, 1),
            ),
          ),
          CircularText(
            // backgroundPaint: Paint()
            //   ..strokeWidth = 23
            //   ..strokeCap,
            position: CircularTextPosition.inside,
            radius: 125,
            children: [
              TextItem(
                text: Text("Fake Currency".toUpperCase(),
                    style: GoogleFonts.coiny(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: const Color.fromRGBO(62, 0, 253, 1),
                        // fontWeight: FontWeight.bold,
                      ),
                    )),
                space: 8,
                startAngle: -90,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.clockwise,
              ),
              TextItem(
                text: Text(
                  "Build for UI Design".toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromRGBO(227, 3, 3, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                space: 7,
                startAngle: 90,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.anticlockwise,
              ),
              TextItem(
                text: Text(
                  "x",
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                space: 10,
                startAngle: 180,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.clockwise,
              ),
              TextItem(
                text: Text(
                  "x",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                space: 10,
                startAngle: 0,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.clockwise,
              ),
            ],
          )
        ],
      ),
    );
  }
}
