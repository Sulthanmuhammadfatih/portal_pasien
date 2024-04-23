import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  const EditText(
      {Key? key,
      required this.controller,
      required this.text,
      required this.textInputType,
      // required this.label,
      this.validator,
      required this.obsecure})
      : super(key: key);

  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obsecure;
  final FormFieldValidator<String>? validator;
  // final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obsecure,
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