import 'package:bank_app_social/provider/anim_provider.dart';
import 'package:bank_app_social/screens/dash_rive.dart';
import 'package:bank_app_social/widgets/authForm.dart';
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
    return Scaffold(
      body: Consumer<DashProvider>(
        builder: (_, data, __) => GestureDetector(
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
          child: Column(
            children: [
              RiveChar(),
              AuthForm(),
              // RaisedButton(
              //   onPressed: () {
              //     data.dashState(DashState.onType);
              //   },
              //   child: Text("Username"),
              // ),
              // RaisedButton(
              //   onPressed: () {
              //     data.dashState(DashState.onPassword);
              //   },
              //   child: Text("passWord"),
              // ),
              // RaisedButton(
              //   onPressed: () {
              //     data.dashState(DashState.idle);
              //   },
              //   child: Text("TOidle"),
              // ),

              // RaisedButton(
              //   onPressed: () {
              //     data.dashState(DashState.happy);
              //   },
              //   child: Text("Happy"),
              // ),
              // RaisedButton(
              //   onPressed: () {
              //     data.dashState(DashState.sad);
              //   },
              //   child: Text("sad"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
