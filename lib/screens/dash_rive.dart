import 'dart:async';
import 'dart:developer';

import 'package:bank_app_social/provider/anim_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
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
      unHideOnTypeAnim = SimpleAnimation("unHideonType"),
      backToidle = SimpleAnimation("backToidle"),
      happyAnime = SimpleAnimation('happy'),
      sadAnime = SimpleAnimation('sad');

  late Artboard _riveArtboard;

  late AnimationController controller;

  /// we also need to make reverse mode while rive2 isnot giving us option
  /// miss you flare/rive1
  ///TODO:: make it on simple 3 steps +2mode
  /// - on nothing tuch = idle
  /// - on userName => startType, onType
  /// - on pass =>
  ///             onType , hideOnType
  ///     if idle poss=> startType, hideOnType
  ///
  _rmControllers() {
    _riveArtboard.artboard
      ..removeController(idleAnim)
      ..removeController(startTypeAnim)
      ..removeController(hideOnTypeAnim)
      ..removeController(onTypeAnime)
      ..removeController(backToidle)
      ..removeController(unHideOnTypeAnim)
      ..removeController(happyAnime)
      ..removeController(sadAnime);
  }

  _playHappyModeAnim() {
    _rmControllers();
    _riveArtboard.artboard..addController(happyAnime);
  }

  _playSadModeAnim() {
    _rmControllers();
    _riveArtboard.artboard..addController(sadAnime);
  }

  _playIdleAnime() {
    _rmControllers();
    _riveArtboard.artboard.addController(idleAnim);
  }

  playStartTypeAnim() {
    _rmControllers();
    _riveArtboard.artboard..addController(startTypeAnim);
  }

  playhideOnTypeAnim() {
    _rmControllers();
    _riveArtboard.artboard..addController(hideOnTypeAnim);
  }

  playonTypeAnime() {
    _rmControllers();
    _riveArtboard.artboard..addController(onTypeAnime);
  }

  playbackToidle() {
    _rmControllers();
    _riveArtboard.artboard..addController(backToidle);
  }

  ///reverse not possible
  _reverse() {
    //reverse doesnt support on rive 2 -_-, i mean i cant find
    log(_riveArtboard.animations.length.toString());
  }

  _playunhideOnType() {
    _rmControllers();
    _riveArtboard.artboard..addController(unHideOnTypeAnim);
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

  _changeState(DashState currentState, DashState prevState) {
    switch (currentState) {
      case DashState.happy:
        _happy();
        break;
      case DashState.sad:
        _sad();
        break;
      case DashState.idle:
        if (prevState == DashState.onType)
          _userNameonIdle();
        else
          _onIdle();

        break;
      case DashState.onType:
        if (prevState == DashState.onPassword)
          _passToUserName();
        else
          _onFocusUserName();
        break;
      case DashState.onPassword:
        _onFocusPassword();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashProvider>(builder: (_, state, __) {
      if (state.state != state.prevState) {
        print("Change occurs");
        _changeState(state.state, state.prevState);
      }
      return Container(
        height: 220,
        child: _riveArtboard == null
            ? SizedBox()
            : AspectRatio(
                aspectRatio: 1,
                child: Rive(artboard: _riveArtboard),
              ),
      );
    });
  }

  _happy() {
    if (!onTypeAnime.isActive) {
      playStartTypeAnim();
      startTypeAnim.isActiveChanged.addListener(() {
        if (!startTypeAnim.isActive)
          SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
            _playHappyModeAnim();
          });
      });
    } else
      _playHappyModeAnim();
  }

  /// afterSadMode back to idle
  _sad() {
    playStartTypeAnim();
    if (!onTypeAnime.isActive) {
      startTypeAnim.isActiveChanged.addListener(() {
        if (!startTypeAnim.isActive)
          SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
            _playSadModeAnim();
          });
      });
    } else
      _playSadModeAnim();
  }

  _userNameonIdle() {
    playbackToidle();
    backToidle.isActiveChanged.addListener(() {
      if (backToidle.isActive == false) {
        SchedulerBinding.instance!.addPostFrameCallback((_) {
          _playIdleAnime();
        });
      }
    });
  }

  void _onFocusUserName() {
    playStartTypeAnim();
    startTypeAnim.isActiveChanged.addListener(() {
      if (startTypeAnim.isActive == false) {
        SchedulerBinding.instance!.addPostFrameCallback((_) {
          playonTypeAnime();
        });
      }
    });
  }

  // onTypeTOHide
  void _onFocusPassword() {
    if (onTypeAnime.isActive)
      playhideOnTypeAnim();
    else {
      playStartTypeAnim();
      startTypeAnim.isActiveChanged.addListener(() {
        if (startTypeAnim.isActive == false) {
          SchedulerBinding.instance!.addPostFrameCallback((_) {
            playhideOnTypeAnim();
          });
        }
      });
    }
  }

  // password to userName
  void _passToUserName() {
    _playunhideOnType();
    unHideOnTypeAnim.isActiveChanged.addListener(() {
      if (unHideOnTypeAnim.isActive == false) {
        SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
          playonTypeAnime();
        });
      }
    });
  }

  ///passWord to Idle
  void _onIdle() {
    //we need check if last state was hide?

    _playunhideOnType();
    unHideOnTypeAnim.isActiveChanged.addListener(() {
      if (unHideOnTypeAnim.isActive == false) {
        SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
          playbackToidle();
        });

        backToidle.isActiveChanged.addListener(() {
          if (backToidle.isActive == false) {
            SchedulerBinding.instance!.addPostFrameCallback((_) {
              _playIdleAnime();
            });
          }
        });
      }
    });
  }
}
