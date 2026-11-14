import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

Widget authFieldLabel(String title, [String trailing = '']) => Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(children: [
        Text(title, style: const TextStyle(color: AppColors.navy, fontSize: 16, fontWeight: FontWeight.w700)),
        const Spacer(),
        if (trailing.isNotEmpty)
          Text(trailing, style: const TextStyle(color: Color(0xFF00834A), fontWeight: FontWeight.w700)),
      ]),
    );

Widget authInputField({
  required TextEditingController controller,
  required String hint,
  required IconData icon,
  bool obscure = false,
  TextInputType? keyboardType,
  Widget? trailing,
  String? Function(String?)? validator,
  ValueChanged<String>? onChanged,
}) => TextFormField(
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
        border: _authBorder(),
        enabledBorder: _authBorder(),
        focusedBorder: _authBorder(const BorderSide(color: AppColors.primaryGreen)),
        errorBorder: _authBorder(const BorderSide(color: Colors.redAccent)),
      ),
    );

OutlineInputBorder _authBorder([BorderSide side = BorderSide.none]) =>
    OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: side);

Widget authBadge(String text, Color background, Color foreground) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(24)),
      child: Text(text, style: TextStyle(color: foreground, fontWeight: FontWeight.w700, fontSize: 13, letterSpacing: .3)),
    );

class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({super.key, required this.label, required this.onPressed});
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 68,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: AppColors.bgLight,
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          ),
          child: Text(label, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
        ),
      );
}
