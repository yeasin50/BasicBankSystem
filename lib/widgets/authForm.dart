import 'dart:async';
import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/provider/anim_provider.dart';
import 'package:bank_app_social/screens/client_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
 

  late TextEditingController _nameController, _passController;

  _trySubmit() {
    // final isValid = _formKey.currentState!.validate();

    // if (isValid) {
    //   print("$isValid");
    // }

    final provider = Provider.of<DashProvider>(context, listen: false);
    // ///add happy and sad animation here
    // print("user : ${_nameController.text} pass: ${_passController.text}");

    if (_nameController.text == "yeasin" && _passController.text == "1234") {
      provider.dashState(DashState.happy);
      Timer(Duration(seconds: 3), () {
        // print("navigate to HomeScreen");
        Navigator.pushReplacementNamed(context, ClientProfile.routeName);
      });
    } else {
      provider.dashState(DashState.sad);
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.screenWidth!;
    var height = SizeConfig.screenHeight!;

    return Consumer<DashProvider>(
      builder: (_, data, __) => Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(8),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                ///`user name`
                Container(
                  width: kIsWeb
                      ? width > 400
                          ? 400
                          : width
                      : width,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white.withOpacity(.9),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(.5),
                          blurRadius: 2,
                          spreadRadius: 4),
                    ],
                  ),
                  child: TextFormField(
                    cursorColor: Colors.pink,
                    style: TextStyle(),
                    controller: _nameController,
                    onTap: () {
                      // print("Play onUnserName Animation\n");
                      data.dashState(DashState.onType);
                    },
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    key: ValueKey("userName"),
                    validator: (value) {
                      if (value!.trim().isEmpty) return 'Enter your username';
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      prefixIcon: Icon(Icons.person),
                      border: InputBorder.none,
                      // fillColor: Colors.white.withOpacity(.7),
                      // filled: true,
                      hintText: "try yeasin",
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),

                ///`password field`
                Container(
                  width: kIsWeb
                      ? width > 400
                          ? 400
                          : width
                      : width,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white.withOpacity(.9),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(.5),
                          blurRadius: 2,
                          spreadRadius: 4),
                    ],
                  ),
                  child: TextFormField(
                    cursorColor: Colors.green,
                    controller: _passController,
                    key: ValueKey('password'),
                    onTap: () {
                      data.dashState(DashState.onPassword);
                    },
                    validator: (value) {
                      if (value!.length >= 4)
                        return null;
                      else
                        return "password";
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      prefixIcon: Icon(Icons.keyboard_hide),
                      border: InputBorder.none,
                      // fillColor: Colors.white.withOpacity(.7),
                      // filled: true,
                      hintText: '1234',
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
               
                ///`Login button`
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: kIsWeb
                        ? width > 400
                            ? 250
                            : width
                        : 200,
                    height: 50,
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.abrilFatface(
                        textStyle: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize:
                              Theme.of(context).textTheme.headline6!.fontSize,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(180)),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(86, 135, 252, 1),
                          Color.fromRGBO(132, 29, 222, 1),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(86, 135, 252, .5),
                          blurRadius: 7,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  onTap: _trySubmit,
                ),
                SizedBox(
                  height: 12,
                ),
                //facebook google
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // GestureDetector(
                      //     onTap: data.dashState(DashState.happy),
                      //     child: Icon(Icons.settings_backup_restore)),
                      // GestureDetector(
                      //     onTap: data.dashState(DashState.sad),
                      //     child: Icon(Icons.settings_backup_restore)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
