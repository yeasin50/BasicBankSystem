
import 'package:bank_app_social/provider/anim_provider.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/screens/authScreen.dart';
import 'package:bank_app_social/screens/client_profile.dart';
import 'package:bank_app_social/screens/moneyTransferScreen.dart';
import 'package:bank_app_social/screens/loading_screen.dart';
import 'package:bank_app_social/screens/transfer_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/homeScreen.dart';
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
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: MyHomePage(),
          routes: {
            AuthScreen.routeName: (_) => AuthScreen(),
            ClientsOverviewScreen.routeName: (_) => ClientsOverviewScreen(),
            ClientProfile.routeName: (_) => ClientProfile(),
            TransactionScreen.routeName: (_) => TransactionScreen(),
            TransactionLoading.routeName: (_) => TransactionLoading(),
            ResultScreen.routeName: (_) => ResultScreen(),
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
            ParticlesBackground(),
            // DummyTest(),
            AuthScreen(),
          ],
        ),
      ),
    );
  }
}
