import 'package:flutter/material.dart';

class AdaptabilityCard extends StatelessWidget {
  const AdaptabilityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage('assets/images/adaptability_card_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Spacer(),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'ADAPTABILITY',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                  Text(
                    'Space-friendly \nprogressions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
