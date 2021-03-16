import 'package:flutter/material.dart';

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

  _trySubmit() {}
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(8),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
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
                child: RaisedButton(
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
                    Icon(Icons.settings_backup_restore),
                    Icon(Icons.settings_backup_restore),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
