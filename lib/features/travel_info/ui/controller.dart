import 'package:flutter/material.dart';

class TravelInfoController extends ChangeNotifier {
  TravelInfoController();

  final scrollController = ScrollController();

  int? _selectedItem;
  var _totalScroll = 0.0;
  var _baseScroll = 0.0;

  int? get selectedItem => _selectedItem;
  double get totalScroll => _totalScroll;
  double get baseScroll => _baseScroll;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void selectItem(int index) {
    _selectedItem = index;
    notifyListeners();
  }

  void updateTotalScroll(double delta, double compare) {
    if (_totalScroll + delta < 0) {
      _totalScroll = 0;
    } else if (_totalScroll + delta > compare) {
      _totalScroll = compare;
    } else {
      _totalScroll += delta;
      _baseScroll = _totalScroll / compare;
    }

    notifyListeners();
  }
}
