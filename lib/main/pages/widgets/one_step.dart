import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:stepper_markup/main/pages/widgets/stepper_state.dart';
import 'step_icon.dart';

class OneStep extends StatefulWidget {
  OneStep({
    Key? key,
    // required this.curStep,
    // required this.curElement,
    required this.stepState,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  final StepperState stepState;
  // final int curStep;
  // final int curElement;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  State<OneStep> createState() => _OneStepState();
}

class _OneStepState extends State<OneStep> {
  @override
  Widget build(BuildContext context) {
    return Container();
    // return DottedBorder(
    //   borderType: BorderType.RRect,
    //   radius: const Radius.circular(25),
    //   dashPattern: const [3, 3],
    //   color: (widget.curStep == widget.curElement) ? const Color(0xffaaaaaa) : Colors.white,
    //   strokeWidth: 1,
    //   child: ListTile(
    //     leading: StepIcon(thisStepNo: widget.curElement, curStep: widget.curStep),       // <<< Здесь состояния и логика состояний
    //     title: Text(widget.title),
    //     subtitle: (widget.curStep == widget.curElement) ? Text(widget.subtitle) : null,
    //     onTap: widget.onTap,
    //   ),
    // );
  }
}