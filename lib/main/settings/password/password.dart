import 'package:flutter/material.dart';
import 'package:stepper_markup/theme/tpl_page_body_padding.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => PpasswordState();
}

class PpasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password'),
        centerTitle: true,
      ),
      body: PageBodyPadding(
        children: const [
          Text('Password'),
        ]
      ),
    );
  }
}