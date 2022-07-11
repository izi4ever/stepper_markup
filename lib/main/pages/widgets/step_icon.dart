import 'package:flutter/material.dart';

import 'stepper_state.dart';

class StepIcon extends StatefulWidget {
  StepIcon({Key? key, required this.state}) : super(key: key);

  StepperState state ;
  // int thisStepNo;
  // int curStep;

  @override
  State<StepIcon> createState() => _StepIconState();
}

class _StepIconState extends State<StepIcon> {
  @override
  Widget build(BuildContext context) {
    return widget.state.icon;
  }
}