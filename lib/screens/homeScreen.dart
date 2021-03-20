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

  Column buildColumnBody() {
    return Column(
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
        Consumer<ClientProvider>(
          builder: (_, data, __) => Expanded(
            child: ListView.separated(
              itemCount: data.clients.length,
              itemBuilder: (context, index) {
                return ClientRow(index);
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              physics: BouncingScrollPhysics(),
            ),
          ),
        ),
      ],
    );
  }
}
