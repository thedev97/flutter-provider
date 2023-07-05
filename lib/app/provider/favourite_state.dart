import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _selectedItems = [];

  List<int> get selectedItemList => _selectedItems;

  void addItem(int val) {
    _selectedItems.add(val);
    notifyListeners();
  }

  void removeItem(int val) {
    _selectedItems.remove(val);
    notifyListeners();
  }
}
