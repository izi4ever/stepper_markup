import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


enum StepperState {                 // passed, current, future;
  passed (icon: Icon(FontAwesomeIcons.solidCircleCheck, size: 16, color: Colors.lightGreen)),
  current(icon: Icon(FontAwesomeIcons.circle, size: 20)),
  future (icon: Icon(Icons.radio_button_unchecked, size: 18));

  const StepperState({
    required this.icon,
  });

  final Icon icon;
}


enum StepperElement {               // login, create, complete;
  login(   title: 'Login to platform',                subtitle: 'Subtitle for Login to platform'),
  create(  title: 'Create your profile',              subtitle: 'Fields to fill in: contact and emergency info, primary care provider'),
  complete(title: 'Complete required questionnaires', subtitle: 'Subtitle for Complete required questionnaires');

  const StepperElement({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
}