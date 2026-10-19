import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double iconSize;
  final Color textColor;
  final double borderRadius;
  final double horizontalPadding;
  final IconData icon;
  final bool hasCircle;
  final Color iconColor;
  final Color circleBackgroundColor;

  const InfoBox({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.iconSize,
    required this.textColor,
    required this.borderRadius,
    required this.horizontalPadding,
    required this.icon,
    this.hasCircle = true,
    this.iconColor = const Color(0xff006A63),
    this.circleBackgroundColor = const Color(0xff006A63),
  });

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Icon(
      icon,
      color: hasCircle ? Colors.white : iconColor,
      size: iconSize,
    );

    if (hasCircle) {
      iconWidget = CircleAvatar(
        radius: 16,
        backgroundColor: circleBackgroundColor,
        child: iconWidget,
      );
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        crossAxisAlignment: hasCircle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          iconWidget,
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 13,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}