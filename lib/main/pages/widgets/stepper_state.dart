import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum StepperState {
  passed (
    icon: Icon(FontAwesomeIcons.solidCircleCheck, size: 16, color: Colors.lightGreen), 
    borderColor: Colors.white,
  ),
  current(
    icon: Icon(FontAwesomeIcons.circle, size: 20),
    borderColor: Color(0xffaaaaaa),
  ),
  future (
    icon: Icon(Icons.radio_button_unchecked, size: 18),
    borderColor: Colors.white,
  );

  const StepperState({
    required this.icon,
    required this.borderColor,
  });

  final Icon icon;
  final Color borderColor;
}