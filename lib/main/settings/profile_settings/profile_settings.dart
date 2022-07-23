import 'package:flutter/material.dart';

import '../../../theme/tpl_page_body_padding.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your profile'),
        centerTitle: true,
      ),
      body: PageBodyPadding(
        children: const [
          Text('Your profile'),
        ]
      ),
    );
  }
}