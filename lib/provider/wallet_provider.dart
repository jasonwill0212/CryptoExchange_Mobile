import 'package:flutter/material.dart';

class WalletProvider extends ChangeNotifier {
  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;
  void setSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }
}
