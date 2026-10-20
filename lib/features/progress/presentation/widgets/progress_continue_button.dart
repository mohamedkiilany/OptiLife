import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class ProgressContinueButton extends StatelessWidget {
  const ProgressContinueButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 58,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: Text('Continue', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ),
      );
}
