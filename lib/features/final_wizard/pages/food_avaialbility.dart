import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/final_wizard/cubit/search_cubit.dart';
import 'package:optilife_app/features/final_wizard/cubit/selection_cubit.dart';
import 'package:optilife_app/features/final_wizard/widgets/category_chips.dart';
import 'package:optilife_app/features/final_wizard/widgets/ingredient_list.dart';
import 'package:optilife_app/features/final_wizard/widgets/no_stress_card.dart';
import 'package:optilife_app/features/final_wizard/widgets/search_bar.dart';
import 'package:optilife_app/features/final_wizard/widgets/selection_summary.dart';
import 'package:optilife_app/features/progress/presentation/widgets/progress_finish.dart';
import 'package:optilife_app/features/wizard/widgets/wizard_screen_chip.dart';

class FoodAvaialbility extends StatelessWidget {
  const FoodAvaialbility({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SearchCubit()),
        BlocProvider(create: (_) => SelectionCubit()),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F7FF),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.go(AppRouter.fitness),
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Step 8 Life Style Constraint',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const LinearProgressIndicator(
                value: 8 / 8,
                color: AppColors.primaryGreen,
                backgroundColor: AppColors.white,
                minHeight: 5,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const WizardScreenChip(
                            icon: Icons.kitchen_outlined,
                            text: 'PANTRY & INGREDIENT SYNC',
                          ),
                          const Text(
                            'Step 8 of 8',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        'What do you usually have in your kitchen?',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          height: 1.15,
                          color: AppColors.darkText,
                        ),
                      ),

                      const SizedBox(height: 8),
                      const Text(
                        'OptiLife builds meals around what you already buy and keep, slashing grocery costs.',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Container(
                        width: double.infinity,
                        height: 130,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'assets/images/Visual Delight Kitchen Micro-Hero.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const ColoredBox(
                                color: AppColors.screenchipBg,
                                child: Center(
                                  child: Icon(
                                    Icons.broken_image_outlined,
                                    color: AppColors.primaryGreen,
                                    size: 36,
                                  ),
                                ),
                              ),
                            ),
                            const IgnorePointer(
                              child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black54],
                                ),
                              ),
                              ),
                            ),
                            Positioned(
                              left: 12,
                              right: 12,
                              bottom: 12,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.eco_outlined,
                                    color: Color(0xFF20C765),
                                    size: 22,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: const Text(
                                      'Zero-waste personalized plan incoming',
                                      style: TextStyle(
                                        color: Color(0xffEEF0FF),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                      ),
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
                    ],
                  ),
                ),
              ),
              ProgressFinish(
                onPressed: () {
                  if (context.read<SelectionCubit>().state.category == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text('Please select at least one category.'),
                        backgroundColor: AppColors.primaryTeal,
                      ),
                    );
                    return;
                  }
                  context.go(AppRouter.home);
                },
              ),
            ],
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
    return IngredientSearchBar(onChanged: context.read<SearchCubit>().search);
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
      ingredients: filterIngredients(
        category: selection.category,
        query: query,
      ),
      selected: selection.selected,
      onToggle: context.read<SelectionCubit>().toggle,
    );
  }
}
