import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

/// Lets the user enter a workout duration that is not one of the presets.
class ChooseCustomDuration extends StatelessWidget {
  const ChooseCustomDuration({
    super.key,
    required this.selectedTime,
    required this.onChanged,
  });

  final String selectedTime;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<void>(
        context: context,
        builder: (dialogContext) => _CustomDurationDialog(
          selectedTime: selectedTime,
          onChanged: onChanged,
        ),
      ),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkGreen,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Text(
        'Custom duration',
        style: TextStyle(fontSize: 11, color: AppColors.darkGreen),
      ),
    );
  }
}

class _CustomDurationDialog extends StatefulWidget {
  const _CustomDurationDialog({
    required this.selectedTime,
    required this.onChanged,
  });

  final String selectedTime;
  final ValueChanged<String> onChanged;

  @override
  State<_CustomDurationDialog> createState() => _CustomDurationDialogState();
}

class _CustomDurationDialogState extends State<_CustomDurationDialog> {
  late final TextEditingController _controller;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    final isPreset = ['10', '20', '30', '45+'].contains(widget.selectedTime);
    _controller = TextEditingController(
      text: isPreset ? '' : widget.selectedTime,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Custom duration'),
    content: TextField(
      controller: _controller,
      autofocus: true,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: 'Minutes',
        hintText: 'For example, 25',
        errorText: _errorText,
        suffixText: 'min',
      ),
      onSubmitted: (_) => _save(),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: _save,
        style: FilledButton.styleFrom(backgroundColor: AppColors.darkGreen),
        child: const Text('Apply'),
      ),
    ],
  );

  void _save() {
    final minutes = int.tryParse(_controller.text.trim());
    if (minutes == null || minutes < 1 || minutes > 240) {
      setState(() => _errorText = 'Enter a duration from 1 to 240 minutes.');
      return;
    }

    widget.onChanged('$minutes');
    Navigator.pop(context);
  }
}
