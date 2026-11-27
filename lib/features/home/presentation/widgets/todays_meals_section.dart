import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optilife_app/core/constants/test_data.dart';
import 'package:optilife_app/core/models/meal.dart';
import 'package:optilife_app/core/models/meal_plan.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/home/presentation/pages/meal_details_page.dart';
import 'package:optilife_app/features/home/presentation/widgets/meal_card.dart';
import 'package:optilife_app/core/services/plan/user_plan_cubit.dart';
import 'package:optilife_app/core/services/plan/user_plan_state.dart';

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
          child: BlocBuilder<UserPlanCubit, UserPlanState>(
            builder: (context, state) {
              MealPlan mealPlan = state.plan!.mealPlan;
              List<Meal> meals = [mealPlan.breakfast,mealPlan.lunch , mealPlan.snack,mealPlan.dinner];
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10,),
                scrollDirection: Axis.horizontal,
                itemCount: meals.length,
                itemBuilder: (BuildContext context, int index) {
                  return MealCard(
                    imagePath: 'assets/images/tuna_chickpea.png',
                    mealType: meals[index].type.name,
                    title: meals[index].name,
                    minutes: meals[index].prepMinutes,
                    calories: meals[index].calories,
                    onDetailsTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) =>  MealDetailsPage(meal: meals[index],
                        ),
                      ),
                    ),
                  ) ;
                },
              );
              
            },
          ),
        ),
      ],
    );
  }
}
