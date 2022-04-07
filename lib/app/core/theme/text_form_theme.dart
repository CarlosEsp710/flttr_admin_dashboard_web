import 'package:flutter/material.dart';

class WebTextFormField {
  InputDecoration inputDecoration({
    required String label,
    required String hint,
    required IconData icon,
    Color color = Colors.white,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }
}
