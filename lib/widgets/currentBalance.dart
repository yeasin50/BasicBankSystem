import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentBalanceBar extends StatelessWidget {
  final double balance;
  CurrentBalanceBar(this.balance);

  ///TODO::: Lets color balance later , help `adobe color intel`
  @override
  Widget build(BuildContext context) {
    double heigth = SizeConfig.screenHeight! * .1;
    double width = SizeConfig.screenWidth! * .01;
    return Consumer<ClientProvider>(
      builder: (_, data, __) => Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: width, vertical: heigth * .1),
        padding: EdgeInsets.symmetric(horizontal: width, vertical: heigth * .1),
        width: double.infinity,
        height: heigth,
        decoration: BoxDecoration(
          color: Colors.purple,
          gradient: new LinearGradient(
              colors: [Colors.red, Colors.cyan],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              // end: new Alignment(0.8, 0.0),
              tileMode: TileMode.clamp),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(.9),
              offset: new Offset(2.0, 4.0),
            )
          ],
        ),
        child: FittedBox(
          child: Text(
            "\$ $balance",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline4!.fontSize),
          ),
        ),
      ),
    );
  }
}
