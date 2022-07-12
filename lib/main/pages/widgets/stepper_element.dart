import 'package:flutter/material.dart';

enum StepperElement {
  login(   title: Text('Login to platform'),                subtitle: Text('Subtitle for Login to platform')),
  create(  title: Text('Create your profile'),              subtitle: Text('Fields to fill in: contact and emergency info, primary care provider')),
  complete(title: Text('Complete required questionnaires'), subtitle: Text('Subtitle for Complete required questionnaires'));

  const StepperElement({
    required this.title,
    this.subtitle,
  });

  final Text title;
  final Text? subtitle;
}