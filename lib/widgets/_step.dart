// CustomStep(
//   thisStepNo: 2,
//   curStep: this.curStep,
//   title: 'Login to platform',
//   subTitle: 'Short description for Login to platform',
// ),

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:stepper_markup/widgets/stepper_state.dart';

class CustomStep extends StatefulWidget {
  CustomStep({
    Key? key,
    required this.state,
    required this.element,
    required this.onTap,
  }) : super(key: key);

  final StepperState state;
  final StepperElement element;
  final void Function(StepperElement) onTap;

  @override
  State<CustomStep> createState() => _CustomStepState();
}

class _CustomStepState extends State<CustomStep> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(25),
      dashPattern: const [3, 3],
      color: const Color(0xffaaaaaa),
      strokeWidth: widget.state == StepperState.current? 1 : 0.0,
      child: ListTile(
        leading: const Icon(Icons.radio_button_unchecked),
        title: Text(widget.state.name), // TODO switch to title
        subtitle: Text(widget.state.name), // TODO switch to subtitle
        onTap: () => widget.onTap(widget.element),
      ),
    );
  }
}
