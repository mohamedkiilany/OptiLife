import 'package:flutter/material.dart';

enum GenerationRowStatus { complete, active, waiting }

class GenerationChecklistItem {
  const GenerationChecklistItem({required this.title, required this.detail, this.tag});
  final String title;
  final String detail;
  final String? tag;
}

class GenerationChecklistCard extends StatelessWidget {
  const GenerationChecklistCard({super.key, required this.items, required this.completedCount});

  final List<GenerationChecklistItem> items;
  final int completedCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .08), blurRadius: 12, offset: const Offset(0, 4))]),
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            _GenerationRow(item: items[i], status: i < completedCount ? GenerationRowStatus.complete : i == completedCount ? GenerationRowStatus.active : GenerationRowStatus.waiting),
            if (i != items.length - 1) const SizedBox(height: 6),
          ],
        ],
      ),
    );
  }
}

class _GenerationRow extends StatelessWidget {
  const _GenerationRow({required this.item, required this.status});
  final GenerationChecklistItem item;
  final GenerationRowStatus status;

  @override
  Widget build(BuildContext context) {
    final isComplete = status == GenerationRowStatus.complete;
    final isActive = status == GenerationRowStatus.active;
    final background = isActive ? const Color(0xFFE9EBFF) : const Color(0xFFF7F8FF);
    final ink = isActive ? const Color(0xFF006A63) : const Color(0xFF192238);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(color: isComplete ? const Color(0xFF20C765) : isActive ? const Color(0xFFB5F2E9) : const Color(0xFFEEF0F5), shape: BoxShape.circle),
            child: Icon(isComplete ? Icons.check : isActive ? Icons.refresh : Icons.schedule, size: 16, color: isComplete ? Colors.white : isActive ? const Color(0xFF00786A) : const Color(0xFF9AA49A)),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item.title, style: TextStyle(fontSize: 12, color: ink, fontWeight: FontWeight.w700)),
              if (item.tag != null) ...[
                const SizedBox(height: 3),
                Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2), decoration: BoxDecoration(color: isActive ? const Color(0xFFD3F8F1) : const Color(0xFFE5E9FA), borderRadius: BorderRadius.circular(10)), child: Text(item.tag!, style: TextStyle(fontSize: 10, color: ink, fontWeight: FontWeight.w600))),
              ],
              const SizedBox(height: 2),
              Text(item.detail, style: TextStyle(fontSize: 11, height: 1.25, color: isComplete || isActive ? const Color(0xFF536253) : const Color(0xFF9AA49A))),
            ]),
          ),
        ],
      ),
    );
  }
}
