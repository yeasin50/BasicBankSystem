import 'dart:developer';

import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/main.dart';
import 'package:bank_app_social/models/client.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/provider/dummy_data.dart';
import 'package:bank_app_social/screens/homeScreen.dart';
import 'package:bank_app_social/screens/moneyTransferScreen.dart';
import 'package:bank_app_social/widgets/card_option_item.dart';
import 'package:bank_app_social/widgets/currentBalance.dart';
import 'package:bank_app_social/widgets/particles_bg.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientProfile extends StatefulWidget {
  static const String routeName = "/client_profile";

  @override
  _ClientProfileState createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  int index = -1;
  List<CardItem> getGriditems = [];
  var provider;

  @override
  void initState() {
    super.initState();

    ///`For Designing UI`
    // clientData = dummyData[dummyData.length - 1];
    // print("initState");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ParticlesBackground(),
            buildBody(context),
          ],
        ),
      ),
    );
  }

  Container buildBody(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    double logoRadious = getProportionateScreenWidth(60);

    var cartItem = 2;
    // var cartSize = width * .23 * 3 / cartItem

    ///`generated Options`
    //* we need to pass size according gridItem list, coz that design depend on this Size
    var cartSize = width * .23 * 3 / cartItem;

    getGriditems = [
      CardItem(
          size: cartSize,
          text: "Send Money",
          logo: CircleAvatar(
            //TODO:: Test this later with container
            // width: cartSize * .7,
            radius: cartSize * .4,
            child: Icon(
              Icons.send,
              size: cartSize * .4,
            ),
          )),
      CardItem(
          size: cartSize,
          text: "Users",
          logo: CircleAvatar(
            radius: cartSize * .4,
            child: Icon(
              Icons.people,
              size: cartSize * .4,
            ),
          )),
      CardItem(
          size: cartSize,
          text: "Payment",
          logo: CircleAvatar(
            radius: cartSize * .4,
            child: Icon(
              Icons.payment,
              size: cartSize * .4,
            ),
          )),
      CardItem(
          size: cartSize,
          text: "Recharge",
          logo: CircleAvatar(
            radius: cartSize * .4,
            child: Icon(
              Icons.phone,
              size: cartSize * .4,
            ),
          )),
      CardItem(
          size: cartSize,
          text: "Cash Out",
          logo: CircleAvatar(
            radius: cartSize * .4,
            child: Icon(
              Icons.local_atm,
              size: cartSize * .4,
            ),
          )),
      CardItem(
          size: cartSize,
          text: "Reset Account",
          logo: CircleAvatar(
            radius: cartSize * .4,
            child: Icon(
              Icons.build_rounded,
              size: cartSize * .4,
            ),
          )),
      CardItem(
          size: cartSize,
          text: "Help",
          logo: CircleAvatar(
            radius: cartSize * .4,
            child: Icon(
              Icons.support_agent_outlined,
              size: cartSize * .4,
            ),
          )),
    ];

    ///snackBar
    void logText() {
      print("later 😁");
    }

    /// navigate to Diff Screen
    void onOptionClick(int index) {
      switch (index) {
        case 0:
          // log("Send Money");
          Navigator.of(context).pushNamed(TransactionScreen.routeName);
          break;

        case 1:
          Navigator.of(context).pushNamed(ClientsOverviewScreen.routeName);
          // log("OverView");
          break;
        default:
          log("None gonna happen");
          logText();
          break;
      }
    }

    return Container(
      child: Consumer<ClientProvider>(
        builder: (_, data, c) => Column(
          children: <Widget>[
            ///``
            Container(
              // color: Colors.green,
              height: height * .3,
              width: SizeConfig.screenWidth,
              child: Stack(
                children: <Widget>[
                  // if (index != -1)
                  //   Positioned(
                  //     left: 10,
                  //     top: 30,
                  //     child: InkWell(
                  //       child: Icon(
                  //         Icons.arrow_back,
                  //         color: Colors.red,
                  //       ),
                  //       onTap: () => Navigator.of(context)
                  //           .pushReplacementNamed(ClientsOverviewScreen.routeName),
                  //     ),
                  //   ),
                  ///`header Icon`
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 20,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      color: Colors.transparent,
                      // color: Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (kIsWeb)
                            buildProfileIcon(height * .5, height * .5, data),
                          if (!kIsWeb) buildProfileIcon(width, height, data),

                          SizedBox(
                            height: logoRadious * .1,
                          ),

                          ///`Name Field`
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white.withOpacity(.9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Text(
                              data.currentUser.name,
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .fontSize),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: logoRadious * .1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///`EOF Header`
            ///DONE:: Balance ,
            CurrentBalanceBar(),

            // CurrentBalanceBar(34343),

            ///Done:: send money, transactionList,// we will make build method with containter size
            // Expanded(
            //   child: GridView.count(
            //     crossAxisCount: cartItem,
            //     childAspectRatio: 1 / 1,
            //     crossAxisSpacing: 16,
            //     mainAxisSpacing: 16,
            //     padding: const EdgeInsets.all(24),
            //     children: getGriditems,
            //     physics: BouncingScrollPhysics(),
            //   ),
            // ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: getGriditems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cartItem,
                      mainAxisSpacing: 24,
                      childAspectRatio: 1,
                      crossAxisSpacing: 24,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkResponse(
                        child: getGriditems[index],
                        onTap: () => onOptionClick(index),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildProfileIcon(double width, double height, ClientProvider data) {
    return Container(
      width: width * .4,
      height: width * .4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(180),
        child: Hero(
          tag: "rowItem$index",
          child: Image.asset(
            data.currentUser.imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.blue,
            spreadRadius: 10,
          ),
        ],
      ),
    );
  }
}
