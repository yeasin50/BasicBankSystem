import 'dart:developer';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/widgets/appBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  ///this is gonna use for stepper
  late int _current;
  late List<Step> _steps;
  late List<StepState> _listState;

  GlobalKey<AutoCompleteTextFieldState<String>> _keyNameField = new GlobalKey();
  String currentText = "";

  ///TODO:: use provider to get clientNames
  List<String> _suggetionNames = [
    "Yeasom",
    "Sheikg",
    "AAAAA",
    "Asd",
    "ABS",
  ];

  List<Step> _createSteps(BuildContext context) {
    _steps = <Step>[
      Step(
        state: _current == 0
            ? _listState[1]
            : _current > 0
                ? _listState[2]
                : _listState[0],
        title: const Text('Receiver'),
        content: Container(
          child: SimpleAutoCompleteTextField(
            key: _keyNameField,
            suggestions: _suggetionNames,
          ),
        ),
        isActive: true,
      ),
      Step(
        state: _current == 1
            ? _listState[1]
            : _current > 1
                ? _listState[2]
                : _listState[0],
        title: new Text('Step 2'),
        content: new Text('Do Something'),
        isActive: true,
      ),
      Step(
        state: _current == 2
            ? _listState[1]
            : _current > 2
                ? _listState[2]
                : _listState[0],
        title: new Text('Step 3'),
        content: new Text('Do Something'),
        isActive: true,
      ),
      Step(
        state: _current == 2
            ? _listState[1]
            : _current > 2
                ? _listState[2]
                : _listState[0],
        title: new Text('Step 3'),
        content: new Text('Do Something'),
        isActive: true,
      ),
    ];
    return _steps;
  }

  @override
  void initState() {
    _current = 0;
    _listState = [
      StepState.indexed,
      StepState.editing,
      StepState.complete,
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (kIsWeb) MyAppBar("Transaction Center"),
        if (!kIsWeb)
          AppBar(
            title: Text("Transaction Center"),
          ),
        Expanded(
          child: Stepper(
            physics: ClampingScrollPhysics(),
            currentStep: _current,
            steps: _createSteps(context),
            onStepCancel: () {
              if (_current <= 0) {
                return;
              }
              setState(() {
                _current--;
              });
            },
            onStepContinue: () {
              // log(transactionSteps.length.toString());
              // log("current step : $_currentStep");

              ///why -2? because if we look close enough about stateChanges , we can find it changes after click
              if (_current > _steps.length - 2) {
                return;
              }
              setState(() {
                _current++;
              });
            },
            onStepTapped: (index) {
              setState(() {
                _current = index;
              });
            },
            controlsBuilder: (context, {onStepCancel, onStepContinue}) => Row(
              children: [
                FlatButton(
                  onPressed: onStepContinue,
                  child: Text("Continue"),
                ),
                FlatButton(
                  onPressed: onStepCancel,
                  child: Text("Cancel"),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
