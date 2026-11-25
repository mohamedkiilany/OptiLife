import 'package:flutter/material.dart';

class MealCircleIcon extends StatelessWidget {
  const MealCircleIcon({super.key, required this.icon, required this.color});
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    width: 42,
    height: 42,
    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
    child: Icon(icon, color: color, size: 22),
  );
}

class MealStepButton extends StatelessWidget {
  const MealStepButton({super.key, required this.icon, required this.onTap, required this.background, required this.foreground});
  final IconData icon;
  final VoidCallback onTap;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(color: background, shape: BoxShape.circle),
      child: Icon(icon, size: 16, color: foreground),
    ),
  );
}

class MealInfoChip extends StatelessWidget {
  const MealInfoChip({super.key, required this.icon, required this.text, required this.background, required this.foreground});
  final IconData icon;
  final String text;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        Icon(icon, size: 16, color: foreground),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: foreground)),
      ],
    ),
  );
}

class MealMacroCard extends StatelessWidget {
  const MealMacroCard({super.key, required this.emoji, required this.label, required this.grams, required this.ratio, required this.color, required this.navy, required this.trackColor});
  final String emoji;
  final String label;
  final int grams;
  final int ratio;
  final Color color;
  final Color navy;
  final Color trackColor;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$emoji $label', style: TextStyle(fontSize: 12, color: navy)),
          const SizedBox(height: 6),
          Text('${grams}g', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: navy)),
          const SizedBox(height: 6),
          LinearProgressIndicator(value: ratio / 100, minHeight: 6, color: color, backgroundColor: trackColor, borderRadius: BorderRadius.circular(10)),
          const SizedBox(height: 6),
          Text('$ratio% ratio', style: const TextStyle(fontSize: 11, color: Colors.black54)),
        ],
      ),
    ),
  );
}

class MealSwapCard extends StatelessWidget {
  const MealSwapCard({super.key, required this.savings, required this.swapText, required this.highlight, required this.swapped, required this.money, required this.navy, required this.brown, required this.green, required this.onKeepOriginal, required this.onApplySwap});
  final double savings;
  final String swapText;
  final String highlight;
  final bool swapped;
  final String Function(double) money;
  final Color navy;
  final Color brown;
  final Color green;
  final VoidCallback onKeepOriginal;
  final VoidCallback onApplySwap;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: const Color(0xFFFFE6C7), borderRadius: BorderRadius.circular(24)),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 44, height: 44, decoration: BoxDecoration(color: const Color(0xFFF59E0B), borderRadius: BorderRadius.circular(14)), child: const Icon(Icons.savings, color: Colors.white)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('Smart Budget Swap', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: navy))),
                      Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: const Color(0xFFFFD28A), borderRadius: BorderRadius.circular(12)), child: Text('Save ${money(savings)}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: brown))),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(swapText, style: const TextStyle(fontSize: 13, color: Colors.black54)),
                  Text(highlight, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: green)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: onKeepOriginal, child: const Text('Keep Original', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54))),
            ElevatedButton.icon(
              onPressed: onApplySwap,
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF59E0B), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
              icon: Icon(swapped ? Icons.check : Icons.sync),
              label: Text(swapped ? 'Swap Applied' : 'Apply Swap', style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    ),
  );
}

class MealDetailTab extends StatelessWidget {
  const MealDetailTab({super.key, required this.text, required this.index, required this.selectedIndex, required this.onTap, required this.navy});
  final String text;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final Color navy;

  @override
  Widget build(BuildContext context) {
    final selected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          height: 54,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: selected ? Colors.white : Colors.transparent, borderRadius: BorderRadius.circular(14)),
          child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: selected ? FontWeight.bold : FontWeight.w600, color: selected ? navy : Colors.black54)),
        ),
      ),
    );
  }
}

class MealWhiteCard extends StatelessWidget {
  const MealWhiteCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: child,
  );
}

class MealIngredientCard extends StatelessWidget {
  const MealIngredientCard({super.key, required this.item, required this.money, required this.green, required this.navy, required this.brown});
  final Map<String, dynamic> item;
  final String Function(double) money;
  final Color green;
  final Color navy;
  final Color brown;

  @override
  Widget build(BuildContext context) => MealWhiteCard(
    child: Column(
      children: [
        Row(
          children: [
            item['available'] == true
                ? CircleAvatar(radius: 14, backgroundColor: green, child: const Icon(Icons.check, color: Colors.white, size: 16))
                : Container(width: 28, height: 28, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black26, width: 2))),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: navy)),
                  Text(item['detail'], style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(money((item['price'] as num).toDouble()), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: navy)),
          ],
        ),
        if (item['hint'] != null) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xFFF1EFFF), borderRadius: BorderRadius.circular(14)),
            child: Row(
              children: [
                const Icon(Icons.lightbulb_outline, size: 18, color: Color(0xFFF59E0B)),
                const SizedBox(width: 10),
                Expanded(child: Text(item['hint'], style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: brown))),
                Icon(Icons.swap_horiz, size: 20, color: brown),
              ],
            ),
          ),
        ],
      ],
    ),
  );
}

class MealInfoRow extends StatelessWidget {
  const MealInfoRow({super.key, required this.label, required this.value, required this.navy});
  final String label;
  final String value;
  final Color navy;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.black54)),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: navy)),
      ],
    ),
  );
}
