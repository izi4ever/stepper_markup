import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page0 extends StatefulWidget {
  const Page0({Key? key}) : super(key: key);

  @override
  State<Page0> createState() => _Page0State();
}

class _Page0State extends State<Page0> {
  int _stepIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        ListTile(
          title: const Text('Logotip', style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 24,
          )),
          trailing: Icon(
            FontAwesomeIcons.bell,
            size: 22,
            color: Colors.blueGrey[900],
          ),
        ),
        SizedBox(height: 5),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const ListTile( 
                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 22),
                title: Text('Your journey', style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ))
              ),
              const Divider(height: 1, thickness: 0.04, color: Color(0xff000000)),
              Stepper(
                // margin: EdgeInsets.all(0),
                currentStep: _stepIndex,
                onStepCancel: () {
                  if (_stepIndex > 0) {
                    setState(() {
                      _stepIndex -= 1;
                    });
                  }
                },
                onStepContinue: () {
                  if (_stepIndex <= 0) {
                    setState(() {
                      _stepIndex += 1;
                    });
                  }
                },
                onStepTapped: (int index) {
                  setState(() {
                    _stepIndex = index;
                  });
                },
                steps: <Step>[
                  Step(
                    title: Text('Step 1 title'),
                    content: Container(
                      alignment: Alignment.topLeft,
                      child: Text('Content for Step 1')
                    ),
                  ),
                  Step(
                    title: Text('Step 1 title'),
                    content: Container(
                      alignment: Alignment.topLeft,
                      child: Text('Content for Step 1')
                    ),
                  ),
                  Step(
                    title: Text('Step 1 title'),
                    content: Container(
                      alignment: Alignment.topLeft,
                      child: Text('Content for Step 1')
                    ),
                  ),
                  Step(
                    title: Text('Step 1 title'),
                    content: Container(
                      alignment: Alignment.topLeft,
                      child: Text('Content for Step 1')
                    ),
                  ),
                  Step(
                    title: Text('Step 1 title'),
                    content: Container(
                      alignment: Alignment.topLeft,
                      child: Text('Content for Step 1')
                    ),
                  ),
                  Step(
                    title: Text('Step 1 title'),
                    content: Container(
                      alignment: Alignment.topLeft,
                      child: Text('Content for Step 1')
                    ),
                  ),
                  Step(
                    title: Text('Step 1 title'),
                    content: Container(
                      alignment: Alignment.topLeft,
                      child: Text('Content for Step 1')
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),


        SizedBox(
          height: 200,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ListTile( 
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 22),
                  title: Text('Upcoming', style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ))
                ),
                Divider(height: 1, thickness: 0.04, color: Color(0xff000000)),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 22, horizontal: 22),
                    child: Text('You have no upcoming events')
                  ),
                )
              ],
            ),
          ),
        ),


      ],
    );
  }
}