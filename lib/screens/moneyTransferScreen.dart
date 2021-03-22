import 'dart:developer';

import 'package:bank_app_social/models/client.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/provider/dummy_data.dart';
import 'package:bank_app_social/widgets/appBar.dart';
import 'package:bank_app_social/widgets/transaction_overview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
import 'package:bank_app_social/screens/transaction_loading.dart';

class TransactionScreen extends StatefulWidget {
  static const String routeName = "/transaction_screen";
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  ///this is gonna use for stepper
  late int _current;
  late List<Step> _steps;
  late List<StepState> _listState;

  //amount
  late TextEditingController amountController;
  late TextEditingController nameController;

  // GlobalKey<AutoCompleteTextFieldState<String>> _keyNameField = new GlobalKey();
  String currentText = "";
  String? selectedName = "";
  late var clientProvider;

  ///TODO:: use provider to get clientNames
  List<String> suggetionNames = [];

  /// temp
  double amount = 0;
  String receiverName = "";
  Client sender = dummyData[0], receiver = dummyData[0];

  @override
  void initState() {
    amountController = new TextEditingController();
    nameController = new TextEditingController();
    _current = 0;
    _listState = [
      StepState.indexed,
      StepState.editing,
      StepState.complete,
      StepState.error
    ];

    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      clientProvider = Provider.of<ClientProvider>(context, listen: false);
      sender = clientProvider.currentUser;
      suggetionNames = clientProvider.getClientNames();
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
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
            itemBuilder: (context, name) => Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(180),
                    child: Image.asset(
                      clientProvider.getImagePath(name!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(name)),
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
          sender: sender,
          receiver: receiver,
          amount: amount,
        ),
        isActive: true,
      ),
    ];
    return _steps;
  }

  ///`Send Money`
  sendMoney() async {
    // if (kIsWeb)
    //   success = await clientProvider.transacte(receiver, amount);
    // else {
    //   success = await clientProvider.transactionOverSQL(receiver, amount);
    // }

    // if (success) Navigator.of(context).pop();
    // // Provider.of<ClientProvider>(context)
    // //     .transacte(, amountController.text as double);

    Provider.of<ClientProvider>(context, listen: false)
      ..setreceiver(receiver)
      ..setamount(amount);
    Navigator.of(context).pushNamed(TransactionLoading.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        if (kIsWeb) MyAppBar("Transaction Center"),
        if (!kIsWeb)
          AppBar(
            title: Text(
              "Transaction Center",
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
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
                receiverName = selectedName!;
                if (receiverName != null) {
                  receiver = clientProvider.getReceiver(receiverName);
                }
                var text = amountController.text.trim();
                if (double.tryParse(text) != null)
                  amount = double.tryParse(text)!;
              });
            },
            onStepContinue: () {
              // log(transactionSteps.length.toString());
              // log("current step : $_currentStep");
              ///why -2? because if we look close enough about stateChanges , we can find it changes after click
              if (_current == 2) sendMoney();
              if (_current > _steps.length - 2 ||
                  !suggetionNames.contains(selectedName)) {
                // make transaction from here
                return;
              }
              setState(() {
                _current++;
                receiverName = selectedName!;
                if (receiverName != null) {
                  receiver = clientProvider.getReceiver(receiverName);
                }
                var text = amountController.text.trim();
                if (double.tryParse(text) != null)
                  amount = double.tryParse(text)!;
              });
            },
            onStepTapped: (index) {
              if (!suggetionNames.contains(selectedName)) {
                return;
              }
              setState(() {
                _current = index;
                receiverName = selectedName!;
                if (receiverName != null) {
                  receiver = clientProvider.getReceiver(receiverName);
                }
                var text = amountController.text.trim();
                if (double.tryParse(text) != null)
                  amount = double.tryParse(text)!;
              });
            },
            controlsBuilder: (context, {onStepCancel, onStepContinue}) => Row(
              children: [
                FlatButton(
                  onPressed: onStepContinue,
                  child: _current == 2
                      ? Text(
                          "Procced",
                        )
                      : Text("Continue"),
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
