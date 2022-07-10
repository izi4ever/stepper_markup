import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stepper_markup/main/pages/home_page.dart';
import 'package:stepper_markup/main/pages/page_1.dart';
import 'package:stepper_markup/main/pages/page_2.dart';

enum TabBarItem  {
  home(icon: FontAwesomeIcons.house, title: 'Home', body: HomePage()),
  two(icon: FontAwesomeIcons.solidCircleQuestion, title: 'Two', body: Page1()),
  three(icon: FontAwesomeIcons.solidCalendarCheck, title: 'Three', body: Page2());

  const TabBarItem({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final Widget body;
}