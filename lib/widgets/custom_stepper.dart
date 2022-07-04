import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stepper_markup/widgets/step_icon.dart';
import '_step.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {

  int curStep = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0, bottom: 0, left: 40,
          child: Container(
            color: Colors.grey[100],
            width: 4,
          )
        ),
        SizedBox(
          height: 300,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(25),
                dashPattern: [3, 3],
                color: (curStep == 1) ? Color(0xffaaaaaa) : Colors.white,
                strokeWidth: 1,
                child: ListTile(
                  leading: StepIcon(thisStepNo: 1, curStep: curStep),
                  title: Text('Login to platform'),
                  subtitle: (curStep == 1) ? Text('Subtitle for this step') : null,
                  onTap: () {
                    setState(() {
                      curStep = 1;
                    });
                  },
                ),
              ),

              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(25),
                dashPattern: [3, 3],
                color: (curStep == 2) ? Color(0xffaaaaaa) : Colors.white,
                strokeWidth: 1,
                child: ListTile(
                  leading: StepIcon(thisStepNo: 2, curStep: curStep),
                  title: Text('Create your profile'),
                  subtitle: (curStep == 2) ? Text('Fields to fill in: contact and emergency info, primary care provider') : null,
                  onTap: () {
                    setState(() {
                      curStep = 2;
                    });
                  },
                ),
              ),

              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(25),
                dashPattern: [3, 3],
                color: (curStep == 3) ? Color(0xffaaaaaa) : Colors.white,
                strokeWidth: 1,
                child: ListTile(
                  leading: StepIcon(thisStepNo: 3, curStep: curStep),
                  title: Text('Complete required questionnaires'),
                  subtitle: (curStep == 3) ? Text('Subtitle for this step') : null,
                  onTap: () {
                    setState(() {
                      curStep = 3;
                    });
                  },
                ),
              ),

              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(25),
                dashPattern: [3, 3],
                color: (curStep == 4) ? Color(0xffaaaaaa) : Colors.white,
                strokeWidth: 1,
                child: ListTile(
                  leading: StepIcon(thisStepNo: 4, curStep: curStep),
                  title: Text('Video session test'),
                  subtitle: (curStep == 4) ? Text('Subtitle for this step') : null,
                  onTap: () {
                    setState(() {
                      curStep = 4;
                    });
                  },
                ),
              ),

              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(25),
                dashPattern: [3, 3],
                color: (curStep == 5) ? Color(0xffaaaaaa) : Colors.white,
                strokeWidth: 1,
                child: ListTile(
                  leading: StepIcon(thisStepNo: 5, curStep: curStep),
                  title: Text('Book the first appointment'),
                  subtitle: (curStep == 5) ? Text('Subtitle for this step') : null,
                  onTap: () {
                    setState(() {
                      curStep = 5;
                    });
                  },
                ),
              ),

            ],
          )
        ),
      ],
    );
  }
}