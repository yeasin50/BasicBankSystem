import 'dart:developer';

import 'package:bank_app_social/provider/anim_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  String _userName = '';
  String _password = '';

  dynamic __passValidator(value) {
    if (value!.length <= 4) {
      return 'minimum 4 charecter long';
    }
    return null;
  }

  _trySubmit() {
    final provider = Provider.of<DashProvider>(context, listen: false);

    // ///add happy and sad animation here
    print("user : $_userName pass: $_password");
    if (_userName == "yeasin" && _password == "1234") {
      provider.dashState(DashState.happy);
    } else {
      provider.dashState(DashState.sad);
    }
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
                    hintText: "try yeasin",
                  ),
                  onSaved: (newValue) => _userName = newValue!,
                ),
                TextFormField(
                  key: ValueKey('password'),
                  onTap: () {
                    data.dashState(DashState.onPassword);
                  },
                  validator: (value) => __passValidator(value),
                  decoration: InputDecoration(
                    hintText: '1234',
                  ),
                  obscureText: true,
                  onSaved: (newValue) {
                    _password = newValue!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlineButton(
                    child: Text("Login"),
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
