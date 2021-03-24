import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentBalanceBar extends StatelessWidget {
  //  double balance;
  // CurrentBalanceBar(this.balance);

  ///::: Lets color balance later , help `adobe color intel`
  @override
  Widget build(BuildContext context) {
    double heigth = SizeConfig.screenHeight! * .1;
    double width = SizeConfig.screenWidth! * .01;
    return Consumer<ClientProvider>(
      builder: (_, data, c) => Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: width, vertical: heigth * .1),
        padding: EdgeInsets.symmetric(horizontal: width, vertical: heigth * .1),
        width: double.infinity,
        height: heigth,
        decoration: BoxDecoration(
          // color: Colors.purple,
          gradient: new LinearGradient(
              colors: [
                Colors.red.withOpacity(.5),
                Colors.cyan.withOpacity(.7),
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              // end: new Alignment(0.8, 0.0),
              tileMode: TileMode.clamp),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.blue,
              spreadRadius: 4,
            ),
          ],
        ),
        child: FittedBox(
          child: Text(
            "\$ ${data.currentUser.balance}",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: Theme.of(context).textTheme.headline4!.fontSize),
          ),
        ),
      ),
    );
  }
}
