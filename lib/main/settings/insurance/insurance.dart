import 'package:flutter/material.dart';

import '../../../theme/tpl_page_body_padding.dart';

class Insurance extends StatefulWidget {
  const Insurance({Key? key}) : super(key: key);

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurance'),
        centerTitle: true,
      ),
      body: PageBodyPadding(
        children: const [
          Text('Insurance'),
        ]
      ),
    );
  }
}