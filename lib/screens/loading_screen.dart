import 'package:bank_app_social/models/client.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/screens/client_profile.dart';
import 'package:bank_app_social/widgets/coin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionLoading extends StatefulWidget {
  static const String routeName = "/transaction_loadingScreen";
  @override
  _TransactionLoadingState createState() => _TransactionLoadingState();
}

//// `TODO:: loading screen`
class _TransactionLoadingState extends State<TransactionLoading>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // sendMoney();
      ///TODO:: turn on release
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
    late AnimationController _controller;
    late Animation<double> _anim1;
    late Animation<double> _anim2;

    @override
    void initState() {
      super.initState();
      _controller = new AnimationController(
        vsync: this,
        duration: Duration(seconds: 5),
      )
        ..addListener(() {
          setState(() {});
        })
        ..repeat();

      _anim1 = Tween<double>(begin: 0.0, end: 180.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
        ),
      );
      _anim2 = Tween<double>(begin: 0.0, end: 180.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
        ),
      );
    }

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(ClientProfile.routeName);
              },
              child: Text("home"),
            ),
          ),
          Center(
            child: Transform(
              transform: Matrix4.identity()
                ..rotateX((0 - _anim1.value) * 0.0174533)
                ..rotateY((0 - _anim2.value) * 0.0174533),
              alignment: FractionalOffset.center,
              child: Coin(
                coinRadius: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
