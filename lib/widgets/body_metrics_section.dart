
import 'package:flutter/material.dart';
import 'package:optilife_app/widgets/info_box.dart';
import 'package:optilife_app/widgets/metric_input_field.dart';

class BodyMetricsSection extends StatefulWidget {
  const BodyMetricsSection({super.key});

  @override
  State<BodyMetricsSection> createState() =>
      _BodyMetricsSectionState();
}

class _BodyMetricsSectionState extends State<BodyMetricsSection> {
  String selectedSex = 'Male';

  final List<String> sexes = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                const Icon(
                  Icons.straighten,
                  color: Color(0xFF006A63),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Body Metrics',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAEDFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock_outlined,
                        color: Color(0xFF006A63),
                        size: 13,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Optional & Private',
                        style: TextStyle(
                          color: Color(0xFF006A63),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Assigned Sex
            const Text(
              'Assigned Sex for Caloric Baseline',
              style: TextStyle(
                color: Color(0xFF006A63),
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 10),

            // Sex Selection
            Container(
              padding: const EdgeInsets.all(4),
              width: double.infinity,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF1EFF6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: List.generate(sexes.length, (index) {
                  final sex = sexes[index];
                  final isSelected = selectedSex == sex;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSex = sex;
                        });
                      },
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            sex,
                            style: TextStyle(
                              color: isSelected
                                  ? const Color(0xFF131B2E)
                                  : const Color(0xFF586558),
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 16),

            // Age, Height, Weight
            Row(
              children: [
                Expanded(
                  child: MetricInputField(
                    label: 'Age',
                    unit: 'yrs',
                    initialValue: '28',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: MetricInputField(
                    label: 'Height',
                    unit: 'cm',
                    initialValue: '178',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: MetricInputField(
                    label: 'Weight',
                    unit: 'kg',
                    initialValue: '76',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            InfoBox(
              text: 'Used purely to calculate basal metabolic rate and safe exertion limits. Never shared.', 
              backgroundColor: const Color(0xffF2F3FF),
               icon: Icons.verified_user_outlined,
               iconSize: 17,
               hasCircle: false,
               textColor: const Color(0xFF3D4A3D),
               borderRadius: 8,
                horizontalPadding: 8,),
          ],
        ),
      ),
    );
  }
}
