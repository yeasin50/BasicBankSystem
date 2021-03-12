import 'dart:developer';

import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/models/client.dart';
import 'package:bank_app_social/provider/client_provider.dart';
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
    // int index = ModalRoute.of(context)!.settings.arguments as int;
    // clientData = Provider.of<ClientProvider>(context).clients[index];
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

    var cartItem = 3;
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
              Icons.person,
              color: Colors.yellow,
            ),
          )),
      CardItem(
          size: cartSize,
          text: "Send Money",
          logo: CircleAvatar(
            radius: cartSize * .4,
            child: Icon(Icons.person),
          )),
      CardItem(
          size: cartSize,
          text: "Send Money",
          logo: CircleAvatar(
            radius: cartSize * .4,
            child: Icon(Icons.person),
          )),
      CardItem(
          size: cartSize,
          text: "Send Money",
          logo: CircleAvatar(
            radius: cartSize * .4,
            child: Icon(Icons.person),
          )),
      CardItem(
          size: cartSize,
          text: "Send Money",
          logo: CircleAvatar(
            radius: cartSize * .4,
            child: Icon(Icons.person),
          )),
    ];

    return Column(children: <Widget>[
      ///``
      Container(
        color: Colors.green,
        height: height * .3,
        width: SizeConfig.screenWidth,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 10,
              top: 30,
              child: InkWell(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.red,
                ),
                // onTap: () => Navigator.pop(context),
                onTap: () {
                  print(2 * 3);
                  log("Tapped ");
                },
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
        child: GridView.builder(
            itemCount: getGriditems.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cartItem,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                child: new InkResponse(
                  child: getGriditems[index],
                  onTap: () {
                    print(index);
                  },
                ),
              );
            }),
      ),
    ]);
  }
}
