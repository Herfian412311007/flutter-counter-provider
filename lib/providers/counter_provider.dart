import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // memberi tahu UI agar update
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
