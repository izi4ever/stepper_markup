import 'package:flutter/material.dart';

import '../../../theme/tpl_page_body_padding.dart';

class ReferFriend extends StatefulWidget {
  const ReferFriend({Key? key}) : super(key: key);

  @override
  State<ReferFriend> createState() => _ReferFriendState();
}

class _ReferFriendState extends State<ReferFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refer a friend'),
        centerTitle: true,
      ),
      body: PageBodyPadding(
        children: const [
          Text('Refer a friend'),
        ]
      ),
    );
  }
}