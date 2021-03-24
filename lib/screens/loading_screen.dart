import 'dart:async';

import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/screens/transfer_result_screen.dart';
import 'package:bank_app_social/widgets/coin.dart';
import 'package:bank_app_social/widgets/logo_on_loadingScreen.dart';
import 'package:bank_app_social/widgets/particles_bg.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionLoading extends StatefulWidget {
  static const String routeName = "/transaction_loadingScreen";
  @override
  _TransactionLoadingState createState() => _TransactionLoadingState();
}

//// `:: loading screen`
class _TransactionLoadingState extends State<TransactionLoading>
    with TickerProviderStateMixin {
  bool _progressBarOnLeft = true;

  late var _validTransaction = true;

  @override
  void initState() {
    _animVariableInit();
    // _initRotateAnim();
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<ClientProvider>(context, listen: false);

      if (provider.isValidTrasaction) {
        sendMoney();
      } else
        _validTransaction = false;

      ///TODO:: turn on release
    });

    //progressBar
    _timerProgress();
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

  late AnimationController _controller;
  late Animation<double> _animX;
  late Animation<double> _animY;

  late Timer _timer;
  var _progressValue = 0.0;

  _timerProgress() {
    _timer = new Timer.periodic(Duration(milliseconds: 50), frameBuild);
  }

  frameBuild(Timer timer) {
    _progressValue += .01;
    if (_progressValue > 1 && _progressBarOnLeft && _validTransaction) {
      _progressValue = 0;
      _progressBarOnLeft = false;
    }
    setState(() {});
    if (_progressValue > 1 && !_progressBarOnLeft) {
      _timer.cancel();
      _controller.dispose();
      Navigator.of(context).pushReplacementNamed(ResultScreen.routeName,
          arguments: _validTransaction);
    }
  }

  void _animVariableInit() {
    _controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )
      ..addListener(() => setState(() {}))
      ..repeat();

    _animX = Tween<double>(begin: 0.0, end: 360.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );
    _animY = Tween<double>(begin: 0.0, end: 360).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.0, 1.0)));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var width = SizeConfig.screenWidth!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          ParticlesBackground(),
          buildConsumerBody(width),
        ],
      ),
    );
  }

  Consumer<ClientProvider> buildConsumerBody(double width) {
    return Consumer<ClientProvider>(
      builder: (context, value, child) => Stack(
        children: [
          ///`progressBar`
          Align(
            alignment: _progressBarOnLeft
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: SizedBox(
              height: 10,
              width: width * .5,
              child: Padding(
                padding: EdgeInsets.only(
                  right: _progressBarOnLeft ? 0 : width * .2 + 20,
                  left: _progressBarOnLeft ? width * .2 + 20 : 0,
                ),
                child: LinearProgressIndicator(
                  value: _progressValue,
                  backgroundColor: Colors.grey.withOpacity(.5),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _progressBarOnLeft ? Colors.blue : Colors.yellow,
                  ),
                ),
              ),
            ),
          ),

          ///`Coin Rotat3`
          Center(child: buildCoin(width * .25)),

          ///`sender`
          Align(
            alignment: Alignment.centerLeft,
            child: LogoOnLoading(
              imagePath: value.currentUser.imagePath,
              radius: width * .2,
              bgColor: Colors.blue,
            ),
          ),

          ///`receiver`
          Align(
            alignment: Alignment.centerRight,
            child: LogoOnLoading(
              imagePath: value.receiver.imagePath,
              radius: width * .2,
              bgColor: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }

  Transform buildCoin(var size) {
    return Transform(
      transform: Matrix4.identity()
        ..rotateX((0 - _animX.value) * 0.0174533)
        ..rotateY((0 - _animY.value) * 0.0174533)
      // ..rotateZ((0 - _animZ.value) * 0.0174533)
      ,
      alignment: FractionalOffset.center,
      child: Coin(
        coinRadius: size,
      ),
    );
  }
}
