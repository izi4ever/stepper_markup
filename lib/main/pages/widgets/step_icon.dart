import 'package:flutter/material.dart';

import 'stepper_state.dart';

class StepIcon extends StatefulWidget {
  StepIcon({Key? key, required this.thisStepNo, required this.curStep}) : super(key: key);

  int thisStepNo;
  int curStep;

  @override
  State<StepIcon> createState() => _StepIconState();
}

class _StepIconState extends State<StepIcon> {
  @override
  Widget build(BuildContext context) {
    if (widget.thisStepNo == widget.curStep) {                      // current
      return StepperState.current.icon;
    } else if (widget.thisStepNo < widget.curStep) {                // passed
      return StepperState.passed.icon;
    } else {                                                        // future
      return StepperState.future.icon;
    }
  }
}