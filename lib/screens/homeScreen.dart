import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/provider/dummyData.dart';
import 'package:bank_app_social/widgets/appBar.dart';
import 'package:bank_app_social/widgets/client_row.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data = getdummyData;
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
        Expanded(
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) => ClientRow(data[index]),
            separatorBuilder: (BuildContext context, int index) => Divider(
              thickness: 3,
              endIndent: 22.2,
              indent: 23,
            ),
          ),
        ),
      ],
    );
  }
}
