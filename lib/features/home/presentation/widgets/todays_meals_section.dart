import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/home/presentation/widgets/meal_card.dart';

class TodaysMealsSection extends StatelessWidget {
  const TodaysMealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.restaurant, color: Color(0xFFEF9900)),
            SizedBox(width: 8),
            Text(
              "Today's Meals",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            Spacer(),
            Text(
              'Swap',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xFF006E2F),
              ),
            ),
            SizedBox(width: 6),
            Icon(Icons.swap_horiz, color: AppColors.darkGreen),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          'Prepared for low cost & quick prep',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            children: const [
              MealCard(
                imagePath: 'assets/images/greek_yogurt.png',
                mealType: 'Breakfast',
                title: 'Greek Yogurt Berry Bowl',
                minutes: 5,
                price: 1.80,
                calories: 340,
                tag: 'High Protein',
                selected: true,
              ),
              SizedBox(width: 14),
              MealCard(
                imagePath: 'assets/images/tuna_chickpea.png',
                mealType: 'Lunch',
                title: 'Tuna & Chickpea Salad',
                minutes: 10,
                price: 2.40,
                calories: 420,
                tag: 'Budget Friendly',
              ),
            ],
          ),
        ),
      ],
    );
  }
}