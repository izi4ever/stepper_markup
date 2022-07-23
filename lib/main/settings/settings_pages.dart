import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'insurance/insurance.dart';
import 'membership/membership.dart';
import 'password/password.dart';
import 'programs/programs.dart';
import 'refer_friend/refer_friend.dart';

enum SettingsPages {
  password(
    icon: FontAwesomeIcons.lock,
    title: 'Password',
    body: Password(),
  ),
  membership(
    icon: FontAwesomeIcons.userCheck,
    title: 'Membership',
    body: Membership(),
  ),
  insurance(
    icon: FontAwesomeIcons.umbrella,
    title: 'Insurance',
    body: Insurance(),
  ),
  programs(
    icon: FontAwesomeIcons.hospitalUser,
    title: 'Programs',
    body: Programs(),
  ),
  referFriend(
    icon: FontAwesomeIcons.shareNodes,
    title: 'Refer a friend',
    body: ReferFriend(),
  );

  const SettingsPages({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final Widget body;
}