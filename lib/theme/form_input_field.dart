import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInputField extends StatefulWidget {
  FormInputField({
    Key? key,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.obscureText = false,
  }) : super(key: key);

  String hintText;
  TextEditingController? controller;
  FocusNode? focusNode;
  TextInputType? keyboardType;
  int? maxLines;
  int? minLines;
  int? maxLength;
  void Function(String)? onChanged;
  void Function()? onTap;
  void Function()? onEditingComplete;
  void Function(String)? onFieldSubmitted;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;
  bool? enabled;
  bool obscureText;

  @override
  State<FormInputField> createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<FormInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: SizedBox(
        height: 44,
        child: TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}