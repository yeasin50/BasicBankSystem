import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/provider/anim_provider.dart';
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

    //#41616E bg
    return Scaffold(
      resizeToAvoidBottomInset: false,

      ///TODO:: fix bg COlor

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
              Positioned(
                top: getProportionateScreenHeight(20),
                left: 0,
                right: 0,
                child: SizedBox(
                  height: kIsWeb ? height : height * .4,
                  width: kIsWeb ? width : width * .8,
                  child: RiveChar(),
                ),
              ),
              Positioned(
                top: kIsWeb ? 0 : height * .35,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: kIsWeb ? width * 4 : width,
                  child: AuthForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
