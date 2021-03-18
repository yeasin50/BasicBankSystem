import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:rive/rive.dart';

enum DashState {
  happy, //need to make
  sad, // need to make
  idle,
  onType,
  onPassword,
}

class DashProvider with ChangeNotifier {
  DashState _cstate = DashState.idle;
  DashState _prevState = DashState.idle;

  get state => _cstate;
  get prevState => _prevState;

  dashState(DashState s) {
    _prevState = _cstate;
    _cstate = s;
    notifyListeners();

    print(
        "req: ${s.toString()} CurrentState: ${_cstate.toString()} Prev: ${_prevState.toString()}");
  }
}
