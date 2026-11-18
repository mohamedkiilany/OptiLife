import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'onboarding_progress.dart'; 

class OnboardingHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double progressValue;
  final VoidCallback? onSkipPressed;
  final VoidCallback? onProfilePressed;
  final VoidCallback? onBackPressed;

  const OnboardingHeader({
    super.key,
    required this.title,
    required this.progressValue,
    this.onSkipPressed,
    this.onProfilePressed,
    this.onBackPressed,
  });
@override
final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,  
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black, size: 26),
        onPressed: onBackPressed ?? () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        GestureDetector(
          onTap: onSkipPressed,
          child: const Center(
            child: Text(
              'Skip',
              style: TextStyle(
                color: Color(0xFF006A63),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: onProfilePressed,
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFF006A63),
              child: Icon(CupertinoIcons.person, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(15.0),
        child: OnboardingProgress(value: progressValue),
      ),
    );
  }
}