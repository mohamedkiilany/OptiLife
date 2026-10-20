import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hint,
    this.obscure = false,
    this.keyboardType,
    this.trailing,
    this.validator,
    this.onChanged,
  });

  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final bool obscure;
  final TextInputType? keyboardType;
  final Widget? trailing;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 17, color: AppColors.navy),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF788678)),
          prefixIcon: Icon(icon, color: const Color(0xFF718071)),
          suffixIcon: trailing,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          border: _border(),
          enabledBorder: _border(),
          focusedBorder: _border(const BorderSide(color: AppColors.primaryGreen)),
          errorBorder: _border(const BorderSide(color: Colors.redAccent)),
        ),
      );

  OutlineInputBorder _border([BorderSide side = BorderSide.none]) =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: side);
}
