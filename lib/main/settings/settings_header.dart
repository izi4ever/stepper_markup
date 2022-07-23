import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsHeader extends StatefulWidget {
  SettingsHeader({Key? key}) : super(key: key);

  @override
  State<SettingsHeader> createState() => _SettingsHeaderState();
}

class _SettingsHeaderState extends State<SettingsHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pinimg.com/564x/1c/6d/50/1c6d50321c3ccd49565d6446789797fb.jpg'),
                  radius: 25,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Anna Write',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      Text(
                        'See profile',
                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.2,
                        ),
                      )
                    ]
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        TextButton.icon(
          style: TextButton.styleFrom(
            primary: Colors.grey,
          ),
          onPressed: () {}, 
          // icon: Icon(Icons.exit_to_app_rounded), 
          icon: const Icon(
            FontAwesomeIcons.arrowRightFromBracket,
            size: 16,
          ), 
          label: const Text('Logout'),
        ),
      ],
    );
  }
}