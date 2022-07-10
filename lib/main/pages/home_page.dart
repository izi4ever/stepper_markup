import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/custom_stepper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
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
        Card(
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
        ),


        SizedBox(
          height: 300,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const ListTile( 
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 22),
                  title: Text('Upcoming', style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ))
                ),
                const Divider(height: 1, thickness: 0.04, color:  Color(0xff000000)),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
                    child: const Text('You have no upcoming events')
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