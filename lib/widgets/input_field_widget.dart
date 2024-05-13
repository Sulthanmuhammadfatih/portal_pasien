import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget(
      {super.key,
      required this.controller,
      required this.text,
      required this.textInputType,
      // required this.label,
      this.validator,
      required this.obscure});

  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;
  final FormFieldValidator<String>? validator;
  // final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        hintText: text,
        // labelText: label,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.black12),
        ),
      ),
    );
  }
}
