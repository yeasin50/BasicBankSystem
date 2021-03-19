import 'dart:developer';

import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/models/client.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/screens/homeScreen.dart';
import 'package:bank_app_social/screens/moneyTransferScreen.dart';
import 'package:bank_app_social/widgets/card_option_item.dart';
import 'package:bank_app_social/widgets/currentBalance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientProfile extends StatefulWidget {
  static const String routeName = "/client_profile";

  @override
  _ClientProfileState createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  late Client clientData;
  late int index;

  @override
  void initState() {
    super.initState();

    ///`For Designing UI`
    clientData = Client(
      name: "Md. Yeasin Sheikh",
      email: "yeasinSheikh5@gmail.com",
      phone: "+880175469898",
      address: "Manikganj Sadar, Dhaka ",
      imagePath: "Image",
      balance: 1002 + 30,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider = Provider.of<ClientProvider>(context);
    index = ModalRoute.of(context)!.settings.arguments as int;
    if (index != null) clientData = provider.clients[index];
    provider.currentUser = clientData;
    //generate dummy list
    provider.generateDummyData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBody(context),
      ),
    );
  }

  Column buildBody(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    double logoRadious = getProportionateScreenWidth(60);

    var cartItem = 2;
    var cartSize = width * .23 * 3 / cartItem;

    ///`generated Options`
    //* we need to pass size according gridItem list, coz that design depend on this Size
    List<CardItem> getGriditems = [
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

    /// navigate to Diff Screen
    void onOptionClick(int index) {
      switch (index) {
        case 0:
          log("Send Money");
          Navigator.of(context).pushNamed(TransactionScreen.routeName);
          break;

        case 1:
          Navigator.of(context).pushNamed(ClientsOverviewScreen.routeName);
          log("OverView");
          break;

        case 2:
          log("Recharge");
          break;

        case 3:
          log("Cash Out");
          break;

        case 4:
          log("Reset Pin");
          break;

        case 5:
          log("help");
          break;

        default:
          log("None gonna happen");
      }
    }

    return Column(children: <Widget>[
      ///``
      Container(
        color: Colors.green,
        height: height * .3,
        width: SizeConfig.screenWidth,
        child: Stack(
          children: <Widget>[
            if (index != null)
              Positioned(
                left: 10,
                top: 30,
                child: InkWell(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            Positioned(
              left: 0,
              right: 0,
              bottom: height * .009,
              child: Container(
                alignment: Alignment.bottomCenter,
                // color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: logoRadious,
                        child: Icon(
                          Icons.person,
                          size: logoRadious,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.white,
                              spreadRadius: 5),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: logoRadious * .1,
                    ),

                    ///`Name Field`
                    Text(
                      clientData.name,
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.headline6!.fontSize),
                    ),
                    SizedBox(
                      height: logoRadious * .040,
                    ),
                    Text(
                      clientData.phone,
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyText1!.fontSize),
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
      CurrentBalanceBar(clientData.balance!),

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
          padding: const EdgeInsets.all(24.0),
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
    ]);
  }
}
