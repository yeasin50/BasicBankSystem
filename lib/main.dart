import 'package:bank_app_social/models/particle.dart';
import 'package:bank_app_social/provider/anim_provider.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/screens/authScreen.dart';
import 'package:bank_app_social/screens/client_profile.dart';
import 'package:bank_app_social/screens/moneyTransferScreen.dart';
import 'package:bank_app_social/screens/transaction_loading.dart';
import 'package:bank_app_social/widgets/transaction_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'provider/dummy_data.dart';
import 'screens/dbTester.dart';
import 'screens/homeScreen.dart';
import 'screens/dash_rive.dart';
import 'screens/imageTest.dart';
import 'widgets/authForm.dart';
import 'widgets/neon_container.dart';
import 'widgets/particles_bg.dart';

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
          ChangeNotifierProvider(
            create: (_) => DashProvider(),
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
            ClientsOverviewScreen.routeName: (_) => ClientsOverviewScreen(),
            ClientProfile.routeName: (_) => ClientProfile(),
            TransactionScreen.routeName: (_) => TransactionScreen(),
            TransactionLoading.routeName: (_) => TransactionLoading(),
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.blue.withOpacity(.5),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            // DBTester(),
            // ParticlesBackground(),
            ClientProfile(),
          ],
        ),
      ),
    );
  }
}
