import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/wizard/widgets/dietary_preference_chip.dart';

class DitePreferenceSection extends StatefulWidget {
  const DitePreferenceSection({super.key, required this.onSelectionChanged});

  final ValueChanged<Set<String>> onSelectionChanged;

  static const _preferences = [
    '  ♧ No preference',
    '  🥩 Halal',
    '  💪 High protein',
    '  🥗 Vegetarian',
    ' 🥑 Low carb',
    ' 🌱 Vegan',
    ' 🥛 Dairy-free',
    '  🌾 Gluten-free',
    '  ⚠️ Nut allergy',
    '  🐟 Pescatarian',
  ];

  @override
  State<DitePreferenceSection> createState() => _DitePreferenceSectionState();
}

class _DitePreferenceSectionState extends State<DitePreferenceSection> {
  final Set<String> _selectedPreferences = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Select what fits you best',
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Multiple choice',
              style: TextStyle(color: AppColors.muted, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 6,
          runSpacing: 8,
          children: DitePreferenceSection._preferences.map((preference) {
            final selected = _selectedPreferences.contains(preference);
            return DietaryPreferenceChip(
              label: preference,
              isSelected: selected,
              onTap: () {
                setState(() {
                  if (selected) {
                    _selectedPreferences.remove(preference);
                  } else {
                    _selectedPreferences.add(preference);
                  }
                });
                widget.onSelectionChanged(
                  Set.unmodifiable(_selectedPreferences),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
