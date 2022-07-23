import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'stepper_state.dart';

class OneStep extends StatefulWidget {
  const OneStep({
    Key? key,
    required this.stepState,
    required this.title,
    this.subtitle,
    required this.onTap,
  }) : super(key: key);

  final StepperState stepState;
  final Text title;
  final Text? subtitle;
  final VoidCallback onTap;

  @override
  State<OneStep> createState() => _OneStepState();
}

class _OneStepState extends State<OneStep> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(25),
      dashPattern: const [3, 3],
      color: widget.stepState.borderColor,
      strokeWidth: 1,
      child: ListTile(
        leading: widget.stepState.icon,
        title: widget.title,
        subtitle: widget.subtitle,
        onTap: widget.onTap,
      ),
    );
  }
}