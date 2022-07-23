import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stepper_markup/main/settings/settings_header.dart';
import 'package:stepper_markup/main/settings/settings_pages.dart';
import 'package:stepper_markup/theme/tpl_card_default.dart';
import 'package:stepper_markup/theme/tpl_page_body_padding.dart';

import '../header.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return PageBodyPadding(
      children: [
        Header(),
        CardDefault(
          title: 'Settings', 
          child: Column(
            children: [
              SettingsHeader(),
              const SizedBox(height: 22),
              const Divider(height: 1, thickness: 0.04, color:  Color(0xff000000)),
              GridView.count(
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
              ),
            ],
          ),
        ),
      ]
    );
  }
}