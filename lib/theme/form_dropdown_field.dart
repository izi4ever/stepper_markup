import 'package:flutter/material.dart';

class FormDropdownField extends StatefulWidget {
  FormDropdownField({
    Key? key,
    this.hintText,
    required this.items,
    required this.onChanged,
    this.value,
  }) : super(key: key);

  String? hintText;
  List<DropdownMenuItem<Object>>? items;
  void Function(Object?)? onChanged;
  Object? value;

  @override
  State<FormDropdownField> createState() => _FormDropdownFieldState();
}

class _FormDropdownFieldState extends State<FormDropdownField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
          ),
        ),
        items: widget.items, 
        onChanged: widget.onChanged,
        value: widget.value,
      ),
    );
  }
}