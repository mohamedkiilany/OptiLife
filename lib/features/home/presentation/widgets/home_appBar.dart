import 'package:flutter/material.dart';
import 'package:optilife_app/features/home/presentation/widgets/profile-avatar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leadingWidth: 50,
      leading: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: Image(
          image: AssetImage('assets/images/optiLife_brand_logo.png'),
          width: 34,
          height: 34,
        ),
      ),
      title: const Text(
        'OptiLife',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ProfileAvatar(),
        ),
      ],
    );
  }
}