import 'package:flutter/material.dart';

import 'settings_pages.dart';

class SettingsGrid extends StatefulWidget {
  SettingsGrid({Key? key}) : super(key: key);

  @override
  State<SettingsGrid> createState() => _SettingsGridState();
}

class _SettingsGridState extends State<SettingsGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 2,
      crossAxisSpacing: 30,
      mainAxisSpacing: 2,
      childAspectRatio: 1.2,
      padding: const EdgeInsets.only(top: 8, bottom: 5, left: 3, right: 3),
      children: [
        ...SettingsPages.values.map(
          (e) => GestureDetector(
            onTap: () {},
            child: Card(
              color: const Color(0xfffafbfd),
              elevation: 2.9,
              shadowColor: const Color(0x88fefefe),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Icon(e.icon, color: const Color(0xFF6c688b)),
                  const SizedBox(height: 18),
                  Text(e.title, style: const TextStyle(color: Color(0xFF6c688b))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}