import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/screens/client_profile.dart';
import 'package:bank_app_social/widgets/particles_bg.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = "/result";

  final String _okMessage = "SuccessFully Transferred";
  final String _failedMsg = "Failed to Transfer";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _isOK = ModalRoute.of(context)!.settings.arguments as bool;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            ParticlesBackground(),
            buildBody(_isOK, context),
          ],
        ),
      ),
    );
  }

  Center buildBody(bool _isOK, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _isOK ? _okMessage : _failedMsg,
            style: GoogleFonts.wendyOne(
              color: _isOK ? Colors.white : Colors.red,
              fontSize: Theme.of(context).textTheme.headline5!.fontSize,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _button(context, _isOK),
        ],
      ),
    );
  }

  GestureDetector _button(BuildContext context, bool _isOK) {
    var width = SizeConfig.screenWidth!;
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: kIsWeb
            ? width > 400
                ? 250
                : width
            : 200,
        height: 50,
        child: Text(
          "Exit",
          textAlign: TextAlign.center,
          style: GoogleFonts.abrilFatface(
            textStyle: TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: Theme.of(context).textTheme.headline6!.fontSize,
            ),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(180)),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(86, 135, 252, 1),
              Color.fromRGBO(132, 29, 222, 1),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: _isOK
                  ? Color.fromRGBO(86, 135, 252, .5)
                  : Colors.red.withOpacity(.6),
              blurRadius: 7,
              spreadRadius: 10,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(ClientProfile.routeName);
      },
    );
  }
}
