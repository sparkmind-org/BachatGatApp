import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.blue[400]!,
              width: 2,
            ),
          ),
          prefixIcon: Icon(prefixIcon, color: Colors.grey[600]),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: Colors.grey[600])
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}