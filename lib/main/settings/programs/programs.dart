import 'package:flutter/material.dart';

import '../../../theme/tpl_page_body_padding.dart';

class Programs extends StatefulWidget {
  const Programs({Key? key}) : super(key: key);

  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programs'),
        centerTitle: true,
      ),
      body: PageBodyPadding(
        children: const [
          Text('Programs'),
        ]
      ),
    );
  }
}