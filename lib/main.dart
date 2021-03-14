import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/screens/authScreen.dart';
import 'package:bank_app_social/screens/client_profile.dart';
import 'package:bank_app_social/screens/moneyTransferScreen.dart';
import 'package:bank_app_social/widgets/tester.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ClientProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Basic Bank System',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
          routes: {
            AuthScreen.routeName: (_) => AuthScreen(),
            HomeScreen.routeName: (_) => HomeScreen(),
            ClientProfile.routeName: (_) => ClientProfile(),
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        ///TODO::: Test diff widget base HOme
        body: TransactionConfOverview(
          sendername: "Yeasin",
          receiverName: "Sheikh",
          amount: 123123,
        ),
      ),
    );
  }
}
