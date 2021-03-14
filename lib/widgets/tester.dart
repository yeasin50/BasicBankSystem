import 'package:bank_app_social/configs/size.dart';
import 'package:flutter/material.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

class TransactionConfOverview extends StatefulWidget {
  final String sendername, receiverName;
  final double amount;
  TransactionConfOverview({
    required this.sendername,
    required this.receiverName,
    required this.amount,
  });

  @override
  _TransactionConfOverviewState createState() =>
      _TransactionConfOverviewState();
}

class _TransactionConfOverviewState extends State<TransactionConfOverview> {
  List<Icon> icons = List.generate(
    10,
    (index) => Icon(Icons.arrow_right),
  );

  @override
  Widget build(BuildContext context) {
    //TODO:: handle on rotation
    return LayoutBuilder(
      builder: (context, constraints) => Center(
        child: Container(
          alignment: Alignment.center,
          height: constraints.maxHeight * .2,
          width: constraints.maxWidth * .8,
          color: Colors.red.withAlpha(12),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ///art flow
              Positioned(
                left: constraints.maxWidth * .1,
                child: Icon(Icons.arrow_right),
              ),
              Positioned(
                left: constraints.maxWidth * .01,
                child: Column(
                  children: [
                    Icon(Icons.ac_unit),
                    FittedBox(
                        child: Text(
                      widget.sendername,
                    )),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Icon(Icons.ac_unit),
                    FittedBox(
                      child: Text(widget.amount.toString()),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: constraints.maxWidth * .01,
                child: Column(
                  children: [
                    Icon(Icons.ac_unit),
                    Text(
                      widget.receiverName,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
