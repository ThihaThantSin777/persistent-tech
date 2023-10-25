import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.onChanged,
      this.textInputType = TextInputType.name});

  final String hintText;
  final IconData prefixIcon;
  final Function(String) onChanged;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: textInputType,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: hintText,
          prefixIcon: Icon(prefixIcon)),
    );
  }
}
