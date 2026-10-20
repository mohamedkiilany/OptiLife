import 'package:flutter/foundation.dart';

class ProgressSelectionController extends ChangeNotifier {
  int? _selectedIndex;

  int? get selectedIndex => _selectedIndex;
  bool get hasSelection => _selectedIndex != null;

  void select(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    notifyListeners();
  }
}
