import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/notifications/reminder_notifications.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _morningWorkout = false;
  bool _mealPrep = false;
  bool _hydration = false;
  bool _streakWarning = false;
  bool _deleting = false;

  User? get _user => FirebaseAuth.instance.currentUser;

  static const _reminderKeys = {
    'morningWorkout': 'reminder_morning_workout',
    'mealPrep': 'reminder_meal_prep',
    'hydration': 'reminder_hydration',
    'streakWarning': 'reminder_streak_warning',
  };

  @override
  void initState() {
    super.initState();
    _loadReminderSettings();
  }

  Future<void> _loadReminderSettings() async {
    final prefs = SharedPreferencesAsync();
    final values = await Future.wait(
      _reminderKeys.values.map(
        (key) async => await prefs.getBool(key) ?? false,
      ),
    );
    if (!mounted) return;
    setState(() {
      _morningWorkout = values[0];
      _mealPrep = values[1];
      _hydration = values[2];
      _streakWarning = values[3];
    });
  }

  Future<void> _setReminder({
    required String preferenceKey,
    required bool enabled,
    required Future<void> Function(bool enabled) schedule,
    required void Function(bool enabled) updateState,
  }) async {
    try {
      if (enabled && !await ReminderNotifications.requestPermission()) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Allow notifications to turn on reminders.'),
            ),
          );
        }
        return;
      }
      await schedule(enabled);
      await SharedPreferencesAsync().setBool(preferenceKey, enabled);
      if (mounted) setState(() => updateState(enabled));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not update this reminder. Please try again.'),
        ),
      );
    }
  }

  Future<void> _deleteAccount() async {
    final user = _user;
    if (user == null || _deleting) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.warning_amber_rounded, color: Colors.red),
        title: const Text('Delete your account?'),
        content: const Text(
          'This permanently deletes your OptiLife account and profile data. '
          'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red.shade700),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Delete account'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    setState(() => _deleting = true);
    try {
      // Firebase Auth requires a recent sign-in for this operation.
      await user.delete();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .delete();
      if (!mounted) return;
      context.go(AppRouter.signin);
    } on FirebaseAuthException catch (error) {
      if (!mounted) return;
      final message = error.code == 'requires-recent-login'
          ? 'Please sign out, sign in again, then retry account deletion.'
          : 'Could not delete the account. Please try again.';
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account deleted, but profile cleanup failed.'),
        ),
      );
    } finally {
      if (mounted) setState(() => _deleting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _user;
    final name = user?.displayName?.trim().isNotEmpty == true
        ? user!.displayName!.trim()
        : 'OptiLife member';
    final email = user?.email ?? 'No email available';
    final initials = name == 'OptiLife member'
        ? 'O'
        : name
              .split(RegExp(r'\s+'))
              .take(2)
              .map((part) => part[0])
              .join()
              .toUpperCase();

    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        backgroundColor: AppColors.bgLight,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          tooltip: 'Back to profile',
          onPressed: () => context.go(AppRouter.main),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.darkGreen, AppColors.primaryTeal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white.withValues(alpha: .18),
                    child: Text(
                      initials,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          email,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: .82),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.eco_rounded, color: Colors.white70),
                ],
              ),
            ),
            const SizedBox(height: 26),
            _SectionTitle(
              title: 'ACCOUNT & SECURITY',
              icon: Icons.shield_outlined,
            ),
            _SettingsCard(
              children: [
                _InfoTile(
                  icon: Icons.email_outlined,
                  title: 'Email address',
                  subtitle: email,
                ),
                const _Divider(),
                _InfoTile(
                  icon: Icons.lock_outline_rounded,
                  title: 'Password',
                  subtitle: 'Managed securely by Firebase',
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionTitle(title: 'APP PREFERENCES', icon: Icons.tune_rounded),
            _SettingsCard(
              children: [
                const _InfoTile(
                  icon: Icons.straighten_rounded,
                  title: 'Units of measure',
                  subtitle: 'Metric (kg, cm)',
                ),
                const _Divider(),
                const _InfoTile(
                  icon: Icons.language_rounded,
                  title: 'Language',
                  subtitle: 'English',
                ),
                const _Divider(),
                const _InfoTile(
                  icon: Icons.calendar_month_outlined,
                  title: 'Start of week',
                  subtitle: 'Monday',
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionTitle(
              title: 'REMINDERS',
              icon: Icons.notifications_none_rounded,
            ),
            _SettingsCard(
              children: [
                _SwitchTile(
                  title: 'Morning workout',
                  subtitle: 'Daily at 7:00 AM',
                  value: _morningWorkout,
                  onChanged: (v) => _setReminder(
                    preferenceKey: _reminderKeys['morningWorkout']!,
                    enabled: v,
                    schedule: (enabled) =>
                        ReminderNotifications.setDailyReminder(
                          id: 100,
                          title: 'Move your body',
                          body:
                              'A little movement is a great start to your day.',
                          hour: 7,
                          minute: 0,
                          enabled: enabled,
                        ),
                    updateState: (enabled) => _morningWorkout = enabled,
                  ),
                ),
                const _Divider(),
                _SwitchTile(
                  title: 'Meal prep',
                  subtitle: 'Daily at 5:30 PM',
                  value: _mealPrep,
                  onChanged: (v) => _setReminder(
                    preferenceKey: _reminderKeys['mealPrep']!,
                    enabled: v,
                    schedule: (enabled) =>
                        ReminderNotifications.setDailyReminder(
                          id: 101,
                          title: 'Plan your evening meal',
                          body: 'Take a few minutes to get dinner ready.',
                          hour: 17,
                          minute: 30,
                          enabled: enabled,
                        ),
                    updateState: (enabled) => _mealPrep = enabled,
                  ),
                ),
                const _Divider(),
                _SwitchTile(
                  title: 'Hydration nudges',
                  subtitle: 'Daily at 10 AM, 2 PM and 6 PM',
                  value: _hydration,
                  onChanged: (v) => _setReminder(
                    preferenceKey: _reminderKeys['hydration']!,
                    enabled: v,
                    schedule: ReminderNotifications.setHydrationReminders,
                    updateState: (enabled) => _hydration = enabled,
                  ),
                ),
                const _Divider(),
                _SwitchTile(
                  title: 'Streak reminder',
                  subtitle: 'Daily at 9:00 PM',
                  value: _streakWarning,
                  onChanged: (v) => _setReminder(
                    preferenceKey: _reminderKeys['streakWarning']!,
                    enabled: v,
                    schedule: (enabled) =>
                        ReminderNotifications.setDailyReminder(
                          id: 105,
                          title: 'Keep your streak going',
                          body:
                              'Take a moment to check in on today’s progress.',
                          hour: 21,
                          minute: 0,
                          enabled: enabled,
                        ),
                    updateState: (enabled) => _streakWarning = enabled,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionTitle(
              title: 'DANGER ZONE',
              icon: Icons.warning_amber_rounded,
              color: Colors.red.shade700,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: .045),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.red.withValues(alpha: .18)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Delete account',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Permanently remove your Firebase account and OptiLife profile.',
                    style: TextStyle(
                      color: AppColors.muted.withValues(alpha: .8),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: _deleting ? null : _deleteAccount,
                      icon: _deleting
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.delete_outline_rounded),
                      label: Text(
                        _deleting ? 'Deleting account…' : 'Delete account',
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red.shade700,
                        side: BorderSide(color: Colors.red.shade300),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.eco_outlined, size: 16, color: AppColors.darkGreen),
                SizedBox(width: 6),
                Text(
                  'SUSTAINABLE PROGRESS',
                  style: TextStyle(
                    color: AppColors.darkGreen,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'OptiLife · Built for sustainable real-world habits',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.muted.withValues(alpha: .7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.icon,
    this.color = AppColors.darkGreen,
  });
  final String title;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: .8,
          ),
        ),
      ],
    ),
  );
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) => Material(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
      side: BorderSide(color: AppColors.badge.withValues(alpha: .7)),
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(children: children),
  );
}

class _Divider extends StatelessWidget {
  const _Divider();
  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.only(left: 58),
    child: Divider(height: 1, thickness: 1, color: AppColors.bgLight),
  );
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
    leading: _TileIcon(icon: icon),
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.navy,
      ),
    ),
    subtitle: Text(
      subtitle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(color: AppColors.muted),
    ),
  );
}

class _TileIcon extends StatelessWidget {
  const _TileIcon({required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: 20,
    backgroundColor: AppColors.selectedCardIcon,
    child: Icon(icon, size: 19, color: AppColors.darkGreen),
  );
}

class _SwitchTile extends StatelessWidget {
  const _SwitchTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) => SwitchListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    activeTrackColor: AppColors.primaryGreen,
    value: value,
    onChanged: onChanged,
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.navy,
      ),
    ),
    subtitle: Text(subtitle, style: const TextStyle(color: AppColors.muted)),
  );
}
