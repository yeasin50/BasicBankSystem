import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/models/client.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TransactionConfOverview extends StatelessWidget {
  final Client sender, receiver;
  final double amount;

  TransactionConfOverview({
    required this.sender,
    required this.receiver,
    required this.amount,
  });

  late double width, height;

  //move possition or just opacity handle, or fadeTransaction 🤔
  // how about moving piggiBank

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    //TODO:: handle on rotation
    SizeConfig().init(context);
    height = SizeConfig.screenHeight!;
    width = SizeConfig.screenWidth!;

    return Container(
      alignment: Alignment.center,
      height: height * .15,
      width: width,
      color: Colors.red.withAlpha(12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ///art flow
          Positioned(
            top: height * .001,
            left: 0,
            bottom: height * .001,
            child: Container(
              width: width,
              child: LinearProgressIndicator(),
            ),
          ),

          ///sender
          Positioned(
            left: width * .01,
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(180),
                    child: Image.asset(
                      sender.imagePath,
                      fit: BoxFit.fill,
                      height: width * .13,
                      // width: 140,
                    )),
                FittedBox(
                    child: Text(
                  sender.name,
                  style: TextStyle(
                    background: Paint()
                      ..color = Colors.white.withOpacity(.5)
                      ..strokeWidth = 17
                      ..style = PaintingStyle.fill,
                    fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                  ),
                )),
              ],
            ),
          ),
          //money
          Positioned(
            left: 0,
            right: 0,
            child: Column(
              children: [
               
                FittedBox(
                  child: EasyRichText(
                    "send ${amount.toString()} to",

                    patternList: [
                      EasyRichTextPattern(
                        targetString: amount.toString(),
                        style: TextStyle(
                          backgroundColor: Colors.white.withOpacity(.5),
                          fontSize:
                              Theme.of(context).textTheme.headline4!.fontSize,
                        ),
                        matchWordBoundaries: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //receiver
          Positioned(
            right: width * .01,
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(180),
                    child: Image.asset(
                      receiver.imagePath,
                      fit: BoxFit.fill,
                      height: width * .13,
                      // width: 140,
                    )),
                Text(
                  receiver.name,
                  style: TextStyle(
                    backgroundColor: Colors.white.withOpacity(.5),
                    fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
