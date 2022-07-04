              // CustomStep(
              //   thisStepNo: 2, 
              //   curStep: this.curStep, 
              //   title: 'Login to platform', 
              //   subTitle: 'Short description for Login to platform',
              // ),

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CustomStep extends StatefulWidget {
  CustomStep({Key? key, required this.thisStepNo, required this.curStep, required this.title, required this.subTitle}) 
    : super(key: key);

  int thisStepNo;
  int curStep;
  String title;
  String subTitle;

  @override
  State<CustomStep> createState() => _CustomStepState();
}

class _CustomStepState extends State<CustomStep> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(25),
      dashPattern: [3, 3],
      color: Color(0xffaaaaaa),
      strokeWidth: (widget.curStep == widget.thisStepNo) ? 1 : 0.0,
      child: ListTile(
        leading: Icon(Icons.radio_button_unchecked),
        title: Text(widget.title),
        subtitle: Text(widget.subTitle),
        onTap: () {
          setState(() {
            widget.curStep = widget.thisStepNo;
          });
        },
      ),
    );
  }
}