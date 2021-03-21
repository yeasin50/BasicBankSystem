import 'package:bank_app_social/provider/db_manager.dart';
import 'package:bank_app_social/provider/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DBTester extends StatefulWidget {
  @override
  _DBTesterState createState() => _DBTesterState();
}

class _DBTesterState extends State<DBTester> {
  int result = 4;
  int currentDB = 0;

  @override
  void initState() {
    super.initState();
    insertDB();
  }

  dbSize() async {
    var dbHelper = await ClientDatabse.instance;
    var clients = await dbHelper.getClients(ClientDatabse.tableName);
    print(clients.toString());
    setState(() {
      result = clients.length;
    });
  }

  insertDB() async {
    for (int i = 0; i < dummyData.length; i++) {
      await ClientDatabse.instance.insert(
        ClientDatabse.tableName,
        dummyData[i],
      );
    }
    print(result.toString());
  }

  update() async {
    //current balance: 63194.0
    var c = dummyData[0];
    c.balance -= 10000;
    var result = await ClientDatabse.instance.update(c);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Data inserted: $result"),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: dbSize,
            child: Text("DB size"),
          ),
          RaisedButton(
            onPressed: insertDB,
            child: Text("Insert $currentDB"),
          ),
          RaisedButton(
            onPressed: update,
            child: Text("update"),
          ),
        ],
      ),
    );
  }
}
