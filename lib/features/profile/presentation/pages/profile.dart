import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/profile/presentation/widgets/action_row.dart';
import 'package:optilife_app/features/profile/presentation/widgets/profile_item.dart';
import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';
import 'package:optilife_app/features/wizard/cubit/selection_state.dart';
import 'package:optilife_app/features/progress/data/progress_options.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<SelectionCubit, SelectionState>(
          builder: (context, state) {
            final name = state.name?.isNotEmpty == true
                ? state.name!
                : 'Your profile';
            final goal = state.goal ?? 'Choose a goal in your plan setup';
            final minutes = state.availableMinutes;
            final selectedDiet = state.dietPreferences.toList();
            final items = <ProfileItem>[
              ProfileItem(
                Icons.schedule,
                'TIME',
                minutes == null ? 'Not set yet' : '$minutes minutes a day',
              ),
              ProfileItem(
                Icons.place_outlined,
                'LOCATION',
                state.environments.isEmpty
                    ? 'Not set yet'
                    : state.environments.join(', '),
              ),
              ProfileItem(
                Icons.fitness_center,
                'EQUIPMENT',
                state.equipment ?? 'Not set yet',
              ),
              ProfileItem(
                Icons.savings_outlined,
                'BUDGET',
                state.budget ?? 'Not set yet',
              ),
              ProfileItem(
                Icons.eco_outlined,
                'DIET',
                selectedDiet.isEmpty ? 'Not set yet' : selectedDiet.join(', '),
              ),
              ProfileItem(
                Icons.block_outlined,
                'DISLIKES & ALLERGIES',
                state.dislikedFoods.isEmpty
                    ? 'None added'
                    : state.dislikedFoods.join(', '),
              ),
              ProfileItem(
                Icons.monitor_heart_outlined,
                'BASELINE',
                state.fitnessLevel ?? 'Not set yet',
              ),
            ];
            return ListView(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
              children: [
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.white, Color(0xFFEAF9F1)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 31,
                            backgroundColor: Color(0xFFD4F5E2),
                            child: Icon(
                              Icons.person,
                              color: AppColors.darkGreen,
                              size: 34,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.navy,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  state.email ?? 'Add your email',
                                  style: const TextStyle(
                                    color: AppColors.muted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () => _editName(context, name),
                            icon: const Icon(
                              Icons.edit_outlined,
                              color: AppColors.darkText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F1FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '◎  $goal',
                          style: const TextStyle(
                            color: AppColors.darkGreen,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: AppColors.primaryGreen,
                            size: 10,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'OptiLife Free Blueprint • Active',
                              style: TextStyle(
                                color: AppColors.muted,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            'Upgrade',
                            style: TextStyle(
                              color: AppColors.primaryTeal,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.badge,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.spa, color: AppColors.darkGreen),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Your plan adapts to your schedule, space, equipment, and food preferences.',
                          style: TextStyle(
                            color: AppColors.navy,
                            fontWeight: FontWeight.w600,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  decoration: BoxDecoration(
                    color: AppColors.textWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.tune, color: AppColors.primaryTeal),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Current Lifestyle Constraints',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: AppColors.darkText,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => _editConstraints(context, state),
                            child: const Text(
                              'Edit All',
                              style: TextStyle(
                                color: AppColors.primaryTeal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Your plan is dynamically generated around these choices.',
                        style: TextStyle(color: AppColors.muted),
                      ),
                      const SizedBox(height: 8),
                      ...items.map((item) => ConstraintRow(item: item)),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.textWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Preferences & Support',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: AppColors.darkText,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ActionRow(
                        icon: Icons.settings_outlined,
                        title: 'Settings & Preferences',
                        subtitle: 'Units, theme, notifications',
                      ),
                      ActionRow(
                        icon: Icons.notifications_none,
                        title: 'Reminders & Nudges',
                        subtitle: 'Workout and meal reminders',
                      ),
                      ActionRow(
                        icon: Icons.cloud_sync_outlined,
                        title: 'Offline Data & Backup',
                        subtitle: 'Your plan is available on this device',
                      ),
                      ActionRow(
                        icon: Icons.support_agent,
                        title: 'Help & Coaching Support',
                        subtitle: 'Guidance for your wellness plan',
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.logout, color: Colors.red),
                          label: const Text(
                            'Log Out',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFFFFF2F1),
                            padding: const EdgeInsets.all(14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                const Center(
                  child: Text(
                    '♧ OptiLife v2.4  •  0% Guilt Engine\n\nDesigned to adapt to real life, every day',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.muted,
                      height: 1.35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  static Future<void> _editName(
    BuildContext context,
    String currentName,
  ) async {
    final controller = TextEditingController(
      text: currentName == 'Your profile' ? '' : currentName,
    );
    final name = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit your name'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'Full name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(dialogContext, controller.text.trim()),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    controller.dispose();
    if (name != null && name.isNotEmpty && context.mounted) {
      final state = context.read<SelectionCubit>().state;
      context.read<SelectionCubit>().setAccount(
        name: name,
        email: state.email ?? '',
      );
    }
  }

  static Future<void> _editConstraints(
    BuildContext context,
    SelectionState initial,
  ) async {
    const locations = ['Home / Apartment', 'Commercial Gym', 'Outdoors & Parks'];
    const equipmentOptions = [
      'None (Bodyweight Only)',
      'Dumbbells / Kettlebells',
      'Resistance Bands',
      'Full Gym Equipment',
    ];
    const budgets = [
      'Budget-Conscious',
      'Moderate & Flexible',
      'Premium / Organic',
    ];
    const fitnessLevels = ['beginner', 'intermediate', 'advanced'];
    final dislikeController = TextEditingController(
      text: initial.dislikedFoods.join(', '),
    );
    final dietController = TextEditingController(
      text: initial.dietPreferences.join(', '),
    );
    var selectedGoal = initial.goal ?? goalOptions.first.title;
    var selectedMinutes = initial.availableMinutes ?? 20;
    var selectedEquipment = initial.equipment ?? equipmentOptions.first;
    var selectedBudget = initial.budget ?? budgets.first;
    var selectedFitness = initial.fitnessLevel ?? fitnessLevels.first;
    var selectedLocations = Set<String>.of(initial.environments);

    final saved = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Edit lifestyle constraints'),
          content: SizedBox(
            width: 440,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _editorLabel('Wellness goal'),
                  DropdownButtonFormField<String>(
                    initialValue: selectedGoal,
                    isExpanded: true,
                    items: goalOptions.map((option) => DropdownMenuItem(value: option.title, child: Text(option.title))).toList(),
                    onChanged: (value) => setDialogState(() => selectedGoal = value!),
                  ),
                  _editorLabel('Time available each day'),
                  DropdownButtonFormField<int>(
                    value: selectedMinutes,
                    items: const [10, 20, 30, 45].map((minutes) => DropdownMenuItem(value: minutes, child: Text(minutes == 45 ? '45+ minutes' : '$minutes minutes'))).toList(),
                    onChanged: (value) => setDialogState(() => selectedMinutes = value!),
                  ),
                  _editorLabel('Workout locations'),
                  ...locations.map((location) => CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(location),
                    value: selectedLocations.contains(location),
                    onChanged: (checked) => setDialogState(() {
                      if (checked == true) {
                        selectedLocations.add(location);
                      } else {
                        selectedLocations.remove(location);
                      }
                    }),
                  )),
                  _editorLabel('Equipment'),
                  DropdownButtonFormField<String>(
                    value: selectedEquipment,
                    isExpanded: true,
                    items: equipmentOptions.map((value) => DropdownMenuItem(value: value, child: Text(value))).toList(),
                    onChanged: (value) => setDialogState(() => selectedEquipment = value!),
                  ),
                  _editorLabel('Food budget'),
                  DropdownButtonFormField<String>(
                    value: selectedBudget,
                    isExpanded: true,
                    items: budgets.map((value) => DropdownMenuItem(value: value, child: Text(value))).toList(),
                    onChanged: (value) => setDialogState(() => selectedBudget = value!),
                  ),
                  _editorLabel('Dietary preferences (comma separated)'),
                  TextField(controller: dietController, decoration: const InputDecoration(hintText: 'Halal, High protein')),
                  _editorLabel('Foods to avoid (comma separated)'),
                  TextField(controller: dislikeController, decoration: const InputDecoration(hintText: 'Cilantro, eggplant')),
                  _editorLabel('Fitness baseline'),
                  DropdownButtonFormField<String>(
                    value: selectedFitness,
                    items: fitnessLevels.map((value) => DropdownMenuItem(value: value, child: Text(value[0].toUpperCase() + value.substring(1)))).toList(),
                    onChanged: (value) => setDialogState(() => selectedFitness = value!),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Cancel')),
            FilledButton(onPressed: () => Navigator.pop(dialogContext, true), child: const Text('Save changes')),
          ],
        ),
      ),
    );

    if (saved == true && context.mounted) {
      final cubit = context.read<SelectionCubit>();
      cubit
        ..setGoal(selectedGoal)
        ..setAvailableMinutes(selectedMinutes)
        ..setEnvironments(selectedLocations)
        ..setEquipment(selectedEquipment)
        ..setBudget(selectedBudget)
        ..setDietPreferences(_splitValues(dietController.text))
        ..setDislikedFoods(_splitValues(dislikeController.text))
        ..setFitnessLevel(selectedFitness);
    }
    dislikeController.dispose();
    dietController.dispose();
  }

  static Widget _editorLabel(String text) => Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 4),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
  );

  static Set<String> _splitValues(String value) => value
      .split(',')
      .map((item) => item.trim())
      .where((item) => item.isNotEmpty)
      .toSet();
}
