import 'package:bank_app_social/models/client.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/screens/client_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionLoading extends StatefulWidget {
  static const String routeName = "/transaction_loadingScreen";
  @override
  _TransactionLoadingState createState() => _TransactionLoadingState();
}

class _TransactionLoadingState extends State<TransactionLoading> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      sendMoney();
    });
  }

  Future<void> sendMoney() async {
    final clientProvider = Provider.of<ClientProvider>(context, listen: false);
    dynamic success = false;

    if (kIsWeb)
      success = await clientProvider.transacte();
    else {
      success = await clientProvider.transactionOverSQL();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("completed"),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(ClientProfile.routeName);
            },
            child: Text("home"),
          )
        ],
      )),
    );
  }
}
