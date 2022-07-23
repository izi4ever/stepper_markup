import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stepper_markup/main/settings/settings_grid.dart';
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
              SettingsGrid(),
            ],
          ),
        ),
      ]
    );
  }
}