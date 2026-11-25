
import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pages = [
      {
        'icon': Icons.home_outlined,
        'activeIcon': Icons.home,
        'title': 'Home',
      },
      {
        'icon': Icons.calendar_today_outlined,
        'activeIcon': Icons.calendar_today,
        'title': 'Plan',
      },
      {
        'icon': Icons.auto_awesome,
        'activeIcon': Icons.auto_awesome,
        'title': 'Assistant',
      },
      {
        'icon': Icons.trending_up,
        'activeIcon': Icons.trending_up,
        'title': 'Progress',
      },
      {
        'icon': Icons.person_outline,
        'activeIcon': Icons.person,
        'title': 'Profile',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 64,
            child: Row(
              children: List.generate(pages.length, (index) {
                bool isSelected = currentIndex == index;
                bool isCenter = index == 2;

                Color itemColor = isSelected
                    ? const Color(0xFF006E2F)
                    : const Color(0xFF6D7B6C);

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onTap(index);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: isCenter
                        ? Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: -22,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 56,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryGreen,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.darkGreen
                                                .withValues(alpha: 0.35),
                                            blurRadius: 10,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        pages[index]['icon'],
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      pages[index]['title'],
                                      style: TextStyle(
                                        color: AppColors.darkGreen,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isSelected
                                    ? pages[index]['activeIcon']
                                    : pages[index]['icon'],
                                color: itemColor,
                                size: 22,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                pages[index]['title'],
                                style: TextStyle(
                                  color: itemColor,
                                  fontSize: 11,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
