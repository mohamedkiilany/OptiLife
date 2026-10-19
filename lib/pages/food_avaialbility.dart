
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optilife_app/cubit/search_cubit.dart';
import 'package:optilife_app/cubit/selection_cubit.dart';
import 'package:optilife_app/widgets/category_chips.dart';
import 'package:optilife_app/widgets/custom_button.dart';
import 'package:optilife_app/widgets/no_stress_card.dart';
import 'package:optilife_app/widgets/onboarding_header.dart';
import 'package:optilife_app/widgets/onboarding_step_indicator.dart';
import 'package:optilife_app/widgets/search_bar.dart';
import 'package:optilife_app/widgets/selection_summary.dart';
import 'package:optilife_app/widgets/ingredient_list.dart';
 
class FoodAvaialbility extends StatelessWidget {
  const FoodAvaialbility({super.key});
 
  @override
  Widget build(BuildContext context) {
    const int step = 8;
 
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SearchCubit()),
        BlocProvider(create: (_) => SelectionCubit()),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F7FF),
        appBar: OnboardingHeader(
          title: 'Profile Setup Lifestyle Constraints',
          progressValue: step / 8,
          onSkipPressed: () {},
          onProfilePressed: () {},
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OnboardingStepIndicator(
                  step: step,
                  title: 'PANTRY & INGREDIENT SYNC',
                ),
 
                const SizedBox(height: 16),
 
                const Text(
                  'What do you usually have in your kitchen?',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    height: 1.15,
                    color: Color(0xFF192238),
                  ),
                ),
 
                const SizedBox(height: 8),
                const Text(
                  'OptiLife builds meals around what you already buy and keep, slashing grocery costs.',
                  style: TextStyle(
                    color: Color(0xFF3D4A3D),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
 
                const SizedBox(height: 18),
 
                Container(
                  width: double.infinity,
                  height: 128,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/Visual Delight Kitchen Micro-Hero.png',
                          fit: BoxFit.cover,
                        ),
                      ),
 
                      // Bottom Gradient
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black54,
                            ],
                          ),
                        ),
                      ),
 
                      // Image Label
                      const Positioned(
                        left: 12,
                        bottom: 12,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.eco_outlined,
                              color: Color(0xFF20C765),
                              size: 22,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Zero-waste personalized plan incoming',
                              style: TextStyle(
                                color: Color(0xffEEF0FF),
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
 
                const SizedBox(height: 16),
 
                // Ingredient picker
                const _SearchSection(),
                const SizedBox(height: 16),
                const _CategorySection(),
                const SizedBox(height: 16),
                const _SummarySection(),
                const SizedBox(height: 14),
                const _IngredientsSection(),
                const SizedBox(height: 32),
                NoStressCard(),
                const SizedBox(height: 30),
                CustomButton( onTap: () {  }, text: 'Finish & Generate My Plan', icon: 
                Icons.auto_awesome_outlined,),
              

              ],
            ),
          ),
        ),
      ),
    );
  }
}
 
class _SearchSection extends StatelessWidget {
  const _SearchSection();
 
  @override
  Widget build(BuildContext context) {
    return IngredientSearchBar(
      onChanged: context.read<SearchCubit>().search,
    );
  }
}
 
class _CategorySection extends StatelessWidget {
  const _CategorySection();
 
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SelectionCubit>().state;
    return CategoryChips(
      selected: state.category,
      onChanged: context.read<SelectionCubit>().selectCategory,
    );
  }
}
 
class _SummarySection extends StatelessWidget {
  const _SummarySection();
 
  @override
Widget build(BuildContext context) {
  final state = context.watch<SelectionCubit>().state;
  return SelectionSummary(
    count: state.selected.length,
    estimatedSavings: state.calculateSavings(),
  );
}
}
 
class _IngredientsSection extends StatelessWidget {
  const _IngredientsSection();
 
  @override
  Widget build(BuildContext context) {
    final query = context.watch<SearchCubit>().state;
    final selection = context.watch<SelectionCubit>().state;
 
    return IngredientList(
      ingredients: filterIngredients(category: selection.category, query: query),
      selected: selection.selected,
      onToggle: context.read<SelectionCubit>().toggle,
    );
  }
}