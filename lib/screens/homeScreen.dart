import 'dart:developer';

import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/models/client.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/screens/client_profile.dart';
import 'package:bank_app_social/widgets/appBar.dart';
import 'package:bank_app_social/widgets/client_row.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ClientProvider>(context, listen: false).generateDummyData();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        if (kIsWeb) MyAppBar("Home Screen"),
        if (!kIsWeb)
          AppBar(
            title: const Text("Home Screen"),
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
