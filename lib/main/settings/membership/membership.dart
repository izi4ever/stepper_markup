import 'package:flutter/material.dart';

import '../../../theme/tpl_page_body_padding.dart';

class Membership extends StatefulWidget {
  const Membership({Key? key}) : super(key: key);

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership'),
        centerTitle: true,
      ),
      body: PageBodyPadding(
        children: const [
          Text('Membership'),
        ]
      ),
    );
  }
}