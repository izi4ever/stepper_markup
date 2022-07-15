import 'package:flutter/material.dart';

import 'one_step.dart';
import 'stepper_state.dart';
import 'stepper_element.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int curStep = 0;

  void onTap(int index) {
    setState(() {
      curStep = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 40,
          child: Container(
            color: Colors.grey[100],
            width: 4,
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children: [
              ...StepperElement.values.map(
                (StepperElement e) => OneStep(
                  stepState: () {
                    if (curStep == e.index) {
                      return StepperState.current;
                    } else if (curStep > e.index) {
                      return StepperState.passed;
                    } else {
                      return StepperState.future;
                    }
                  }(),
                  title: e.title,
                  subtitle: (curStep == e.index) ? e.subtitle : null,
                  onTap: () => onTap(e.index),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}