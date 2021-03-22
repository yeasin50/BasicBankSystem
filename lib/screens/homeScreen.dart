import 'dart:developer';

import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/models/client.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/screens/client_profile.dart';
import 'package:bank_app_social/widgets/appBar.dart';
import 'package:bank_app_social/widgets/client_row.dart';
import 'package:bank_app_social/widgets/particles_bg.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientsOverviewScreen extends StatefulWidget {
  static const String routeName = "/users_screen";
  @override
  _ClientsOverviewScreenState createState() => _ClientsOverviewScreenState();
}

class _ClientsOverviewScreenState extends State<ClientsOverviewScreen> {
  @override
  void initState() {
    super.initState();
  }

  getdata() async {
    var c = Provider.of<ClientProvider>(context, listen: false).clients;
    print(c.length.toString());
    return c;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          ParticlesBackground(),
          buildColumnBody(),
        ],
      ),
    );
  }

  Padding buildColumnBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (kIsWeb)
            MyAppBar(
              "Users",
            ),
          if (!kIsWeb)
            AppBar(
              backgroundColor: Colors.blue.withOpacity(.4),
              title: const Text("Users"),
            ),
          const SizedBox(
            height: 10,
          ),
          Consumer<ClientProvider>(
            builder: (_, data, __) => FutureBuilder(
                future: getdata(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CircularProgressIndicator();

                  if (!snapshot.hasData)
                    return Column(
                      children: [
                        Text(
                          "No data",
                          style: TextStyle(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        RaisedButton(
                          onPressed: getdata,
                          child: Text("get Data"),
                        ),
                      ],
                    );
                  if (snapshot.hasData)
                    return Expanded(
                      child: ListView.separated(
                        itemCount: data.clients.length,
                        itemBuilder: (context, index) {
                          return ClientRow(index);
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                        ),
                        physics: BouncingScrollPhysics(),
                      ),
                    );
                  else
                    return Text(
                      "Somwthing Bad happen",
                      style: TextStyle(
                        backgroundColor: Colors.white,
                      ),
                    );
                }),
          ),
        ],
      ),
    );
  }
}
