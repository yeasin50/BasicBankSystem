import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/provider/anim_provider.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/provider/db_manager.dart';
import 'package:bank_app_social/provider/dummy_data.dart';
import 'package:bank_app_social/screens/dash_rive.dart';
import 'package:bank_app_social/widgets/authForm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth_screen";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var width = SizeConfig.screenWidth!;
    var height = SizeConfig.screenHeight!;

    // print("width  $width");

    return Scaffold(
      resizeToAvoidBottomInset: false,

      ///TODO:: fix bg COlor
      backgroundColor: Colors.black54,
      body: Consumer<DashProvider>(
        builder: (context, data, __) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(
              new FocusNode(),
            );
            //if not idle, then go back to Idle
            if (data.state != DashState.idle) {
              data.dashState(DashState.idle);
            }
          },
          child: Stack(
            children: [
              if (kIsWeb)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: RiveChar(),
                  ),
                ),
              if (!kIsWeb)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: height * .4,
                    width: width * .8,
                    child: RiveChar(),
                  ),
                ),
              if (!kIsWeb)
                Positioned(
                  top: height * .4,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: width,
                    child: AuthForm(),
                  ),
                ),
              if (kIsWeb)
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: AuthForm(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
