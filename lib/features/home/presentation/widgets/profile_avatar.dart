import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(AppRouter.profile);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.lightGreen, width: 4),
        ),
        child: Image.asset('assets/images/Profile.png'),
      ),
    );
  }
}
