import 'package:flutter/material.dart';
import 'main.dart';

class AppModel extends ChangeNotifier {
  AppModel() {
    /// lets pretend we have to do some async initilization
    Future.delayed(const Duration(seconds: 3)).then((_) {
      _counter = 8;
      getIt.signalReady(this);
    });
  }

  int _counter = 0;
  int get counter => _counter;
  set counter(int val) {
    _counter = val;
    notifyListeners();
  }
}
