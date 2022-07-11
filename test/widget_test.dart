// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stepper_markup/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final a = 2; // a is int
    final s = 'Alex'; // s is String
    final f = myTest2; // f is Function // f is void Function()
    final f1 = myTest3; // f1 is Function // f1 is String Function()
    final String Function(int) f2 = myTest; // f2 is Function // f2 is String Function()
    final f4 = myTest4; // f4 is double Function(String, bool)
  });
}

double myTest4(String a, bool b) {
  return 0.0;
}

String myTest(int i) {
  return '';
}

void myTest2() {

}

String myTest3() {
  return '';
}

