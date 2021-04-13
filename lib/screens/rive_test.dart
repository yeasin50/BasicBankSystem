import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
///`updated Rive`
class RiveTest extends StatefulWidget {
  @override
  _RiveTestState createState() => _RiveTestState();
}

class _RiveTestState extends State<RiveTest>
    with SingleTickerProviderStateMixin {
  RuntimeArtboard _riveArtboard = RuntimeArtboard();
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();

    rootBundle
        .load("assets/rives/dash(idle_ontype_hideontype,starttyping).riv")
        .then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);
        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        // Add a controller to play back a known animation on the main/default
        // artboard.We store a reference to it so we can toggle playback.
        artboard.addController(_controller = SimpleAnimation('idle'));
        setState(() => _riveArtboard = artboard as RuntimeArtboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Rive(artboard: _riveArtboard),
      ),
    );
  }
}
