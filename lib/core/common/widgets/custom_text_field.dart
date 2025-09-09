import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChanged, // hook it here
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(62)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(62),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(62),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(62),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(62),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
