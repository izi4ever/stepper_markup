import 'package:flutter/material.dart';

import 'custom_stepper.dart';

class CardWithStepper extends StatefulWidget {
  CardWithStepper({Key? key}) : super(key: key);

  @override
  State<CardWithStepper> createState() => _CardWithStepperState();
}

class _CardWithStepperState extends State<CardWithStepper> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: const [
          ListTile( 
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 22),
            title: Text('Your journey', style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ))
          ),
          Divider(height: 1, thickness: 0.04, color: Color(0xff000000)),
          CustomStepper(),
        ],
      ),
    );
  }
}