import 'package:bank_app_social/provider/dummyData.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data = getdummyData;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        title: Text(data[index].name),
      ),
      separatorBuilder: (BuildContext context, int index) => Divider(
        thickness: 3,
        endIndent: 22.2,
        indent: 23,
      ),
    );
  }
}
