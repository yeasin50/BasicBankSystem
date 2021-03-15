import 'package:bank_app_social/configs/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TransactionConfOverview extends StatelessWidget {
  final String sendername, receiverName;
  final double amount;

  TransactionConfOverview({
    required this.sendername,
    required this.receiverName,
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

          Positioned(
            left: width * .01,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Icon(
                    Icons.person,
                    size: width * .13,
                  ),
                ),
                FittedBox(
                    child: Text(
                  sendername,
                )),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Column(
              children: [
                Icon(Icons.ac_unit),
                FittedBox(
                  child: Text(amount.toString()),
                ),
              ],
            ),
          ),
          Positioned(
            right: width * .01,
            child: Column(
              children: [
                Icon(Icons.ac_unit),
                Text(
                  receiverName,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
