import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class DislikeSection extends StatefulWidget {
  const new({super.key});

  @override
  State<DislikeSection> createState() => _DislikeSectionState();
}

class _DislikeSectionState extends State<DislikeSection> {
  final List<String> _dislikedIngredients = [];

  final TextEditingController _ingredientController = TextEditingController();

   @override
  void dispose() {
    _ingredientController.dispose();
    super.dispose();
  }

  void _addIngredient() {
    final ingredient = _ingredientController.text.trim();
    if (ingredient.isEmpty ||
        _dislikedIngredients.any(
          (existing) => existing.toLowerCase() == ingredient.toLowerCase(),
        )) {
      return;
    }

    setState(() {
      _dislikedIngredients.add(ingredient);
      _ingredientController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
   return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Foods you dislike or avoid',
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text('Optional', style: TextStyle(color: AppColors.muted)),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "Ingredients you don't enjoy eating. We'll automatically replace them with equal macro swaps.",
            style: TextStyle(color: AppColors.muted, fontSize: 14),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _ingredientController,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _addIngredient(),
                  decoration: InputDecoration(
                    hintText: 'e.g. Cilantro, olives, mushrooms',
                    hintStyle: const TextStyle(fontSize: 14),
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: AppColors.backgroundColor,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _addIngredient,
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryTeal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_dislikedIngredients.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _dislikedIngredients.map((ingredient) {
                return Chip(
                  label: Text(ingredient),
                  onDeleted: () =>
                      setState(() => _dislikedIngredients.remove(ingredient)),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}