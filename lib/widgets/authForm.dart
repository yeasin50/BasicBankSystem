import 'dart:async';
import 'package:bank_app_social/provider/anim_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

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
        print("navigate to HomeScreen");
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
    return Consumer<DashProvider>(
      builder: (_, data, __) => Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(8),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
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
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "try yeasin",
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
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
                    fillColor: Colors.white,
                    filled: true,
                    hintText: '1234',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 15,
                ),
                //TODO;; fixe for web
                SizedBox(
                  width: kIsWeb ? 300 : 200,
                  child: OutlineButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            Theme.of(context).textTheme.headline3!.fontSize,
                      ),
                    ),
                    onPressed: _trySubmit,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
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
