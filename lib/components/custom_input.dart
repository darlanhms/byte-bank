import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final TextStyle textStyle;
  final TextEditingController controller;

  CustomInput({
    this.hint,
    this.label,
    this.icon,
    this.keyboardType,
    this.textStyle,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        icon: icon != null ? Icon(icon) : null,
      ),
      keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
      style: textStyle,
    );
  }
}
