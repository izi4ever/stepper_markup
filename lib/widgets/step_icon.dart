import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    if (widget.thisStepNo == widget.curStep) { 
      return const Icon(FontAwesomeIcons.circle,
        size: 20,
      );
    } else if (widget.thisStepNo < widget.curStep) {
      return const Icon(FontAwesomeIcons.solidCircleCheck,
        size: 16,
        color: Colors.lightGreen,
      );
    } else {
      return const Icon(Icons.radio_button_unchecked,
        size: 18,
      );
    }
  }
}