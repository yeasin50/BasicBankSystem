import 'dart:developer';

import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/widgets/appBar.dart';
import 'package:bank_app_social/widgets/transaction_overview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  ///this is gonna use for stepper
  late int _current;
  late List<Step> _steps;
  late List<StepState> _listState;

  //amount
  TextEditingController amountController = TextEditingController();

  // GlobalKey<AutoCompleteTextFieldState<String>> _keyNameField = new GlobalKey();
  String currentText = "";
  String? selectedName = "";

  ///TODO:: use provider to get clientNames
  var suggetionNames = [
    "Yeasom",
    "Sheikg",
    "AAAAA",
    "Asd",
    "ABS",
  ];

  @override
  void initState() {
    _current = 0;
    _listState = [
      StepState.indexed,
      StepState.editing,
      StepState.complete,
      StepState.error
    ];
    super.initState();
  }

  StepState nameStepState() {
    // StepState.indexed,
    //   StepState.editing,
    //   StepState.complete,
    //   StepState.error
    // if running then edit mode
    // if done edit=>complete then check error

    if (_current == 0) return StepState.editing;
    if (_current > 0) return StepState.complete;
    if (!suggetionNames.contains(selectedName))
      return StepState.error;
    else
      return StepState.indexed;
  }

  List<Step> _createSteps(BuildContext context) {
    _steps = <Step>[
      Step(
        ///TODO:: Add error steps here
        state: nameStepState(),
        title: const Text('Receiver'),
        content: Container(
          child: SimpleAutocompleteFormField<String>(
            decoration: InputDecoration(
                // labelText: 'Receiver name', border: OutlineInputBorder(),
                errorText:
                    suggetionNames.contains(selectedName) || selectedName != ""
                        ? null
                        : "Invalid user"),
            // suggestionsHeight: 200.0,
            maxSuggestions: 10,
            itemBuilder: (context, item) => Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(item!)),
            ),
            onSearch: (String search) async => suggetionNames
                .where(
                    (name) => name.toLowerCase().contains(search.toLowerCase()))
                .toList(),
            itemFromString: (string) => suggetionNames.singleWhere(
                (letter) => letter == string.toLowerCase(),
                orElse: () => ''),
            onChanged: (value) => setState(() => selectedName = value),
            onSaved: (value) {
              setState(() => selectedName = value);
            },
            validator: (letter) =>
                suggetionNames.contains(letter) ? 'Invalid letter.' : null,
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
        title: const Text('Amount'),
        content: TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
        ),
        isActive: true,
      ),
      Step(
        state: _current == 3
            ? _listState[1]
            : _current > 2
                ? _listState[2]
                : _listState[0],
        title: const Text('Procced'),
        content: TransactionConfOverview(
          sendername: "Yeasin",
          receiverName: "Sheikh",
          amount: 123123,
        ),
        isActive: true,
      ),
    ];
    return _steps;
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
              if (_current == 2) {
                log("Submit");
              }
              if (_current > _steps.length - 2 ||
                  !suggetionNames.contains(selectedName)) {
                // make transaction from here
                return;
              }
              setState(() {
                _current++;
              });
            },
            onStepTapped: (index) {
              if (!suggetionNames.contains(selectedName)) {
                return;
              }
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
                _current == 0
                    ? SizedBox()
                    : FlatButton(
                        onPressed: onStepCancel,
                        child: Text("Previous"),
                      ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
