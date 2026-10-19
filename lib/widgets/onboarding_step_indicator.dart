import 'package:flutter/material.dart';

class OnboardingStepIndicator extends StatelessWidget {
  const OnboardingStepIndicator({
    super.key,
    required this.step, 
    required this.title,
  });

  final int step;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 98.52,
          height: 22,
          decoration: BoxDecoration(
           color: Color(0xFF99EFE5) ,
           borderRadius: BorderRadius.circular(9999)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: Row(
             children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Color(0xFF006E2F),
                ),
                SizedBox(width:5),
                Text('Step $step of 8', 
                style: TextStyle(
                  color: Color(0xFF006E2F),
                   fontWeight: FontWeight.w600, fontSize: 12),),
              ],
            ),
          )),
          Spacer(),
          Text(
            title, 
          style: TextStyle(
            color: Color(0xFF6D7B6C),
            fontWeight: FontWeight.w700, 
            fontSize: 13),
            ),
      ],
    );
  }
}