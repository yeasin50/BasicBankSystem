import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveChar extends StatefulWidget {
  @override
  _RiveCharState createState() => _RiveCharState();
}

class _RiveCharState extends State<RiveChar>
    with SingleTickerProviderStateMixin {
  final SimpleAnimation idleAnim = SimpleAnimation("idle"),
      startTypeAnim = SimpleAnimation("startTyping"),
      hideOnTypeAnim = SimpleAnimation("hideOnType"),
      onTypeAnime = SimpleAnimation("onType"),
      hideOnidle = SimpleAnimation("hideOnidle"); // not finished

  late Artboard _riveArtboard;
  late AnimationController controller;

  /// we also need to make reverse mode while rive2 isnot giving us option
  /// miss you flare/rive1
  _rmControllers() {
    _riveArtboard.artboard.removeController(idleAnim);
    _riveArtboard.artboard.removeController(startTypeAnim);
    _riveArtboard.artboard.removeController(hideOnTypeAnim);
    _riveArtboard.artboard.removeController(onTypeAnime);
    _riveArtboard.artboard.removeController(hideOnidle);
  }

  _playIdleAnime() {
    _riveArtboard.artboard.removeController(startTypeAnim);
    _riveArtboard.artboard.removeController(hideOnTypeAnim);
    _riveArtboard.artboard.removeController(onTypeAnime);
    _riveArtboard.artboard.removeController(hideOnidle);
    _riveArtboard.artboard.addController(idleAnim);
  }

  playStartTypeAnim() {
    _riveArtboard.artboard.removeController(idleAnim);
    _riveArtboard.artboard.removeController(hideOnTypeAnim);
    _riveArtboard.artboard.removeController(onTypeAnime);
    _riveArtboard.artboard.removeController(hideOnidle);
    _riveArtboard.artboard.addController(startTypeAnim);
  }

  playhideOnTypeAnim() {
    _riveArtboard.artboard.removeController(idleAnim);
    _riveArtboard.artboard.removeController(startTypeAnim);
    _riveArtboard.artboard.removeController(onTypeAnime);
    _riveArtboard.artboard.removeController(hideOnidle);
    _riveArtboard.artboard.addController(hideOnTypeAnim);
  }

  playonTypeAnime() {
    _riveArtboard.artboard.removeController(idleAnim);
    _riveArtboard.artboard.removeController(startTypeAnim);
    _riveArtboard.artboard.removeController(hideOnTypeAnim);
    _riveArtboard.artboard.removeController(hideOnidle);
    _riveArtboard.artboard.addController(onTypeAnime);
  }

  playhideOnidle() {
    _riveArtboard.artboard.removeController(idleAnim);
    _riveArtboard.artboard.removeController(startTypeAnim);
    _riveArtboard.artboard.removeController(hideOnTypeAnim);
    _riveArtboard.artboard.removeController(onTypeAnime);
    _riveArtboard.artboard.addController(hideOnidle);
  }

  _reverse() {
    log(_riveArtboard.animations.length.toString());
  }

  @override
  void initState() {
    super.initState();
    rootBundle
        .load("assets/rives/dash(idle_ontype_hideontype,starttyping).riv")
        .then((data) async {
      final file = RiveFile();
      if (file.import(data)) {
        setState(() {
          _riveArtboard = file.mainArtboard..addController(idleAnim);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_riveArtboard != null)
              Container(
                height: 200,
                child: Rive(artboard: _riveArtboard),
              ),
            RaisedButton(
              onPressed: _playIdleAnime,
              child: Text("idle"),
            ),
            RaisedButton(
              onPressed: playStartTypeAnim,
              child: Text("StartTyp"),
            ),
            RaisedButton(
              onPressed: playhideOnTypeAnim,
              child: Text("hideOnType"),
            ),
            RaisedButton(
              onPressed: playonTypeAnime,
              child: Text("onType"),
            ),
            RaisedButton(
              onPressed: playhideOnidle,
              child: Text("hideOnidle"),
            ),
            RaisedButton(
              onPressed: _reverse,
              child: Text("reverse"),
            ),
          ],
        ),
      ),
    );
  }
}
