import 'package:flutter/material.dart';
import 'package:optilife_app/features/wizard/widgets/choose_custom_duration.dart';

class ActivityMatchControls extends StatelessWidget {
  const ActivityMatchControls({
    super.key,
    required this.selectedTime,
    required this.selectedEnergy,
    required this.onTimeChanged,
    required this.onEnergyChanged,
    required this.onSurpriseMe,
  });

  final String selectedTime;
  final String selectedEnergy;
  final ValueChanged<String> onTimeChanged;
  final ValueChanged<String> onEnergyChanged;
  final VoidCallback onSurpriseMe;

  static const _green = Color(0xFF007333);
  static const _ink = Color(0xFF182238);
  static const _muted = Color(0xFF687568);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.access_time, size: 14, color: _green),
            const SizedBox(width: 5),
            const Text(
              'AVAILABLE TIME',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: _ink,
                letterSpacing: .3,
              ),
            ),
            const Spacer(),
            ChooseCustomDuration(
              selectedTime: selectedTime,
              onChanged: onTimeChanged,
            ),
          ],
        ),
        Row(
          children: ['10', '20', '30', '45+']
              .map(
                (time) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: time == '45+' ? 0 : 8),
                    child: _TimeOption(
                      label: time,
                      selected: selectedTime == time,
                      onTap: () => onTimeChanged(time),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        if (!['10', '20', '30', '45+'].contains(selectedTime)) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                width: 80,
                child: _TimeOption(
                  label: selectedTime,
                  selected: true,
                  onTap: () => onTimeChanged(selectedTime),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Custom time selected',
                style: TextStyle(fontSize: 11, color: _muted),
              ),
            ],
          ),
        ],
        const SizedBox(height: 8),
        const Row(
          children: [
            Icon(Icons.access_time, size: 12, color: _muted),
            SizedBox(width: 4),
            Text(
              'You can change this anytime today.',
              style: TextStyle(fontSize: 12, color: _muted),
            ),
          ],
        ),
        const SizedBox(height: 18),
        const Row(
          children: [
            Icon(Icons.battery_charging_full, size: 14, color: _green),
            SizedBox(width: 5),
            Text(
              'CURRENT ENERGY LEVEL',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: _ink,
                letterSpacing: .3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 9),
        _EnergyOption(
          icon: Icons.battery_1_bar,
          title: 'Low Energy',
          detail: 'Gentle mobility & core restore',
          selected: selectedEnergy == 'low',
          onTap: () => onEnergyChanged('low'),
        ),
        const SizedBox(height: 7),
        _EnergyOption(
          icon: Icons.bolt,
          title: 'Normal',
          detail: 'Moderate cardio & dynamic flow',
          selected: selectedEnergy == 'normal',
          optimal: true,
          onTap: () => onEnergyChanged('normal'),
        ),
        const SizedBox(height: 7),
        _EnergyOption(
          icon: Icons.battery_full,
          title: 'High Energy',
          detail: 'HIIT intervals & peak power',
          selected: selectedEnergy == 'high',
          onTap: () => onEnergyChanged('high'),
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: double.infinity,
          height: 44,
          child: FilledButton.icon(
            onPressed: onSurpriseMe,
            icon: const Icon(Icons.auto_awesome, size: 17),
            label: const Text('Surprise Me'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFEDEEFF),
              foregroundColor: _green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TimeOption extends StatelessWidget {
  const _TimeOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: selected ? const Color(0xFF007333) : const Color(0xFFF0F1FC),
    borderRadius: BorderRadius.circular(30),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: SizedBox(
        height: 46,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selected)
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.check, color: Colors.white, size: 14),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: selected ? Colors.white : const Color(0xFF182238),
                  ),
                ),
                Text(
                  'min',
                  style: TextStyle(
                    fontSize: 10,
                    color: selected
                        ? Colors.white70
                        : const Color(0xFF687568),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class _EnergyOption extends StatelessWidget {
  const _EnergyOption({
    required this.icon,
    required this.title,
    required this.detail,
    required this.selected,
    required this.onTap,
    this.optimal = false,
  });

  final IconData icon;
  final String title;
  final String detail;
  final bool selected;
  final bool optimal;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: selected ? const Color(0xFFE6E9EF) : Colors.transparent,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0A192333),
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: title == 'Normal'
                    ? const Color(0xFFD9F8F5)
                    : const Color(0xFFEEF0FF),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(icon, color: const Color(0xFF182238), size: 20),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF182238),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (optimal) ...[
                        const SizedBox(width: 7),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD5F5EF),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: const Text(
                            'Optimal',
                            style: TextStyle(
                              fontSize: 9,
                              color: Color(0xFF00796B),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  Text(
                    detail,
                    style: const TextStyle(
                      color: Color(0xFF687568),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.check_circle : Icons.circle,
              color: selected
                  ? const Color(0xFF007333)
                  : const Color(0xFFE9ECFF),
              size: 18,
            ),
          ],
        ),
      ),
    ),
  );
}
