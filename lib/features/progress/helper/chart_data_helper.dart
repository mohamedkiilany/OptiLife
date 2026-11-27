class ChartDataHelper {
  static List<String> getWeeklyLabels() {
    const List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final DateTime now = DateTime.now();
    return List.generate(5, (index) {
      if (index == 4) return 'Today';
      final int weeksAgo = 4 - index;
      final DateTime date = now.subtract(Duration(days: weeksAgo * 7));
      return '${months[date.month - 1]} ${date.day}';
    });
  }
}
