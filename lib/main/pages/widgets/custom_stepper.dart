import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:stepper_markup/main/pages/widgets/one_step.dart';
import 'package:stepper_markup/main/pages/widgets/step_icon.dart';
import 'package:stepper_markup/main/pages/widgets/stepper_state.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int curStep = 0;

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
            )),
        SizedBox(
            height: 300,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              children: [
                ...StepperElement.values.map((StepperElement e) {
                  late final StepperState stepperState;
                  if (curStep == e.index) {
                    // current
                    stepperState = StepperState.current;
                  } else if (curStep < e.index) {
                    // passed
                    stepperState = StepperState.passed;
                  } else {
                    // future
                    stepperState = StepperState.future;
                  }

                  return OneStep(
                      // curStep: curStep,
                      // curElement: e.index,
                      stepState: stepperState,
                      title: e.title,
                      subtitle: e.subtitle,
                      onTap: () {
                        setState(() {
                          curStep = e.index;
                        });
                      });
                }),

                // DottedBorder(
                //   borderType: BorderType.RRect,
                //   radius: const Radius.circular(25),
                //   dashPattern: const [3, 3],
                //   color: (curStep == e.index) ? const Color(0xffaaaaaa) : Colors.white,
                //   strokeWidth: 1,
                //   child: ListTile(
                //     leading: StepIcon(thisStepNo: e.index, curStep: curStep),       // <<< Здесь состояния и логика состояний
                //     title: Text(e.title),
                //     subtitle: (curStep == e.index) ? Text(e.subtitle) : null,
                //     onTap: () {
                //       setState(() {
                //         curStep = e.index;
                //       });
                //     },
                //   ),
                // ),

                // ),
              ],
            )),
      ],
    );
  }
}