import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {

  int _count = 0;

  int get count => _count;

  bool get isZero => _count == 0;
  bool get isMax => _count >= 10;

  String get statusMessage {
    if (_count == 0) return 'Press + to start';
    if (_count < 5) return 'Keep going!';
    if (_count <10) return 'Almost there!';
    return 'Maximum reached!';
  }


  void increment () {
    if (_count >=10 ) return;
    _count++;
    notifyListeners();
  }

  void decrement () {
    if(_count <=0) return;
    _count--;
    notifyListeners();
  }

  void reset () {
    if(count == 0) return;
    _count = 0;
    notifyListeners();
  }

}