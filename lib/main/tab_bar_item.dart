import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TabBarItem  {
  home(icon: FontAwesomeIcons.house, title: 'Home'),
  two(icon: FontAwesomeIcons.solidCircleQuestion, title: 'Two'),
  three(icon: FontAwesomeIcons.solidCalendarCheck, title: 'Three');

  const TabBarItem({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;
}