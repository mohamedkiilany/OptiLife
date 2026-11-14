import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class QuietApartmentMode extends StatelessWidget {
  const QuietApartmentMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightBlueBox,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.volume_off,
              color: AppColors.darkGreen,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quiet Apartment Mode',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Enabled',
                      style: TextStyle(
                        color: AppColors.darkGreen,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Automatically active for home days. Replaces heavy jumping with joint-friendly, noise- conscious micro-burn movements.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}