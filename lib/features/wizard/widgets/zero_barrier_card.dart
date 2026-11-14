import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class ZeroBarrierCard extends StatelessWidget {
  const ZeroBarrierCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(child: Icon(Icons.eco, color: AppColors.lightGreen)),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zero-Barrier Movement',
                  style: TextStyle(color: AppColors.lightGreen),
                ),
                Text(
                  '82% of OptiLife members hit their peak fitness results with zero equipment. Consistency beats hardware every time.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
